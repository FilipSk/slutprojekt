import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:imat_app/widgets/app_bar.dart';
import 'package:imat_app/model/imat/customer.dart';
import 'package:imat_app/model/imat_data_handler.dart';

class AdressView extends StatefulWidget {
  const AdressView({super.key});

  @override
  State<AdressView> createState() => _AdressViewState();
}

class _AdressViewState extends State<AdressView> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _mobileNumberController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _postCodeController;
  late final TextEditingController _postAddressController;
  late final ImatDataHandler _handler;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _handler = Provider.of<ImatDataHandler>(context, listen: false);
    final customer = _handler.getCustomer();
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
    return Scaffold(
      appBar: MyAppBar(onSearchChanged: (_) {}),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 650),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
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
                const Text(
                  'Adressuppgifter',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildField(
                                'Förnamn',
                                _firstNameController,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildField(
                                'Efternamn',
                                _lastNameController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: _buildField(
                                'Mobilnummer',
                                _mobileNumberController,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildField('E-post', _emailController),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildField('Adress', _addressController),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildField(
                                'Postnummer',
                                _postCodeController,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildField('Ort', _postAddressController),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                isEditing
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final customer = _handler.getCustomer();
                            setState(() {
                              _firstNameController.text = customer.firstName;
                              _lastNameController.text = customer.lastName;
                              _mobileNumberController.text =
                                  customer.mobilePhoneNumber;
                              _emailController.text = customer.email;
                              _addressController.text = customer.address;
                              _postCodeController.text = customer.postCode;
                              _postAddressController.text =
                                  customer.postAddress;
                              isEditing = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              0,
                              0,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 20,
                            ),
                          ),
                          child: const Text(
                            "Avbryt",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: _saveCustomer,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 20,
                            ),
                          ),
                          child: const Text(
                            "Spara",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    )
                    : ElevatedButton(
                      onPressed: () => setState(() => isEditing = true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text("Ändra"),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          enabled: isEditing,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: isEditing ? Colors.grey[100] : Colors.grey[200],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }

  void _saveCustomer() {
    final customer = _handler.getCustomer();

    customer.firstName = _firstNameController.text;
    customer.lastName = _lastNameController.text;
    customer.mobilePhoneNumber = _mobileNumberController.text;
    customer.email = _emailController.text;
    customer.address = _addressController.text;
    customer.postCode = _postCodeController.text;
    customer.postAddress = _postAddressController.text;

    _handler.setCustomer(customer);

    setState(() {
      isEditing = false;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Adressinformation sparad')));
  }
}
