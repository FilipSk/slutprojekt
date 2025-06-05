import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/Buttons/button.dart';
import 'package:imat_app/widgets/product_dialog.dart';
import 'package:imat_app/widgets/remove_button.dart';
import 'package:imat_app/widgets/Buttons/text_button.dart';
import 'package:provider/provider.dart';

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
        onTap: () {
          final detail = iMat.getDetail(product);
          showDialog(
            context: context,
            builder:
                (context) => ProductDialog(
                  product: product,
                  productDetail: detail,
                  iMat: iMat,
                ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadius,
                      ),
                      child: iMat.getImage(product),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppTheme.fontMediumBig,
                    ),
                  ),
                  Text(
                    product.price.toStringAsFixed(2) + " " + product.unit,
                    style: TextStyle(fontSize: AppTheme.fontBig),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_addToCartButton(product, context)],
                  ),
                ],
              ),
              _favoriteButton(product, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _favoriteButton(Product p, context) {
    var iMat = Provider.of<ImatDataHandler>(context, listen: false);
    var isFavorite = iMat.isFavorite(p);

    var icon =
        isFavorite
            ? const Icon(
              Icons.star,
              color: Colors.yellow,
              size: AppTheme.iconHuge,
            )
            : const Icon(
              Icons.star_border,
              color: Colors.yellow,
              size: AppTheme.iconHuge,
            );

    return IconButton.filled(
      onPressed: () {
        iMat.toggleFavorite(p);
      },
      icon: icon,
      style: IconButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 59, 59, 59),
      ),
    );
  }

  Widget _addToCartButton(Product product, context) {
    var iMat = Provider.of<ImatDataHandler>(context, listen: true);
    var isFavorite = true;
    ShoppingItem item = ShoppingItem(product);
    for (ShoppingItem i in iMat.getShoppingCart().items) {
      if (i.product.name == product.name) {
        isFavorite = false;
        item = i;
      }
    }
    //print(iMat.getShoppingCart().items[1].product.name);

    var icon =
        isFavorite
            ? ButtonText(
              text: Text('Lägg till i varukorg'),
              onPressed: () => iMat.shoppingCartUpdate(ShoppingItem(product)),
              color: AppTheme.mainThemeColor,
              size: AppTheme.fontMedium,
            )
            : Row(
              children: [
                Button(
                  icon: Icon(Icons.remove, size: AppTheme.iconLarge),
                  onPressed:
                      () => iMat.shoppingCartUpdate(
                        ShoppingItem(product),
                        delta: -1,
                      ),
                  color: AppTheme.secondaryThemeColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    '${item.amount.toInt()}',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ),
                Button(
                  icon: Icon(Icons.add, size: AppTheme.iconLarge),
                  onPressed: () => iMat.shoppingCartAdd(ShoppingItem(product)),
                  color: AppTheme.mainThemeColor,
                ),
              ],
            );

    return icon;
  }
}
