import 'package:flutter/material.dart';
import '../text/normal_text.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../init/language/locale_keys.g.dart';

import '../text/high_text.dart';
import 'country_code.dart';
import 'country_codes.dart';
import 'country_localizations.dart';

Future<void> showSelectionAlertDialog(
    {required BuildContext context, required Function(CountryCode countryCode) onSelect}) async {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(context.normalRadius))),
      insetPadding: EdgeInsets.all(context.extraHighPadding),
      contentPadding:
          EdgeInsets.only(left: context.extraHighPadding, right: context.extraHighPadding, bottom: context.highPadding),
      title: dialogTitle(context),
      titlePadding: EdgeInsets.only(
        left: context.normalPadding,
        right: context.normalPadding,
        top: context.highPadding,
        bottom: context.lowPadding,
      ),
      content: SizedBox(
        width: context.dynamicWidth(0.8),
        height: context.dynamicHeight(0.6),
        child: CountyCodeSelectionDialog(
          onSelect: onSelect,
        ),
      ),
    ),
  );
}

Row dialogTitle(BuildContext context) {
  return Row(
    children: [
      InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Icon(
          Icons.cancel_rounded,
          color: context.theme.primaryColor.withOpacity(0.5),
          size: context.highIconSize,
        ),
      ),
      context.normalSizedBoxWidth,
      HighText(
        LocaleKeys.selectCountry.locale,
        bold: true,
      ),
    ],
  );
}

/// selection dialog used for selection of the country code
class CountyCodeSelectionDialog extends StatefulWidget {
  final Function(CountryCode countryCode) onSelect;
  const CountyCodeSelectionDialog({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountyCodeSelectionDialogState();
}

class _CountyCodeSelectionDialogState extends State<CountyCodeSelectionDialog> {
  late List<CountryCode> filteredElements;
  late List<CountryCode> elements;

  @override
  void initState() {
    elements = codes.map((json) => CountryCode.fromJson(json)).toList();
    filteredElements = elements;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.normalPadding),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(context.normalRadius),
                  borderSide: BorderSide(color: context.defaultTextColor.withOpacity(0.6)),
                ),
                contentPadding: EdgeInsets.all(context.normalPadding),
                isDense: true,
                prefixIconConstraints: const BoxConstraints(maxHeight: 20),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: context.normalPadding),
                  child: Icon(Icons.search, size: context.normalIconSize),
                ),
                hintText: LocaleKeys.searchWithCountyNameOrCode.locale,
                hintStyle: TextStyle(
                  color: context.defaultTextColor.withOpacity(0.6),
                  fontFamily: context.getDefaultFontFamily,
                  fontSize: context.normalTextSize,
                ),
              ),
              onChanged: _filterElements,
            ),
          ),
          Expanded(
            child: filteredElements.isNotEmpty
                ? Scrollbar(
                    isAlwaysShown: true,
                    child: ListView.builder(
                      itemCount: filteredElements.length,
                      itemBuilder: (context, index) {
                        final element = filteredElements[index];
                        return SimpleDialogOption(
                          child: _buildCountry(element),
                          padding: EdgeInsets.symmetric(vertical: context.normalPadding, horizontal: context.normalPadding),
                          onPressed: () {
                            _selectItem(element);
                          },
                        );
                      },
                    ),
                  )
                : _buildEmptySearchWidget(context),
          ),
        ],
      );

  Widget _buildCountry(CountryCode countryCode) {
    return Row(
      children: [
        NormalText(
          countryCode.toString(),
          bold: true,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.normalPadding),
            child: Text(
              countryCode.toCountryStringOnly(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                  fontSize: context.normalTextSize,
                  color: context.defaultTextColor,
                  fontFamily: context.getDefaultFontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if (countryCode.flagUri != null)
          Image.asset(
            countryCode.flagUri!,
            width: context.extraHighIconSize,
          ),
      ],
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    return Center(
      child: Text(CountryLocalizations.of(context)?.translate('no_country') ?? 'No country found'),
    );
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements =
          elements.where((e) => e.code!.contains(s) || e.dialCode!.contains(s) || e.name!.toUpperCase().contains(s)).toList();
    });
  }

  void _selectItem(CountryCode e) {
    Navigator.pop(context, e);
    widget.onSelect(e);
  }
}
