List<String> categories = [
  'general',
  'entertainment',
  'health',
  'sports',
  'business',
  'technology'
];
class CategoryModel {
  String image;
  String name;

  CategoryModel({
    required this.image,
    required this.name,
  });
}

List<CategoryModel> categoryList=[
  CategoryModel(name: 'General', image: 'assets/categories/general.jpeg'),
  CategoryModel(name: 'Entertainment', image: 'assets/categories/entertainment.jpg'),
  CategoryModel(name: 'Health', image: 'assets/categories/health.jpg'),
  CategoryModel(name: 'Sports', image: 'assets/categories/sports.jpg'),
  CategoryModel(name: 'Business', image: 'assets/categories/bussiness.png'),
  CategoryModel(name: 'Technology', image: 'assets/categories/technolgy.jpg')
];