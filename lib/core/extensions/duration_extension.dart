extension DurationExtension on Duration {
  String formatDuration() {
    String text = '';
    if (inHours != 0) {
      if (inHours < 10) {
        text += '0';
      }
      text += "$inHours:";
    }
    if (inMinutes.remainder(60) < 10) {
      text += '0';
    }
    text += "${inMinutes.remainder(60)}:";

    if (inSeconds.remainder(60) < 10) {
      text += '0';
    }
    text += "${inSeconds.remainder(60)}";

    return text;
  }
}
