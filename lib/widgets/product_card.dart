import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ImatDataHandler iMat;

  const ProductCard(this.product, this.iMat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.cardColor,
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        splashColor: AppTheme.splashColor,
        hoverColor: AppTheme.hoverColor,
        onTap: () {},
        child: Padding(
        //padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),

        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.borderRadius),
              child: iMat.getImage(product),)
            
            ),
            const SizedBox(height: 8),
            Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppTheme.fontMedium)),
            Text('${product.price.toStringAsFixed(2)} kr', style: TextStyle(fontSize: AppTheme.fontMedium)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => {
                  iMat.shoppingCartUpdate(ShoppingItem(product), delta: -1)},
                  icon: Icon(Icons.remove), iconSize: AppTheme.iconLarge),
                Text("   "),
                IconButton(onPressed: () => {
                  iMat.shoppingCartAdd(ShoppingItem(product))},
                  icon: Icon(Icons.add), iconSize: AppTheme.iconLarge)
            ],)
            
          ],
        ),
      ),
      )
      
    );
  }
}
