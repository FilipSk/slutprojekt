import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/model/imat_data_handler.dart';
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
          //Tillbaka knapp
          ElevatedButton.icon(
                      onPressed: () {
                catHandler.toggleFavorite();
                 goBack(iMat,catHandler);
              },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Tillbaka'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
          
        // Card(
        //   color: AppTheme.cardColor,
        //   elevation: 4,
        //   child: InkWell(
        //     child: Padding(
        //       padding:const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        //       child: IconButton(onPressed: () => {catHandler.toggleFavorite(), goBack(iMat,catHandler)}, icon: Icon(Icons.exit_to_app_outlined)),),
        //     )
        // ),
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
