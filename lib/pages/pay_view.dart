import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/pages/cheak_costomer_detail.dart';
import 'package:imat_app/pages/end_page_view.dart';
import 'package:imat_app/widgets/payment_widget.dart';
import 'package:imat_app/widgets/screen_progress.dart';
import 'package:provider/provider.dart';

class PayView extends StatelessWidget {
  const PayView({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();

    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          ScreenProgress(ticks: 3),
          const Divider(),
          const SizedBox(height: 8),

          Expanded(
            child: Column(
              children: [
                const PaymentDetails(),
                const SizedBox(height: 54),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Summa:',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${iMat.shoppingCartTotal().toStringAsFixed(2)}:-',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed:
                          () => _replaceDialogWith(
                            context,
                            const CheakCustomerDetail(),
                          ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.secondaryThemeColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Tillbaka",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        iMat.placeOrder();
                        //iMat.shoppingCartClear();
                        _replaceDialogWith(context, const EndPageView());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.mainThemeColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Betala",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
