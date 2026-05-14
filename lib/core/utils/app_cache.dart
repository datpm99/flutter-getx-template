class AppCache {
  static final AppCache _singleton = AppCache._internal();

  factory AppCache() {
    return _singleton;
  }

  AppCache._internal();
}
