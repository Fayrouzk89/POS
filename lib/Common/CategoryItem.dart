import 'Product.dart';

class CategoryItem {
  final int catId;
  final String arabicName;
  final String englishName;
  final String imageUrl;
  final List<Product> categoryProducts;

  CategoryItem(this.catId, this.arabicName, this.englishName, this.imageUrl,
      this.categoryProducts);
}
