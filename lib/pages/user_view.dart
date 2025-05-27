import 'package:flutter/material.dart';
import 'package:imat_app/pages/adress_view.dart';
import 'package:imat_app/pages/customer_service_view.dart';
import 'package:imat_app/pages/history_view.dart';
import 'package:imat_app/pages/main_view.dart';
import 'package:imat_app/pages/payment_view.dart';
import 'package:imat_app/widgets/app_bar.dart';
import 'package:imat_app/widgets/user_button.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(onSearchChanged: (String) {}),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserButton(
                  title: 'Tillbaka',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainView()),
                    );
                  },
                  color: const Color.fromARGB(198, 255, 0, 0),
                ),
                const SizedBox(width: 75),
                UserButton(
                  title: 'Kundservice',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerServiceView(),
                      ),
                    );
                  },
                  color: const Color.fromARGB(200, 100, 180, 100),
                ),
                const SizedBox(width: 75),
                UserButton(
                  title: 'Historik',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryView(),
                      ),
                    );
                  },
                  color: const Color.fromARGB(200, 100, 180, 100),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserButton(
                  title: 'Leveransuppgifter',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdressView(),
                      ),
                    );
                  },
                  color: const Color.fromARGB(200, 100, 180, 100),
                ),
                const SizedBox(width: 75),
                UserButton(
                  title: 'Betalningsuppgifter',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentView(),
                      ),
                    );
                  },
                  color: const Color.fromARGB(200, 100, 180, 100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
