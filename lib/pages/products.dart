import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/app_bar.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = context.watch<ImatDataHandler>();
    var products = iMat.selectProducts;
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingSmall),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 kolumner
            crossAxisSpacing: AppTheme.paddingSmall,
            mainAxisSpacing: AppTheme.paddingSmall,
            childAspectRatio: 4 / 3,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(product, iMat);
          },
        ),
      ),
    );;
  }
}



