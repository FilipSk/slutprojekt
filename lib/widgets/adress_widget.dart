import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:imat_app/model/imat/customer.dart';
import 'package:imat_app/model/imat_data_handler.dart';

const List<String> list = <String>['Idag Kl 16-20', 'Imorgon Kl 16-20'];

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({super.key});

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _mobileNumberController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _postCodeController;
  late final TextEditingController _postAddressController;
  late final ImatDataHandler _imatDataHandler;

  bool isEditing = false;
  String dropdownValue = list.first;

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
    final menuEntries = UnmodifiableListView(
      list.map((name) => DropdownMenuEntry(value: name, label: name)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Leveransuppgifter',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildField(_firstNameController, 'Förnamn')),
            const SizedBox(width: 12),
            Expanded(child: _buildField(_lastNameController, 'Efternamn')),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildField(_mobileNumberController, 'Mobilnummer'),
            ),
            const SizedBox(width: 12),
            Expanded(child: _buildField(_emailController, 'E-post')),
          ],
        ),
        const SizedBox(height: 12),
        _buildField(_addressController, 'Adress'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildField(_postCodeController, 'Postnummer')),
            const SizedBox(width: 12),
            Expanded(child: _buildField(_postAddressController, 'Ort')),
          ],
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child:
              isEditing
                  ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() => isEditing = false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.secondaryThemeColor,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          "Avbryt",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: _saveCustomer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.mainThemeColor,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          "Spara",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                  : ElevatedButton(
                    onPressed: () => setState(() => isEditing = true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 19, 106, 255),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      "Ändra",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Välj när du vill ha leveransen:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              DropdownMenu<String>(
                initialSelection: list.first,
                onSelected: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries: menuEntries,
                enableFilter: false,
              ),

              Text(
                '*Du får ett SMS 15 minuter innan vi anländer till adressen.',
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      enabled: isEditing,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: isEditing ? Colors.grey[100] : Colors.grey[200],
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      ),
    );
  }

  void _saveCustomer() {
    final updatedCustomer = Customer(
      _firstNameController.text,
      _lastNameController.text,
      '',
      _mobileNumberController.text,
      _emailController.text,
      _addressController.text,
      _postCodeController.text,
      _postAddressController.text,
    );

    _imatDataHandler.setCustomer(updatedCustomer);
    setState(() {
      isEditing = false;
    });
  }
}
