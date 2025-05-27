import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/customer.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/model/imat/customer.dart';
import 'package:imat_app/widgets/screen_progress.dart';
import 'package:provider/provider.dart';

class EndPageView extends StatefulWidget {
  const EndPageView({super.key});

  @override
  State<EndPageView> createState() => _EndPageView();
}

class _EndPageView extends State<EndPageView> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _mobileNumberController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _postCodeController;
  late final TextEditingController _postAddressController;
  late final ImatDataHandler _imatDataHandler;

  @override
  void initState() {
    super.initState();
    _imatDataHandler = Provider.of<ImatDataHandler>(context, listen: false);
    final customer = _imatDataHandler.getCustomer();
    _firstNameController = TextEditingController(text: customer.firstName);
    _lastNameController = TextEditingController(text: customer.lastName);
    _mobileNumberController = TextEditingController(
      text: customer.mobilePhoneNumber,
    );
    _emailController = TextEditingController(text: customer.email);
    _addressController = TextEditingController(text: customer.address);
    _postCodeController = TextEditingController(text: customer.postCode);
    _postAddressController = TextEditingController(text: customer.postAddress);
  }

  @override
  Widget build(BuildContext context) {
    final customer = _imatDataHandler.getCustomer();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Card(
        child: Column(
          children: [
            ScreenProgress(ticks: 4),
            Divider(),
            SizedBox(height: 8),
            SizedBox(width: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ElevatedButton.icon(
                    onPressed:
                        () => Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.close_rounded, size: 28),
                    label: const Text(
                      "Stäng",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: const Color.fromARGB(255, 76, 175, 80),
                  size: 100,
                ),
                const SizedBox(width: 17),
                Expanded(
                  child: Text(
                    'Tack för din beställning, ${customer.firstName}!',
                    style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),

            Text(
              "Dina varor anländer på:\n       ${customer.address} \nIdag mellan kl 18 och 20.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 35),
            Text(
              "Välkommen åter!",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            Image.asset("assets/images/hand2.jpg", height: 250, width: 500),
          ],
        ),
      ),
    );
  }
}
