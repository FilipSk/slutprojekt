import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var catHandler = context.watch<ImatCategoryHandler>();
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Tillbaka knapp
        Card(
          color: AppTheme.cardColor,
          elevation: 4,
          child: InkWell(
            child: Padding(
              padding:const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              child: IconButton(onPressed: () => goBack(iMat, catHandler), icon: Icon(Icons.exit_to_app_outlined)),),
            )
          ),
        SizedBox(width: 50,),
        //Text("data"),
        SizedBox(width: 800, height: 65, 
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var catParent in catHandler.currentCategories.getParents())
            Card(
              color: AppTheme.cardColor,
              
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                splashColor: AppTheme.splashColor,
                hoverColor: AppTheme.hoverColor,
                onTap: () => {findProducts(catParent, iMat, catHandler)},
                child: Padding(padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 10), 
                child: Text("${catParent.getName()}/", 
                style: const TextStyle(fontSize: AppTheme.fontMedium)),)
              ),
            ),

          
        
        Card(
              color: AppTheme.hoverColor,
              
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                splashColor: AppTheme.splashColor,
                hoverColor: AppTheme.hoverColor,
                child: Padding(padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 10), 
                child: Text(catHandler.currentCategories.getName(), 
                style: const TextStyle(fontSize: AppTheme.fontMedium)),)
              ),
            ),],
        ),
        ),
        ]
      );
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
    catHandler.changeCategory(catHandler.currentCategories.getParent());
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
