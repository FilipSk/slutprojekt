import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/Buttons/icon_text_button.dart';
import 'package:provider/provider.dart';

class FavNavBar extends StatelessWidget {
  const FavNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var catHandler = context.watch<ImatCategoryHandler>();
    return Padding(padding: EdgeInsets.all(10), 
    child: 
    Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonIconText(
                text: Text("Tillbaka", style: TextStyle(color: Colors.white, fontSize: AppTheme.fontMedium),),
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
                onPressed: () {
                catHandler.toggleFavorite();
                 goBack(iMat,catHandler);
              },
                color: Colors.red,
              ),
        ]
      ),);
  }
  void findProducts(
    ICategory category,
    ImatDataHandler iMat,
    ImatCategoryHandler catHandler,
  ) {
    catHandler.changeCategory(category);
    if(catHandler.currentCategories.getStart()){
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
  String rubrik(ImatCategoryHandler catHandler){
    return catHandler.currentCategories.getName();
  }
}
void goBack(ImatDataHandler iMat, ImatCategoryHandler catHandler){
    if(catHandler.currentCategories.getStart()){
      iMat.selectAllProducts();
      return;
    }
    List<Product> list = [];
    List<ProductCategory> productCats = catHandler.currentCategories.getProductCategories();

    for (var cat in productCats) {
      list += iMat.findProductsByCategory(cat);
    }
    iMat.selectSelection(list);
  }
