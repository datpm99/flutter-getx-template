extension StringEx on String {
  String capitalize() {
    try {
      return toUpperCase();
    } catch (e) {
      return this;
    }
  }

  ///Returns first letter of the string as Caps eg -> Flutter
  String firstLetterUpperCase() => length > 1
      ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
      : this;
}
