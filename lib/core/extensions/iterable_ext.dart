extension IterableExt<T> on Iterable<T> {
  /// Just like [map], but with access to the element's current index.
  ///
  /// Example
  /// ```dart
  /// [1, 2, 3].mapIndexed((number, index) => number * 2); // [2, 4, 6]
  /// ```
  Iterable<U> mapIndexed<U>(
    U Function(T currentValue, int index) transformer,
  ) sync* {
    final it = iterator;
    var index = 0;
    while (it.moveNext()) {
      yield transformer(it.current, index++);
    }
  }
}

extension FirstWhereExt<T> on List<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
