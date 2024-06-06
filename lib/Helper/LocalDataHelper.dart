import 'package:pos/Common/CategoryItem.dart';
import 'package:pos/Common/Product.dart';
import 'SharedPrefs.dart';

class LocalDataHelper {
  static String lang = "en";
  static String getName(CategoryItem categoryItem) {
    if (LocalDataHelper.lang == "ar") {
      return categoryItem.arabicName;
    }
    return categoryItem.englishName;
  }
  static bool login()
  {
    return false;
  }
  static String getProductName(Product Item) {
    if (LocalDataHelper.lang == "ar") {
      return Item.name;
    }
    return Item.englishName;
  }

  static List<CategoryItem> CategoryItems = [];

  static List<CategoryItem> buildCategory() {
    List<CategoryItem> categoryItems = [];
    List<Product> categoryProducts = buildCat1Items();
    CategoryItem cat1 = CategoryItem(1, "الأثاث", "Furniture",
        "assets/temp/CategoryItem/cat1.png", categoryProducts);
    categoryItems.add(cat1);
    categoryProducts = buildCat2Items();
    cat1 = CategoryItem(2, "العطورات", "Perfumes",
        "assets/temp/CategoryItem/cat2.png", categoryProducts);
    categoryItems.add(cat1);
    categoryProducts = buildCat3Items();
    cat1 = CategoryItem(3, "الحقائب", "Bags",
        "assets/temp/CategoryItem/cat3.png", categoryProducts);
    categoryItems.add(cat1);
    categoryProducts = buildCat4Items();
    cat1 = CategoryItem(4, "الملابس", "Clothes",
        "assets/temp/CategoryItem/cat4.jpeg", categoryProducts);
    categoryItems.add(cat1);
    return categoryItems;
  }

  static List<Product> buildCat1Items() {
    List<Product> categoryProducts = [];
    Product product = Product(
        1, "رفوف الكتب", "Book Case", "assets/temp/cat1/book_case@2x.png", 100);
    categoryProducts.add(product);
    product = Product(2, "فناجين شاي", "Class Package",
        "assets/temp/cat1/class_package@2x.png", 150);
    product.sold = 20;
    categoryProducts.add(product);
    product = Product(3, "صوفة جلوس", "Detail Sofa",
        "assets/temp/cat1/detail_sofa.png", 3200);
    product.sold = 10;
    categoryProducts.add(product);
    product = Product(4, "كراسي جلوس", "Foam Padded Chair",
        "assets/temp/cat1/foam_padded_chair@2x.png", 2000);
    categoryProducts.add(product);
    product = Product(5, "ضوء كبير", "Lamp", "assets/temp/cat1/lamp.png", 300);
    product.sold = 10;
    categoryProducts.add(product);
    product =
        Product(6, "كرسي مكتبي", "Sofa", "assets/temp/cat1/sofa.png", 2300);
    categoryProducts.add(product);
    return categoryProducts;
  }

  static List<Product> buildCat2Items() {
    List<Product> categoryProducts = [];
    Product product = Product(
        1, "ديور", "Miss Dior", "assets/temp/cat2/miss_dior_0.png", 120);
    categoryProducts.add(product);
    product = Product(
        2, "ديور", "Miss Dior", "assets/temp/cat2/miss_dior_1.png", 150);
    categoryProducts.add(product);
    product = Product(
        3, "ديور", "Miss Dior", "assets/temp/cat2/miss_dior_2.png", 155);
    categoryProducts.add(product);
    product.sold = 30;
    product =
        Product(4, "جادور", "Jadore 0", "assets/temp/cat2/j_adore_0.png", 123);
    categoryProducts.add(product);
    product =
        Product(5, "جادور", "Jadore", "assets/temp/cat2/j_adore_1.png", 123);
    categoryProducts.add(product);
    product = Product(
        6, "فالنتين", "Valentino", "assets/temp/cat2/valentino_0.png", 123);
    categoryProducts.add(product);
    product =
        Product(7, "غوتشي", "Gucci 0", "assets/temp/cat2/gucci_0.png", 190);
    product.sold = 15;
    categoryProducts.add(product);
    product =
        Product(8, "غوتشي", "Gucci 1", "assets/temp/cat2/gucci_1.png", 123);
    product.sold = 10;
    categoryProducts.add(product);
    return categoryProducts;
  }

  static List<Product> buildCat3Items() {
    List<Product> categoryProducts = [];
    Product product =
        Product(1, "حقيبة يد", "Bag 1", "assets/temp/cat3/bag_1.png", 500);
    categoryProducts.add(product);
    product =
        Product(2, "حقيبة يد", "Bag 2", "assets/temp/cat3/bag_2.png", 700);
    categoryProducts.add(product);
    product =
        Product(3, "حقيبة يد", "Bag 3", "assets/temp/cat3/bag_3.png", 800);
    product.sold = 40;
    categoryProducts.add(product);
    product =
        Product(4, "حقيبة يد", "Bag 4", "assets/temp/cat3/bag_4.png", 256);
    categoryProducts.add(product);
    product =
        Product(5, "حقيبة يد", "Bag 5", "assets/temp/cat3/bag_5.png", 234);
    product.sold = 30;
    categoryProducts.add(product);
    product =
        Product(6, "حقيبة يد", "Bag 6", "assets/temp/cat3/bag_6.png", 244);
    product.sold = 10;
    categoryProducts.add(product);

    return categoryProducts;
  }

  static List<Product> buildCat4Items() {
    List<Product> categoryProducts = [];
    Product product = Product(
        1, "سترة رجالي", "Blazer ", "assets/temp/cat4/blazer1.jpeg", 134);
    categoryProducts.add(product);
    product = Product(
        2, "سترة نسائي", "Blazer ", "assets/temp/cat4/blazer2.jpeg", 222);
    product.sold = 15;
    categoryProducts.add(product);
    product = Product(
        3, "فستان نسائي", "Dress", "assets/temp/cat4/dress2.jpeg", 2344);
    categoryProducts.add(product);
    product =
        Product(4, "بنطلون رجالي", "Pants", "assets/temp/cat4/pants1.jpg", 234);
    categoryProducts.add(product);
    product = Product(
        5, "بنطلون رجالي", "Pants", "assets/temp/cat4/pants2.jpeg", 223);
    product.sold = 10;
    categoryProducts.add(product);

    return categoryProducts;
  }

  static String formatPrice(double price) {
    if (price % 1 == 0) {
      return price.toInt().toString();
    } else {
      return price.toStringAsFixed(2);
    }
  }
}
