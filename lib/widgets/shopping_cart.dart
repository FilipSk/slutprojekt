import 'package:flutter/material.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/pages/buy_list_view.dart';
import 'package:imat_app/pages/cart_view.dart';

class ShoppingCart extends StatelessWidget {
  final ImatDataHandler iMat;

  const ShoppingCart({super.key, required this.iMat});

  @override
  Widget build(BuildContext context) {
    var items = iMat.getShoppingCart().items;
    return SafeArea(
      child: Container(
        width: 535,
        color: const Color.fromARGB(255, 242, 243, 241),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kundvagn",

                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),

                SizedBox(width: 16),

                Icon(
                  Icons.shopping_cart,
                  size: 46,
                  color: const Color.fromARGB(255, 175, 11, 28),
                ),
              ],
            ),
            Divider(color: Colors.black),

            Container(height: 550, child: CartView()),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Summa:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${iMat.shoppingCartTotal().toStringAsFixed(2)}:-',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed:
                  items.isEmpty
                      ? null
                      : () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                width: 850,
                                height: 700,
                                child: BuyListView(),
                              ),
                            );
                          },
                        );
                      },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Till kassan',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
