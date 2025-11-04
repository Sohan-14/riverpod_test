import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../post/presentation/widget/tab_item.dart';
import '../widgets/parcel_request_history_tab.dart';
import '../widgets/parcel_request_tab.dart';
import '../widgets/parcel_request_task_tab.dart';

class ParcelRequestScreen extends StatefulWidget {
  const ParcelRequestScreen({super.key});

  @override
  State<ParcelRequestScreen> createState() => _ParcelRequestScreenState();
}

class _ParcelRequestScreenState extends State<ParcelRequestScreen>
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
        title: 'Parcel Requests',
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
                    label: "Request",
                  ),
                  TabItem(
                    selectedIndex: _selectedIndex,
                    index: 1,
                    label: "Task",
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
                  ParcelRequestTab(),
                  ParcelRequestTaskTab(),
                  ParcelRequestHistoryTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
