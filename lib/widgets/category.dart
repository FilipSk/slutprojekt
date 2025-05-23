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
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      //onHover:, omg omg
      //onEnter: (context) => setState(() => isHovered = true ),
      //onExit: (context) => setState(() => isHovered = false ),
      child: GestureDetector(
      onTap: () => {findProducts(category, iMat, catHandler)},
      child: 
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
        //side: BorderSide(color: Colors.black,width: 0.2,)
      ),
      //color: isHovered ? AppTheme.hoverColor : AppTheme.cardColor,
      child: Column(
        spacing: AppTheme.paddingMediumSmall,
        children: [
          Expanded(child: iMat.getImage(image)),
          Text(
            category.getName(),
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),

          )],
      ),
    ),),
    )
    ;
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
