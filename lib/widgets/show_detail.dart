import 'package:flutter/material.dart';
import 'package:imat_app/model/imat/product_detail.dart';

class ShowDetail extends StatelessWidget {
  final ProductDetail productDetail;

  const ShowDetail({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        /// Beskrivning
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Beskrivning",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              productDetail.description,
              style: const TextStyle(fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(height: 12),

        /// Märke
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Märke",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              productDetail.brand,
              style: const TextStyle(fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(height: 12),

        /// Ursprung
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ursprung",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              productDetail.origin,
              style: const TextStyle(fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(height: 12),

        /// Innehåll
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Innehåll",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              productDetail.contents,
              style: const TextStyle(fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(height: 12),

        /// Produkt-ID
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Produkt-ID",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              productDetail.productId.toString(),
              style: const TextStyle(fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
