import 'package:flutter/material.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:provider/provider.dart';

class Shoppingcart extends StatelessWidget {
  const Shoppingcart({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    return Text(iMat.getCreditCard().cardNumber);
  }
}
