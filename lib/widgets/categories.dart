import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat_category_handler.dart';
import 'package:imat_app/widgets/category.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    var catHandler = context.watch<ImatCategoryHandler>();
    var categories = catHandler.currentCategories;

    return SliverGrid.builder(
      itemCount: categories.getCategories().length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 4 kolumner
        crossAxisSpacing: AppTheme.paddingSmall,
        mainAxisSpacing: AppTheme.paddingMedium,
        childAspectRatio: 5 / 4,
      ),
      itemBuilder: (context, index) {
        final category = categories.getCategories()[index];

        return Category(category);
      },
    );
  }
}
