import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/pages/buy_list_view.dart';
import 'package:imat_app/pages/pay_view.dart';
import 'package:imat_app/widgets/adress_widget.dart';
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
          SizedBox(height: 11),

          // Text(
          //   "leverans and beställning",
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          const CustomerDetails(),
          SizedBox(height: 6),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Summa:',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              Text(
                '${iMat.shoppingCartTotal().toStringAsFixed(2)}:-',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ), //CustomerDetails(), här ska Emil anropa sin funktion
          SizedBox(height: 10),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              ElevatedButton(
                onPressed:
                    () => _replaceDialogWith(context, const BuyListView()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.secondaryThemeColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Tillbaka',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () => _replaceDialogWith(context, const PayView()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.mainThemeColor,
                  foregroundColor: Colors.white,
                ),

                child: Text(
                  "Nästa",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _replaceDialogWith(BuildContext context, Widget child) {
    Navigator.pop(context); // Stäng befintlig dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(width: 850, height: 700, child: child),
          ),
    );
  }
}
