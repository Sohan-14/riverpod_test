import 'package:flutter/material.dart';

import '../widget/product_card.dart';

class AllProductTab extends StatelessWidget {
  const AllProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          GridView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: .7,
            ),
            itemBuilder: (BuildContext context, int index) {
              return const ProductCard();
            },
          ),
        ],
      ),
    );
  }
}
