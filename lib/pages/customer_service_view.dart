import 'package:flutter/material.dart';
import 'package:imat_app/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:imat_app/pages/main_view.dart';
import 'package:imat_app/pages/user_view.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: MyAppBar(onSearchChanged: (String) {}),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  SizedBox(width: 200),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Tillbaka'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 250),
                      child: Image.asset(
                        "assets/images/Hank3.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 300),
                ],
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1150),
                child: const TabBar(
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(fontSize: 18),
                  tabs: [
                    Tab(text: "Kontakt"),
                    Tab(text: "Leveransinformation"),
                    Tab(text: "Betalningsinformation"),
                    Tab(text: "Returer"),
                    Tab(text: "Vanliga frågor"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          height: 394,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Besöksadress',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Hanks Livs\nStorgatan 12\n123 45 Småstad',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Kontakt',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'E-post: info@hankslivs.se',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'Telefon: 08–123 456 78',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'Tider: Vardagar 9–17',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Öppettider',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Mån–Fre: 09:00–18:00',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'Lördag: 10:00–14:00',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'Söndag: Stängt',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Leveransinformation',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Vi erbjuder hemleverans inom Småstad. Beställ innan 14:00 för leverans samma dag. '
                              'Leveranser sker 16:00–20:00 på vardagar.',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Färskvaror levereras i kylväskor för att behålla kylkedjan.',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Fraktkostnad:',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '- Fri frakt över 500 kr\n- 49 kr under 500 kr',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Betalningsinformation',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Du kan betala med bankkort, Swish eller faktura via Klarna (30 dagar).',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Alla betalningar sker säkert och krypterat. Vi sparar inte kortuppgifter.',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Returer & reklamation',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Färskvaror kan inte returneras. Skadade eller saknade varor ska anmälas inom 24 timmar.',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Kontakta oss via info@hankslivs.se eller ring 08–123 456 78.',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Vanliga frågor',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Hur sent kan jag beställa?',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Senast kl. 14:00 för leverans samma dag.',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Levererar ni på helger?',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Ja, lördagar 10–14. Söndag stängt.',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Kan jag spåra min leverans?',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Ja, du får ett SMS med spårningslänk när ordern skickas.',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
