import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../../domain/order.dart';
import '../widget/order_card.dart';

class ProductOrdersHistoryTab extends StatelessWidget {
  const ProductOrdersHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Order> orders = <Order>[
      Order(
        image:
            "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
        title: "Luréa",
        price: "25",
        status: "Send Delivery",
      ),
      Order(
        image:
            "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
        title: "Euphoria",
        price: "35",
        status: "Assigned",
      ),
      Order(
        image:
            "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
        title: "Silk Touch",
        price: "50",
        status: "Picked",
      ),
      Order(
        image:
            "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
        title: "Mystic Dream",
        price: "40",
        status: "Delivered",
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListView.separated(
            itemBuilder: (_, int index) => OrderCard(
              type: 3,
              image: orders[index].image,
              title: orders[index].title,
              price: orders[index].price,
              status: orders[index].status,
              onTap: () => context.push(RoutePaths.assignedDriver),
            ),
            itemCount: orders.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, int index) => const SizedBox(height: 12.0),
          ),
        ],
      ),
    );
  }
}
