import 'package:app/core/shared/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/route_paths.dart';
import '../../domain/order.dart';
import '../widget/order_card.dart';

class ProductOrdersTab extends StatelessWidget {
  const ProductOrdersTab({super.key});

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
          CustomDropdown<String>(
            options: const <String>[
              "Send Delivery",
              "Assigned",
              "Picked",
              "Delivered",
            ],
            hint: "Filter with status :",
            displayString: (String option) => option,
            onChanged: (String? value) {},
          ),
          const SizedBox(height: 16.0),
          ListView.separated(
            itemBuilder: (_, int index) => OrderCard(
              type: 1,
              image: orders[index].image,
              title: orders[index].title,
              price: orders[index].price,
              status: orders[index].status,
              sendDeliveryTap: () {
                context.push(RoutePaths.sendDelivery);
              },
              assignedTap: () {
                context.push(RoutePaths.assignedDriver);
              },
              pickedTap: () {
                context.push(RoutePaths.assignedDriver);
              },
              deliveredTap: () {
                context.push(RoutePaths.assignedDriver);
              },
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
