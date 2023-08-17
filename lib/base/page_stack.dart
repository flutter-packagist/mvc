class PageStack {
  static int page = 0;

  static List<String> tags = [];

  static void push() {
    String tag = "page${page++}";
    tags.add(tag);
  }

  static void pop() {
    tags.removeLast();
  }

  static String get current {
    return tags.last;
  }
}
