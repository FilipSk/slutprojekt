import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  final ICategory category;
  //final List<ProductCategory> subCategories;
  const Category(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var catHandler = context.watch<ImatCategoryHandler>();
    
    return GestureDetector(
      onTap: () => {findProducts(category, iMat, catHandler)},
      child: 
    Card(
      child: Column(
        children: [
          Text(
            category.getName(),
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),

          )],
      ),
    ),);
  }
  void findProducts(ICategory category, ImatDataHandler iMat, ImatCategoryHandler catHandler){
    catHandler.changeCategory(category);
    List<Product> list = [];
    List<ProductCategory> productCats = catHandler.currentCategories.getProductCategories();

    for (var cat in productCats) {
      list += iMat.findProductsByCategory(cat);
    }
    iMat.selectSelection(list);
  }
}