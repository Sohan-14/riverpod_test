import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../auth/presentation/widgets/auth_text_field.dart';

class CheckoutFormScreen extends StatelessWidget {
  const CheckoutFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressLine1Controller =
        TextEditingController();
    final TextEditingController addressLine2Controller =
        TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController zipController = TextEditingController();
    final TextEditingController countryController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Checkout Form",
        showBackBtn: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.spaceBetweenItems,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                controller: nameController,
                labelText: 'Name',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                controller: phoneController,
                labelText: 'Phone',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                controller: addressLine1Controller,
                labelText: 'Address Line 1',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                controller: addressLine2Controller,
                labelText: 'Address Line 2',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                controller: stateController,
                labelText: 'State',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                controller: zipController,
                labelText: 'Zip Code',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                controller: countryController,
                labelText: 'Country',
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),
              AppElevatedButton(
                onPressed: () {
                  context.push(RoutePaths.confirmOrder);
                },
                label: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
