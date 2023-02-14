class SortUtil {
  static List<T> sort<T, S>(Comparable<S> Function(dynamic d) getField,
      List<T> values, bool ascending) {
    values.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    return values;
  }
}
