import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../tabs/product_orders_request_tab.dart';
import '../tabs/product_orders_history_tab.dart';
import '../tabs/product_orders_tab.dart';
import '../widget/tab_item.dart';

class ProductOrderScreen extends StatefulWidget {
  const ProductOrderScreen({super.key});

  @override
  State<ProductOrderScreen> createState() => _ProductOrderScreenState();
}

class _ProductOrderScreenState extends State<ProductOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index != _selectedIndex) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Product Orders',
        showBackBtn: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
              child: TabBar(
                controller: _tabController,
                dividerHeight: 0.0,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                ),
                tabs: <Widget>[
                  TabItem(
                    selectedIndex: _selectedIndex,
                    index: 0,
                    label: "Product Orders",
                  ),
                  TabItem(
                    selectedIndex: _selectedIndex,
                    index: 1,
                    label: "Order Request",
                  ),
                  TabItem(
                    selectedIndex: _selectedIndex,
                    label: "History",
                    index: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.md,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  ProductOrdersTab(),
                  ProductOrdersRequestTab(),
                  ProductOrdersHistoryTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
