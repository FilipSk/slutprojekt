import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/product.dart';
import 'package:imat_app/model/imat/product_detail.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/widgets/show_detail.dart';

class ProductDialog extends StatelessWidget {
  final Product product;
  final ProductDetail? productDetail;
  final ImatDataHandler iMat;

  const ProductDialog({
    super.key,
    required this.product,
    required this.productDetail,
    required this.iMat,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 700,
        height: 500,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            splashColor: Colors.blue.withAlpha(30),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: iMat.getImage(product),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            child:
                                productDetail != null
                                    ? ShowDetail(productDetail: productDetail!)
                                    : const Text(
                                      'Ingen produktdetalj tillgänglig',
                                    ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Stäng',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
