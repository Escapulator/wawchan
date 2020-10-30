class Journal {
  int id;
  String chapter;
  String post;
  String name;
  String category;

  journalMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['chapter'] = chapter;
    mapping['post'] = post;
    mapping['name'] = name;
    mapping['category'] = category;

    return mapping;
  }
}
