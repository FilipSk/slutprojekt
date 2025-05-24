import 'package:flutter/material.dart';
import 'package:imat_app/widgets/nav_bar.dart';
import 'package:imat_app/widgets/products.dart';

class Centerview extends StatelessWidget {
  const Centerview({super.key});

  @override
  Widget build(BuildContext context) {
    

    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavBar(),
        SizedBox( width: 1100, height: 800, child: Products())
       ],);
  }
}
  
