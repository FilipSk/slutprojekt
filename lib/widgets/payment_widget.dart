import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/credit_card.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<PaymentDetails> {
  late final TextEditingController _typeController;
  late final TextEditingController _nameController;
  late final TextEditingController _monthController;
  late final TextEditingController _yearController;
  late final TextEditingController _numberController;
  late final TextEditingController _codeController;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();

    var iMat = Provider.of<ImatDataHandler>(context, listen: false);
    CreditCard card = iMat.getCreditCard();

    _typeController = TextEditingController(text: card.cardType);
    _nameController = TextEditingController(text: card.holdersName);
    _monthController = TextEditingController(text: '${card.validMonth}');
    _yearController = TextEditingController(text: '${card.validYear}');
    _numberController = TextEditingController(text: card.cardNumber);
    _codeController = TextEditingController(text: '${card.verificationCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Redigera Kortinformation',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildField(_typeController, 'Korttyp'),
        const SizedBox(height: 12),
        _buildField(_nameController, 'Kortinnehavare'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildField(_monthController, 'Giltigt månad')),
            const SizedBox(width: 12),
            Expanded(child: _buildField(_yearController, 'Giltigt år')),
          ],
        ),
        const SizedBox(height: 12),
        _buildField(_numberController, 'Kortnummer'),
        const SizedBox(height: 12),
        _buildField(_codeController, 'CVV-kod'),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child:
              isEditing
                  ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: _saveCard,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('Spara'),
                      ),
                      const SizedBox(width: 12),
                      TextButton(
                        onPressed: () => setState(() => isEditing = false),
                        child: const Text('Avbryt'),
                      ),
                    ],
                  )
                  : ElevatedButton(
                    onPressed: () => setState(() => isEditing = true),
                    child: const Text('Ändra'),
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

  void _saveCard() {
    var iMat = Provider.of<ImatDataHandler>(context, listen: false);
    CreditCard card = CreditCard(
      _typeController.text,
      _nameController.text,
      int.tryParse(_monthController.text) ?? 1,
      int.tryParse(_yearController.text) ?? 25,
      _numberController.text,
      int.tryParse(_codeController.text) ?? 0,
    );

    iMat.setCreditCard(card);

    setState(() {
      isEditing = false;
    });
  }
}
