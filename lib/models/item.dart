class Item {
  int id;
  String title;
  String subtitle;
  String imgUrl;
  bool isFav;

  Item({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imgUrl,
    this.isFav = false,
  });


  toggleIsFav(){
    isFav = !isFav;
  }
}
