class CategoryModel {
  String? name;
  String? image;
  String? category;

  CategoryModel({this.name, this.image, this.category});
}

List<CategoryModel> list_category = [
  CategoryModel(
      name: "Electronics",
      image: "assets/images/electronic.png",
      category: "electronics"),
  CategoryModel(
      name: "Jewelery", image: "assets/images/jeve.png", category: "jewelery"),
  CategoryModel(
      name: "Men's ",
      image: "assets/images/man.png",
      category: "men's clothing"),
  CategoryModel(
      name: "Women's",
      image: "assets/images/gril.png",
      category: "women'sclothing"),
  CategoryModel(
      name: "All",
      image: "assets/images/all.png",
      category: "all"),
];
