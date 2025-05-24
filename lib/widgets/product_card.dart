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
        borderRadius: BorderRadius.circular(12),
        splashColor: AppTheme.splashColor,
        hoverColor: AppTheme.hoverColor,
        onTap: () {},
        child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: iMat.getImage(product)),
            const SizedBox(height: 8),
            Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: AppTheme.fontBig)),
            Text('${product.price.toStringAsFixed(2)} kr', style: const TextStyle(fontSize: AppTheme.fontMedium)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () => {
                  iMat.shoppingCartRemove(ShoppingItem(product))},
                  icon: Icon(Icons.remove), iconSize: AppTheme.iconLarge),
                Text("x"),
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
