import 'package:flutter/material.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/pages/cheak_costomer_detail.dart';
import 'package:imat_app/widgets/screen_progress.dart';
import 'package:provider/provider.dart';

class BuyListView extends StatelessWidget {
  const BuyListView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var items = iMat.getShoppingCart().items;

    return Container(
      padding: const EdgeInsets.all(16),
      height: 400, // Maxhöjd på kortet
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          ScreenProgress(ticks: 1),
          Divider(),
          SizedBox(height: 8),

          // Text(
          //   "Din varukorg",
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              SizedBox(
                width: 150,
                child: Text(
                  "Artikel",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 105,
                child: Text(
                  "Antal",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  "Summan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Divider(thickness: 5, height: 8),

          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(height: 8),
              itemBuilder: (context, index) {
                final item = items[index];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    SizedBox(width: 150, child: Text(item.product.name)),
                    SizedBox(
                      width: 80,
                      child: Text("${item.amount}".toString()),
                    ),

                    SizedBox(
                      width: 80,
                      child: Text("${item.amount * item.product.price}"),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "summan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Text(
                iMat.shoppingCartTotal().toStringAsFixed(2),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Tillbaka',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
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
                          child: CheakCustomerDetail(),
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
                  "Beställa",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
