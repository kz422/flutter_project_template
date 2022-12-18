extension ListExtensions on List {
  List<T> firstThree<T>() {
    if (length == 1) {
      return sublist(0,1) as List<T>;
    } else if (length == 2) {
      return sublist(0,2) as List<T>;
    }
    return sublist(0,3) as List<T>;
  }
}
