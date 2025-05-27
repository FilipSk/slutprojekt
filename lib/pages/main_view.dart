import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/app_bar.dart';
import 'package:imat_app/widgets/center_view.dart';
import 'package:imat_app/widgets/navigation_view.dart';
import 'package:imat_app/widgets/shopping_cart.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    final iMat = context.watch<ImatDataHandler>();

    return Scaffold(
      appBar: MyAppBar(
        onSearchChanged: (String newText) {
          setState(() {
            _searchText = newText;
          });

          // Kod för sökning :)
          if (newText.isEmpty) {
            iMat.selectAllProducts();
          } else {
            final results = iMat.findProducts(newText);
            iMat.selectSelection(results);
          }
        },
      ),
      body: Row(
        children: [
          //const NavigationView(),
          Expanded(
            flex: 3,
            child: Centerview(hasSearchText: _searchText.isNotEmpty),
          ),
          ShoppingCart(iMat: iMat),
        ],
      ),
    );
  }
}

    /*
    return Scaffold(
      appBar: AppBar(title: Text('iMats produkter')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 4, //  4 kolumner
          crossAxisSpacing: 8, //  horisontellt mellanrum
          mainAxisSpacing: 8, //  vertikalt mellanrum
          childAspectRatio: 4 / 3, //  bredd/höjd-förhållande
          children:
              products.map((product) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: iMat.getImage(product)),
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${product.price.toStringAsFixed(2)}kr',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );*/

  Card _productCard(ImatDataHandler iMat, Product product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingSmall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: iMat.getImage(product)),
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppTheme.paddingSmall),
            Text(
              '${product.price.toStringAsFixed(2)}kr',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
