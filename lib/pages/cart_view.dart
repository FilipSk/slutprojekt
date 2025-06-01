import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/shopping_item.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var items = iMat.getShoppingCart().items;

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        for (final item in items.reversed)
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProductImage(iMat, item.product),
                  const SizedBox(width: 12),

                  /// Expanded för namn och kvantitet
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item.product.name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed:
                                  () => iMat.shoppingCartUpdate(
                                    ShoppingItem(item.product),
                                    delta: -1,
                                  ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.secondaryThemeColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '${item.amount.toInt()}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed:
                                  () => iMat.shoppingCartAdd(
                                    ShoppingItem(item.product),
                                  ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.mainThemeColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Ta bort-knapp
                  ElevatedButton.icon(
                    onPressed: () {
                      iMat.shoppingCartRemove(item);
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 24,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Ta bort',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.secondaryThemeColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProductImage(ImatDataHandler iMat, Product product) {
    Uint8List? imageData = iMat.getImageData(product);

    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child:
            imageData != null
                ? Image.memory(imageData, fit: BoxFit.cover)
                : Image.asset(
                  'assets/images/placeholder.png',
                  fit: BoxFit.cover,
                ),
      ),
    );
  }
}
