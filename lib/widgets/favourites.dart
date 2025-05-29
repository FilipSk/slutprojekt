import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});
  
  @override
  Widget build(BuildContext context) {
    var iMat = Provider.of<ImatDataHandler>(context, listen: true);
    iMat.selectFavorites();
    var products = iMat.selectProducts;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(automaticallyImplyLeading: false, title: Text("Favoriter", style: const TextStyle(fontSize: AppTheme.fontHuge, fontWeight: FontWeight.bold,)),shape: Border(bottom: BorderSide(color: Colors.black,)),),
          SliverGrid.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 kolumner
            crossAxisSpacing: AppTheme.paddingSmall,
            mainAxisSpacing: AppTheme.paddingMedium,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(product, iMat);
          },
          ),
        ],
      ),
    );
  }
}