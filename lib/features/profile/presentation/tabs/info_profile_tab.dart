import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../widgets/info_item.dart';

class InfoProfileTab extends StatelessWidget {
  const InfoProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        spacing: AppSizes.md,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InfoItem(
            icon: CupertinoIcons.person,
            label: "Name",
            value: "Zahidul Islam Shohan",
          ),
          InfoItem(
            icon: CupertinoIcons.info,
            label: "About",
            value: "Cinderella",
          ),
          InfoItem(
            icon: CupertinoIcons.phone,
            label: "Phone",
            value: "+8801512341234",
          ),
          InfoItem(
            icon: Icons.location_on_outlined,
            label: "Address",
            value: "New York, USA",
          ),
        ],
      ),
    );
  }
}
