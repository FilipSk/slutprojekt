import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

// class HoverableCard extends StatefulWidget{
//   final ICategory category;
//   final Product image;
//   const HoverableCard(this.category, this.image,{super.key});
  
//   @override
//   State<StatefulWidget> createState() => Category();

  
// }

class Category extends StatelessWidget {
  final ICategory category;
  final Product image;
  //final List<ProductCategory> subCategories;
  const Category(this.category, this.image, {super.key});
  //bool isHovered = true;

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var catHandler = context.watch<ImatCategoryHandler>();
    
    return Card(
      color: AppTheme.cardColor,
      child: InkWell(
        
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        splashColor: AppTheme.splashColor,
        hoverColor: AppTheme.hoverColor,
        onTap: () => {findProducts(category, iMat, catHandler)},
        child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
        //spacing: AppTheme.paddingMediumSmall,
        children: [
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            child: iMat.getImage(image),
          )
          ),
          Text(
            category.getName(),
            style: const TextStyle(fontSize: AppTheme.fontLarge, fontWeight: FontWeight.bold),

          )],
      ),)
        
      )
      
    );
  }

  void findProducts(
    ICategory category,
    ImatDataHandler iMat,
    ImatCategoryHandler catHandler,
  ) {
    catHandler.changeCategory(category);
    List<Product> list = [];
    List<ProductCategory> productCats =
        catHandler.currentCategories.getProductCategories();

    for (var cat in productCats) {
      list += iMat.findProductsByCategory(cat);
    }
    iMat.selectSelection(list);
  }
}
