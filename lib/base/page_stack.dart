class PageStack {
  static Map<String, List<String>> tags = {};

  static void push(String tagSymbol) {
    if (!tags.keys.contains(tagSymbol)) {
      tags[tagSymbol] = [];
    }
    tags[tagSymbol]!.add("$tagSymbol${tags[tagSymbol]!.length}");
  }

  static void pop(String tagSymbol) {
    tags[tagSymbol]!.removeLast();
    if (tags[tagSymbol]!.isEmpty) {
      tags.remove(tagSymbol);
    }
  }

  static String current(String tagSymbol) {
    return tags[tagSymbol]!.last;
  }
}
