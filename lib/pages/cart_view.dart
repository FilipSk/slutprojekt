import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/add_button.dart';
import 'package:imat_app/widgets/delete_button.dart';
import 'package:imat_app/widgets/remove_button.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var items = iMat.getShoppingCart().items;

    return ListView(
      children: [
        for (final item in items)
          Card(
            child: ListTile(
              title: Column(
                children: [
                  Text(
                    item.product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    spacing: 12,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RemoveButton(
                        onPressed: () {
                          iMat.shoppingCartUpdate(
                            ShoppingItem(item.product),
                            delta: -1.0,
                          );
                        },
                      ),
                      Text('${item.amount}'),
                      AddButton(
                        onPressed: () {
                          iMat.shoppingCartAdd(ShoppingItem(item.product));
                        },
                      ),
                    ],
                  ),
                ],
              ),

              leading: _buildProductImage(iMat, item.product),

              trailing: DeleteButton(
                onPressed: () {
                  iMat.shoppingCartRemove(item);
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProductImage(ImatDataHandler iMat, Product product) {
    Uint8List? imageData = iMat.getImageData(product);
    if (imageData != null) {
      return Image.memory(
        imageData,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      );
    } else {
      return Image.asset(
        'assets/images/placeholder.png',
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      );
    }
  }
}
