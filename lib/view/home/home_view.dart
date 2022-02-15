import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/components/button/costom_outlined_button.dart';
import '../../core/components/button/custom_inkwell.dart';
import '../../core/components/text/high_text.dart';
import '../../core/components/text/low_text.dart';
import '../../core/components/text/normal_text.dart';
import '../../core/components/textfield/custom_textfield.dart';
import '../../core/extensions/context_extension.dart';
import '/core/base/state/base_state.dart';
import '/core/base/view/base_view.dart';
import 'model/item.dart';
import 'viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  late HomeViewModel homeViewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (context, model) {
        homeViewModel = model as HomeViewModel;
        homeViewModel.context = context;
      },
      viewModel: HomeViewModel(),
      onPageBuilder: (context) => buildScaffold(),
    );
  }

  Scaffold buildScaffold() => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: context.extraHighPadding,
                  right: context.extraHighPadding,
                  top: context.extraHighPadding,
                  bottom: context.normalPadding,
                ),
                child: searchAndFilterRow(),
              ),
              chipListBuilder(),
              context.normalSizedBoxHeight,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.extraHighPadding),
                  child: Column(
                    children: [
                      sortItemsRow(),
                      context.lowSizedBoxHeight,
                      Expanded(
                        child: postListView(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Row searchAndFilterRow() {
    return Row(
      children: [
        Expanded(
          child: searchBar(),
        ),
        context.normalSizedBoxWidth,
        filterButton(),
      ],
    );
  }

  CustomTextField searchBar() {
    return CustomTextField(
      hintText: 'Nerede ev arıyorsunuz',
      isDense: true,
      prefixIconConstraints: const BoxConstraints(maxHeight: 20),
      contentPadding: EdgeInsets.all(context.normalPadding),
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: context.normalPadding),
        child: Icon(Icons.search, size: context.normalIconSize),
      ),
    );
  }

  CustomOutlinedButton filterButton() {
    return CustomOutlinedButton(
      borderColor: context.defaultTextColor.withOpacity(0.3),
      onPressed: () {},
      minHeight: context.dynamicHeight(0.042),
      minWith: context.dynamicHeight(0.05),
      padding: EdgeInsets.all(context.lowPadding),
      child: Icon(
        FontAwesomeIcons.slidersH,
        color: context.theme.primaryColor.withOpacity(0.8),
        size: context.normalIconSize,
      ),
    );
  }

  SizedBox chipListBuilder() {
    return SizedBox(
      height: context.dynamicHeight(0.05),
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? context.extraHighPadding : 0, right: context.normalPadding),
            child: Chip(
              deleteIcon: Icon(
                Icons.cancel_rounded,
                color: context.defaultTextColorReversed,
                size: context.highIconSize,
              ),
              backgroundColor: context.theme.primaryColor,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
              onDeleted: () {},
              label: LowText(
                'Site içinde',
                color: context.defaultTextColorReversed,
              ),
            ),
          );
        },
      ),
    );
  }

  Row sortItemsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NormalText(
          '14 SONUÇ',
          color: context.defaultTextColor.withOpacity(0.6),
        ),
        Row(
          children: [
            NormalText(
              'İlanları Sırala',
              color: context.defaultTextColor.withOpacity(0.6),
            ),
            context.normalSizedBoxWidth,
            Icon(
              Icons.sort,
              size: context.lowIconSize,
              color: context.defaultTextColor.withOpacity(0.6),
            )
          ],
        ),
      ],
    );
  }

  ListView postListView() {
    return ListView.builder(
      itemCount: homeViewModel.itemList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = homeViewModel.itemList[index];
        return SizedBox(
          height: context.dynamicHeight(0.4),
          child: postCard(item),
        );
      },
    );
  }

  Card postCard(Item item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.highRadius)),
      child: Column(
        children: [
          Expanded(
            child: postImage(item),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(context.highPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemPrice(item),
                  context.normalSizedBoxHeight,
                  HighText(item.address!),
                  context.normalSizedBoxHeight,
                  NormalText(item.description!),
                  context.normalSizedBoxHeight,
                  itemFirstPrice(item),
                  context.normalSizedBoxHeight,
                  itemAreaM2Row(item),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget postImage(Item item) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.highRadius),
            image: item.img != null ? DecorationImage(image: NetworkImage(item.img!), fit: BoxFit.fill) : null,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CustomInkwell(
              onTap: () {},
              child: Icon(
                Icons.favorite,
                color: Colors.grey.shade600,
                size: context.highIconSize,
              )),
        ),
      ],
    );
  }

  Row itemPrice(Item item) {
    return Row(
      children: [
        HighText(item.price!, bold: true),
        const HighText(' / Aylık', bold: true),
        context.lowSizedBoxWidth,
        Icon(
          Icons.verified,
          color: Colors.greenAccent,
          size: context.normalIconSize,
        )
      ],
    );
  }

  Row itemFirstPrice(Item item) {
    return Row(
      children: [
        const LowText('İlk kiralama bedeli:'),
        context.lowSizedBoxWidth,
        LowText(item.firstPrice!),
      ],
    );
  }

  Row itemAreaM2Row(Item item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            HighText(item.areaM2!, bold: true),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HighText('m', bold: true),
                LowText('2', bold: true),
              ],
            ),
            context.lowSizedBoxWidth,
            const HighText('Net', bold: true),
          ],
        ),
        Row(
          children: [
            HighText(item.areaType!),
          ],
        )
      ],
    );
  }
}
