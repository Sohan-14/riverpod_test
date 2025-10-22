import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/provider/role_provider.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/utils/toast/toast.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cart",
        showBackBtn: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: AppSizes.xs,
              ),

              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final Role role = ref.read(selectedRoleProvider);
                  if (role == Role.seller || role == Role.driver) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        AppOutlineButton(
                          onPressed: () {
                            context.push(RoutePaths.order);
                          },
                          label: "Orders",
                          width: 150,
                          icon: const ImageLoader(
                            imagePath: AppIcons.order,
                            width: 16.0,
                            height: 16.0,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenItems,
              ),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const CartContainer();
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: AppSizes.md,
                    ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: AppSizes.sm,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: GestureDetector(
              onTap: () => context.push(
                RoutePaths.imageFullScreen,
                extra: <String, String>{
                  "imagePath":
                      "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2xvdGhpbmclMjBzdG9yZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                },
              ),
              child: const ImageLoader(
                imagePath:
                    "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2xvdGhpbmclMjBzdG9yZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                width: 80,
                height: 60,
              ),
            ),
          ),
          Column(
            spacing: AppSizes.xs,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Luréa",
                style: context.txtTheme.bodyLarge,
              ),
              Text(
                "Perfume",
                style: context.txtTheme.bodySmall,
              ),
              Text(
                "\$25",
                style: context.txtTheme.bodySmall,
              ),
            ],
          ),

          const Spacer(),

          IconButton.outlined(
            onPressed: () {
              Toast.showSuccess("Delete Successfully");
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
