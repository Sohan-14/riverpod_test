import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class OrderCard extends StatelessWidget {
  final int type;
  final String image;
  final String title;
  final String price;
  final String status;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onTap;
  final VoidCallback? sendDeliveryTap;
  final VoidCallback? assignedTap;
  final VoidCallback? pickedTap;
  final VoidCallback? deliveredTap;
  const OrderCard({
    super.key,
    required this.type,
    required this.image,
    required this.title,
    required this.price,
    required this.status,
    this.onAccept,
    this.onDecline,
    this.onTap,
    this.sendDeliveryTap,
    this.assignedTap,
    this.pickedTap,
    this.deliveredTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSizes.sm,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: GestureDetector(
                    onTap: () => context.push(
                      RoutePaths.imageFullScreen,
                      extra: <String, String>{
                        "imagePath": image,
                      },
                    ),
                    child: ImageLoader(
                      imagePath: image,
                      width: 80,
                      height: 60,
                    ),
                  ),
                ),
                Column(
                  spacing: AppSizes.xs,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      title,
                      style: context.txtTheme.bodyLarge,
                    ),
                    Text(
                      "Price: \$$price",
                      style: context.txtTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: AppSizes.sm,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.sm,
            ),

            if (type == 1)
              Positioned(
                bottom: 0,
                right: 4,
                child: GestureDetector(
                  onTap: () {
                    if (status == "Send Delivery" && sendDeliveryTap != null) {
                      sendDeliveryTap!();
                    } else if (status == "Assigned" && assignedTap != null) {
                      assignedTap!();
                    } else if (status == "Picked" && pickedTap != null) {
                      pickedTap!();
                    } else if (status == "Delivered" && deliveredTap != null) {
                      deliveredTap!();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status).withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      status,
                      style: context.txtTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              )
            else if (type == 2)
              Positioned(
                bottom: 0,
                right: 4,
                child: Row(
                  children: <Widget>[
                    AppElevatedButton(
                      height: 30,
                      width: 100,
                      label: "Accept",
                      onPressed: () {
                        if (onAccept != null) {
                          onAccept!();
                        }
                      },
                    ),
                    const SizedBox(width: 4.0),
                    AppOutlineButton(
                      height: 30,
                      width: 100,
                      label: "Decline",
                      onPressed: () {
                        if (onDecline != null) {
                          onDecline!();
                        }
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Send Delivery":
        return AppColors.primary;
      case "Assigned":
        return Colors.yellowAccent;
      case "Picked":
        return Colors.blueAccent;
      case "Delivered":
        return Colors.green;
      default:
        return AppColors.grey;
    }
  }
}
