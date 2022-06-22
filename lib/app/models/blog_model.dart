class BlogsModel {
  late String id, title, description, image;

  BlogsModel(
      {required this.description,
      required this.title,
      required this.id,
      required this.image});

  BlogsModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    image = map['img'];
  }
}
