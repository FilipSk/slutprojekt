import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/categories.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    var iMat = Provider.of<ImatDataHandler>(context, listen: true);
    
    var products = iMat.selectProducts;
    return Scaffold(
      //appBar: AppBar(title: const Text('iMats produkter')),

      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          Categories(),
          SliverGrid.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 kolumner
            crossAxisSpacing: AppTheme.paddingSmall,
            mainAxisSpacing: AppTheme.paddingMedium,
            childAspectRatio: 3/4,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(product, iMat);
          },)

        ],



      )
      
      
    );
  }
}
