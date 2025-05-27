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
    return Padding(padding: EdgeInsets.all(10), child: 
    Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Tillbaka knapp
        
        TextButton.icon(
              onPressed: () {
                goBack(iMat, catHandler);
              },
              icon: const Icon(Icons.exit_to_app_outlined, color: Colors.black87, size: 36),
              label: const Text(
                "Tillbaka",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
        // Card(
        //   color: AppTheme.cardColor,
        //   elevation: 4,
        //   child: InkWell(
        //     child: Padding(
        //       padding:const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        //       child: 
        //         ),
        //     )
        // ),
        TextButton.icon(
              onPressed: () {
                catHandler.toggleFavorite();
                iMat.selectFavorites();
              },
              icon: const Icon(Icons.star_border_outlined, color: Color.fromARGB(221, 0, 0, 0), size: 36),
              label: const Text(
                "Favoriter",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
        // Card(
        //   color: AppTheme.cardColor,
        //   elevation: 4,
        //   child: InkWell(
        //     child: Padding(
        //       padding:const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        //       child: IconButton(onPressed: () => {catHandler.toggleFavorite(), iMat.selectFavorites()}, icon: Icon(Icons.star_border_outlined)),),
        //     )
        // ),
        SizedBox(width: 25,),
        //Text("data"),
        SizedBox(width: 500, height: 50, 
        child: ListView(
          
          scrollDirection: Axis.horizontal,
          children: [
            for (var catParent in catHandler.currentCategories.getParents())
            TextButton.icon(
              onPressed: () {
                findProducts(catParent, iMat, catHandler);
              },
              //icon: const Icon(Icons.star_border_outlined, color: Colors.black87, size: 36),
              label: Text(
                "${catParent.getName()}/",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            
            // Card(
            //   color: AppTheme.cardColor,
              
            //   child: InkWell(
            //     borderRadius: BorderRadius.circular(12),
            //     splashColor: AppTheme.splashColor,
            //     hoverColor: AppTheme.hoverColor,
            //     onTap: () => {findProducts(catParent, iMat, catHandler)},
            //     child: Padding(padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 10), 
            //     child: Text("${catParent.getName()}/", 
            //     style: const TextStyle(fontSize: AppTheme.fontMedium)),)
            //   ),
            // ),

          
        // TextButton(

        //       label: Text(
        //         catHandler.currentCategories.getName(),
        //         style: TextStyle(
        //           color: Colors.black87,
        //           fontWeight: FontWeight.w600,
        //           fontSize: 25,
        //         ),
        //       ),
        //       style: TextButton.styleFrom(
        //         backgroundColor: Colors.grey.shade200,
        //         padding: const EdgeInsets.symmetric(
        //           horizontal: 20,
        //           vertical: 12,
        //         ),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //       ),
        //     ),
        // Card(
        //       color: AppTheme.hoverColor,
              
        //       child: InkWell(
        //         borderRadius: BorderRadius.circular(12),
        //         splashColor: AppTheme.splashColor,
        //         hoverColor: AppTheme.hoverColor,
        //         child: Padding(padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 10), 
        //         child: Text(catHandler.currentCategories.getName(), 
        //         style: const TextStyle(fontSize: AppTheme.fontMedium)),)
        //       ),
        //     ),
            
            ],
        ),
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
// Widget _togglefavoriteButton(Product p, context) {
//     var iMat = Provider.of<ImatCategoryHandler>(context, listen: false);
//     var isFavorite = iMat.isFavorite(p);

//     var icon =
//         isFavorite
//             ? Icon(Icons.star, color: Colors.orange)
//             : Icon(Icons.star_border, color: Colors.orange);

//     return IconButton(
//       onPressed: () {
//         catHa.toggleFavorite(p);
//       },
//       icon: icon,
//     );
//   }
