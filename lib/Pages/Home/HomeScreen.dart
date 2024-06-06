import 'package:flutter/material.dart';
import 'package:pos/Common/CategoryItem.dart';
import 'package:pos/Helper/LocalDataHelper.dart';
import 'package:pos/Utils/colors.dart';
import 'package:pos/Utils/style.dart';
import 'Drawer/custom_drawer.dart';
import 'Widget/CardItem.dart';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<HomeScreen> {
  int _selectedIndex = 0;
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      // To send the library the location of the Cart icon
      cartKey: cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation) {
        // You can run the animation by addToCartAnimationMethod, just pass trough the the global key of  the image as parameter
        this.runAddToCartAnimation = runAddToCartAnimation;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        key: _scaffoldKey,
        drawer: CustomDrawer(
          currentPage: DrawerSections.home,
        ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 20,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            iconSize: 21,
            icon: Icon(Icons.menu, size: SizeIcon, color: titleColor),
          ),
          backgroundColor: primaryColor,
          title: Text('app_name'.tr(),
              style: categoryText, textAlign: TextAlign.center),
          actions: [
            //  Adding 'clear-cart-button'
            IconButton(
              icon: const Icon(
                Icons.cleaning_services,
                color: titleColor,
                size: SizeIcon,
              ),
              onPressed: () {
                _cartQuantityItems = 0;
                cartKey.currentState!.runClearCartAnimation();
              },
            ),
            const SizedBox(width: 3),
            AddToCartIcon(
              key: cartKey,
              icon: const Icon(
                Icons.shopping_cart,
                color: titleColor,
                size: SizeIcon,
              ),
              badgeOptions: const BadgeOptions(
                active: true,
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: storeTab(context),
      ),
    );
  }

  Widget storeTab(BuildContext context) {
    return ListView(children: <Widget>[
      headerTopCategories(),
      SizedBox(
        height: 20,
      )
    ]);
  }

  Widget sectionHeader(String headerTitle, {onViewMore}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10, right: 15),
          child: Text(headerTitle, style: h4),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 2, right: 15),
          child: TextButton(
            onPressed: onViewMore,
            child: Text('View_all'.tr(), style: contrastText),
          ),
        )
      ],
    );
  }

  Widget headerTopCategories() {
    if (LocalDataHelper.CategoryItems.length == 0) {
      LocalDataHelper.CategoryItems = LocalDataHelper.buildCategory();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader('All_Categories'.tr(), onViewMore: () {}),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.31,
          child: ListView.builder(
            itemCount: LocalDataHelper.CategoryItems.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return headerCategoryItem(LocalDataHelper.CategoryItems[index]);
            },
          ),
        ),
        deals(LocalDataHelper.CategoryItems[_selectedIndex])
      ],
    );
  }

  Widget headerCategoryItem(CategoryItem categoryItem) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.23,
              height: MediaQuery.of(context).size.width * 0.23,
              child: FloatingActionButton(
                shape: CircleBorder(),

                elevation: (_selectedIndex == categoryItem.catId - 1) ? 20 : 5,
                // Set the elevation for the
                heroTag: LocalDataHelper.getName(categoryItem),
                onPressed: () {
                  setState(() {
                    _selectedIndex = categoryItem.catId - 1;
                  });
                },
                backgroundColor: white,
                child: Image.asset(categoryItem.imageUrl,
                    width: MediaQuery.of(context).size.width * 0.13),
              )),
          Text(LocalDataHelper.getName(categoryItem) + ' ›',
              style: categoryText)
        ],
      ),
    );
  }

  Widget deals(CategoryItem categoryItem) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          sectionHeader(LocalDataHelper.getName(categoryItem),
              onViewMore: () {}),
          BuildItems(categoryItem)
        ],
      ),
    );
  }

  Widget BuildItems(CategoryItem categoryItem) {
    return ResponsiveGridList(
        desiredItemWidth: 150,
        minSpacing: 10,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
                categoryItem.categoryProducts.length, (index) => index)
            .map((index) {
          return SizedBox(
            height: 220,
            child: CardItem(
              onClick: listClick,
              index: index,
              product: categoryItem.categoryProducts[index],
            ),
          );
        }).toList());
  }

  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
    await cartKey.currentState!
        .runCartAnimation((++_cartQuantityItems).toString());
  }
}
