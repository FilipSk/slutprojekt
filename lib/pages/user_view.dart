import 'package:flutter/material.dart';
import 'package:imat_app/pages/adress_view.dart';
import 'package:imat_app/pages/customer_service_view.dart';
import 'package:imat_app/pages/history_view.dart';
import 'package:imat_app/pages/payment_view.dart';
import 'package:imat_app/widgets/app_bar.dart';
import 'package:imat_app/widgets/user_button.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(onSearchChanged: (String) {}),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Tillbaka'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserButton(
                          icon: const Icon(
                            Icons.phone,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: 'Kundservice',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const CustomerServiceView(),
                              ),
                            );
                          },
                          color: const Color.fromARGB(255, 76, 175, 80),
                        ),
                        const SizedBox(width: 80),
                        UserButton(
                          icon: const Icon(
                            Icons.history,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: 'Historik',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HistoryView(),
                              ),
                            );
                          },
                          color: const Color.fromARGB(255, 76, 175, 80),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserButton(
                          icon: const Icon(
                            Icons.delivery_dining_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: 'Leveransuppgifter',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdressView(),
                              ),
                            );
                          },
                          color: const Color.fromARGB(255, 76, 175, 80),
                        ),
                        const SizedBox(width: 80),
                        UserButton(
                          icon: const Icon(
                            Icons.payment,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: 'Betalningsuppgifter',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentView(),
                              ),
                            );
                          },
                          color: const Color.fromARGB(255, 76, 175, 80),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
