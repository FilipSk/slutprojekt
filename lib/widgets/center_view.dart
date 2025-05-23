import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/categories.dart';
import 'package:imat_app/widgets/products.dart';
import 'package:provider/provider.dart';

class Centerview extends StatelessWidget {
  const Centerview({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var catHandler = context.watch<ImatCategoryHandler>();

    return Column(children: [
      GestureDetector(
        onTap: () => goBack(iMat,catHandler),
        child: SizedBox(width: 200,height: 50, child: Text(rubrik(catHandler))),
      ),
       SizedBox( width: 1100, height: 900, child: Products()
       )
       ],);
    
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
  String rubrik(ImatCategoryHandler catHandler){
    return catHandler.currentCategories.getName();
  }
}
