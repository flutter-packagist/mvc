class PageStack {
  static Map<String, List<String>> tags = {};
  static Map<String, int> tagsAutoIncrease = {};

  static String push(String tagSymbol) {
    if (!tags.keys.contains(tagSymbol)) {
      tags[tagSymbol] = [];
      tagsAutoIncrease[tagSymbol] = 0;
    }
    String tagSort = "-sort-${tagsAutoIncrease[tagSymbol]}";
    String tag = "$tagSymbol$tagSort";
    tags[tagSymbol]!.add(tag);
    tagsAutoIncrease[tagSymbol] = (tagsAutoIncrease[tagSymbol] ?? 0) + 1;
    return tag;
  }

  static void pop(String tagSymbol, String? value) {
    tags[tagSymbol]!.remove(value);
    if (tags[tagSymbol]!.isEmpty) {
      tags.remove(tagSymbol);
      tagsAutoIncrease.remove(tagSymbol);
    }
  }

  static String? current(String tagSymbol) {
    return tags[tagSymbol]?.last;
  }
}
