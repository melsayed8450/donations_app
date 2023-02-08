class Creator {
  final name;
  final title;
  final image_path;
  final color;
  final id;
  bool isFav;
  Creator(
      {required this.name,
      required this.title,
      required this.image_path,
      required this.color,
      required this.id,
      this.isFav = false});
}
