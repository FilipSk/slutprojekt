import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/Buttons/icon_text_button.dart';
import 'package:imat_app/widgets/Buttons/text_button.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var catHandler = context.watch<ImatCategoryHandler>();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonIconText(
            text: Text(
              "Favoriter",
              style: TextStyle(
                color: Colors.black,
                fontSize: AppTheme.fontMedium,
              ),
            ),
            icon: Icon(
              Icons.star_border_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              catHandler.toggleFavorite();
              iMat.selectFavorites();
            },
            color: const Color.fromARGB(255, 253, 242, 145),
          ),
          SizedBox(width: 10),
          if (!catHandler.currentCategories.getStart())
            ButtonIconText(
              text: Text(
                "Tillbaka",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppTheme.fontMedium,
                ),
              ),
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => goBack(iMat, catHandler),
              color: AppTheme.secondaryThemeColor,
            ),

          SizedBox(width: 10),
          //Text("data"),
          SizedBox(
            width: 560,
            height: 50,
            child: Row(
              //scrollDirection: Axis.horizontal,
              children: [
                for (var catParent in catHandler.currentCategories.getParents())
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ButtonText(
                      text: Text(
                        "${catParent.getName()}/",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed:
                          () => findProducts(catParent, iMat, catHandler),
                      color: AppTheme.cardColor,
                      size: AppTheme.fontMedium,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton.icon(
                    onPressed: null,
                    label: Text(
                      catHandler.currentCategories.getName(),
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: AppTheme.fontNavBar,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(
                        fontSize: AppTheme.fontNavBar,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void findProducts(
    ICategory category,
    ImatDataHandler iMat,
    ImatCategoryHandler catHandler,
  ) {
    catHandler.changeCategory(category);
    if (catHandler.currentCategories.getStart()) {
      iMat.selectAllProducts();
      return;
    }
    List<Product> list = [];
    List<ProductCategory> productCats =
        catHandler.currentCategories.getProductCategories();

    for (var cat in productCats) {
      list += iMat.findProductsByCategory(cat);
    }
    iMat.selectSelection(list);
  }

  String rubrik(ImatCategoryHandler catHandler) {
    return catHandler.currentCategories.getName();
  }

  Widget _backButton(context) {
    var iMat = Provider.of<ImatCategoryHandler>(context, listen: false);
    bool start = false;
    if (iMat.currentCategories.getStart()) {
      start = true;
    }

    var icon =
        start
            ? const Icon(
              Icons.star,
              color: Colors.orange,
              size: AppTheme.iconHuge,
            )
            : const Icon(
              Icons.star_border,
              color: Colors.orange,
              size: AppTheme.iconHuge,
            );
    return Placeholder();
  }
}

void goBack(ImatDataHandler iMat, ImatCategoryHandler catHandler) {
  catHandler.changeCategory(catHandler.currentCategories.getParent());
  if (catHandler.currentCategories.getStart()) {
    iMat.selectAllProducts();
    return;
  }
  List<Product> list = [];
  List<ProductCategory> productCats =
      catHandler.currentCategories.getProductCategories();

  for (var cat in productCats) {
    list += iMat.findProductsByCategory(cat);
  }
  iMat.selectSelection(list);
}
