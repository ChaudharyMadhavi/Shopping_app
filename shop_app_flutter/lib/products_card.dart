import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundcolor;
  const ProductsCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    //we can also use card instead of container card will show us elevation too
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundcolor,
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 5),
          Center(
            child: Image.asset(
              image,
              height: 175,
            ),
          ),
        ],
      ),
    );
  }
}
