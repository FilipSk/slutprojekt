import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:imat_app/widgets/app_bar.dart';
import 'package:imat_app/model/imat/credit_card.dart';
import 'package:imat_app/model/imat_data_handler.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late final TextEditingController _typeController;
  late final TextEditingController _nameController;
  late final TextEditingController _monthController;
  late final TextEditingController _yearController;
  late final TextEditingController _numberController;
  late final TextEditingController _cvcController;
  late final ImatDataHandler _handler;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _handler = Provider.of<ImatDataHandler>(context, listen: false);
    final card = _handler.getCreditCard();
    _typeController = TextEditingController(text: card.cardType);
    _nameController = TextEditingController(text: card.holdersName);
    _monthController = TextEditingController(text: '${card.validMonth}');
    _yearController = TextEditingController(text: '${card.validYear}');
    _numberController = TextEditingController(text: card.cardNumber);
    _cvcController = TextEditingController(text: '${card.verificationCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(onSearchChanged: (String) {}),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 625),
          child: Padding(
            padding: const EdgeInsets.all(0),
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
                ),
                const SizedBox(height: 4),

                const Text(
                  'Betalningsuppgifter',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildField('Korttyp', _typeController),
                        const SizedBox(height: 15),
                        _buildField('Kortinnehavare', _nameController),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: _buildField('Månad', _monthController),
                            ),
                            const SizedBox(width: 15),
                            Expanded(child: _buildField('År', _yearController)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        _buildField('Kortnummer', _numberController),
                        const SizedBox(height: 15),
                        _buildField('CVC', _cvcController),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    if (isEditing) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: controller,
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
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(controller.text, style: const TextStyle(fontSize: 20)),
            Divider(),
          ],
        ),
      );
    }
  }

  Widget _buildActionButtons() {
    if (!isEditing) {
      return ElevatedButton(
        onPressed: () => setState(() => isEditing = true),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        child: const Text("Ändra"),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              final card = _handler.getCreditCard();
              setState(() {
                _typeController.text = card.cardType;
                _nameController.text = card.holdersName;
                _monthController.text = '${card.validMonth}';
                _yearController.text = '${card.validYear}';
                _numberController.text = card.cardNumber;
                _cvcController.text = '${card.verificationCode}';
                isEditing = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            ),
            child: const Text("Avbryt", style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: _saveCard,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 76, 175, 80),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            ),
            child: const Text("Spara", style: TextStyle(fontSize: 20)),
          ),
        ],
      );
    }
  }

  void _saveCard() {
    final updatedCard = CreditCard(
      _typeController.text,
      _nameController.text,
      int.tryParse(_monthController.text) ?? 1,
      int.tryParse(_yearController.text) ?? 25,
      _numberController.text,
      int.tryParse(_cvcController.text) ?? 0,
    );

    _handler.setCreditCard(updatedCard);
    setState(() {
      isEditing = false;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Kortinformation sparad')));
  }
}
