import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/nav_bar.dart';
import 'package:imat_app/widgets/products.dart';
import 'package:imat_app/widgets/product_card.dart';
import 'package:provider/provider.dart';

class Centerview extends StatelessWidget {
  final bool hasSearchText;
  //final bool favorites;
  const Centerview({super.key, required this.hasSearchText});

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();
    final products = iMat.selectProducts;

    if (!hasSearchText) {
      // if (!favorites){

      // }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavBar(),
          const SizedBox(height: 16),
          SizedBox(
            width: 1100,
            height: 600,
            child: const Products(),
          ),
        ],
      );
    }

    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "Sökresultat, rensa sökning för att återgå",
              style: TextStyle(
                fontSize: AppTheme.fontLarge,
                backgroundColor: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            shape: const Border(bottom: BorderSide(color: Colors.black)),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppTheme.paddingMedium),
            sliver: SliverGrid.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: AppTheme.paddingSmall,
                mainAxisSpacing: AppTheme.paddingMedium,
                childAspectRatio: 3 / 4,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product, iMat);
              },
            ),
          ),
          if (products.isEmpty)
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    "Vad menade du med det där?",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
