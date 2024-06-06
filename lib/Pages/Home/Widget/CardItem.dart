import 'package:flutter/material.dart';
import 'package:pos/Common/Product.dart';
import 'package:pos/Helper/LocalDataHelper.dart';
import 'package:pos/Utils/colors.dart';
import 'package:pos/Utils/style.dart';

class CardItem extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final Product product;
  final int index;
  final void Function(GlobalKey) onClick;

  CardItem(
      {super.key,
      required this.onClick,
      required this.index,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(widgetKey);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  key: widgetKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        product.image,
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(LocalDataHelper.getProductName(product),
                    style: foodNameText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text(LocalDataHelper.formatPrice(product.price),
                    style: priceText),
              ],
            ),
            (LocalDataHelper.lang == "ar")
                ? Positioned(
                    top: 10,
                    left: 10,
                    child: (product.sold != 0)
                        ? buildSold(product)
                        : SizedBox(width: 0))
                : Positioned(
                    top: 10,
                    right: 10,
                    child: (product.sold != 0)
                        ? buildSold(product)
                        : SizedBox(width: 0))
          ],
        ),
      ),
    );
  }

  Widget buildSold(Product product) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(
          color: helperColor, borderRadius: BorderRadius.circular(50)),
      child: Text('-' + LocalDataHelper.formatPrice(product.sold) + '%',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
    );
  }
}
