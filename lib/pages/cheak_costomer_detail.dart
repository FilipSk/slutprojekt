import 'package:flutter/material.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/pages/pay_view.dart';
import 'package:imat_app/widgets/screen_progress.dart';
import 'package:provider/provider.dart';

class CheakCustomerDetail extends StatelessWidget {
  const CheakCustomerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    return Container(
      padding: EdgeInsets.all(16),
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          ScreenProgress(ticks: 2),
          Divider(),
          SizedBox(height: 8),

          // Text(
          //   "leverans and beställning",
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Summan att ska betalas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Text(
                iMat.shoppingCartTotal().toStringAsFixed(2),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
          //CustomerDetails(), här ska Emil anropa sin funktion
          Spacer(),
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
                  "Tillbaka",
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
                          borderRadius: BorderRadiusDirectional.circular(20),
                        ),
                        child: SizedBox(
                          width: 850,
                          height: 700,

                          child: PayView(),
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
                  "Nästa",
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
