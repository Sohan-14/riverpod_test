import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/core/shared/widgets/app_text_field.dart';
import 'package:app/core/shared/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';

class SendDeliveryScreen extends StatelessWidget {
  const SendDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Send Delivery',
        showBackBtn: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pickup Details',
              style: context.txtTheme.titleLarge,
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems),
            AppTextField(
              controller: TextEditingController(),
              labelText: "Address Line 1",
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),
            AppTextField(
              controller: TextEditingController(),
              labelText: "Address Line 2",
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),
            AppTextField(
              controller: TextEditingController(),
              labelText: "State",
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),
            AppTextField(
              controller: TextEditingController(),
              labelText: "Zip Code",
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),
            AppTextField(
              controller: TextEditingController(),
              labelText: "Country",
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            Text(
              'Receiver Details',
              style: context.txtTheme.titleLarge,
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems),

            Container(
              width: context.screenWidth,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name: John Doe',
                    style: context.txtTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Phone: +1 234 567 890',
                    style: context.txtTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Location: 123 Main St, City, Country',
                    style: context.txtTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceBetweenSections),
            Text(
              'Parcel Details',
              style: context.txtTheme.titleLarge,
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems),

            CustomDropdown<String>(
              options: const <String>[
                "Document",
                "Small Package",
                "Large Package",
                "Fragile Item",
              ],
              displayString: (String option) => option,
              hint: "Select Parcel Type",
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            CustomDropdown<String>(
              options: const <String>[
                "Up to 1 kg",
                "1-5 kg",
                "5-10 kg",
                "Above 10 kg",
              ],
              displayString: (String option) => option,
              hint: "Select Parcel Capacity",
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            CustomDropdown<String>(
              options: const <String>[
                "Bike",
                "Car",
                "Truck",
                "Van",
              ],
              displayString: (String option) => option,
              hint: "Vehicle Type",
            ),

            // const SizedBox(height: AppSizes.spaceBetweenItems),
            // Text(
            //   'Who Will Pay?',
            //   style: context.txtTheme.titleLarge,
            // ),
            // const SizedBox(height: AppSizes.spaceBetweenItems),

            // Row(
            //   spacing: AppSizes.md,
            //   children: <Widget>[
            //     RadioListTile<String>(
            //       title: const Text('Seller'),
            //       value: 'Seller',
            //       groupValue: 'Seller',
            //       onChanged: (String? value) {},
            //     ).expanded,
            //     RadioListTile<String>(
            //       title: const Text('Receiver'),
            //       value: 'Receiver',
            //       groupValue: 'Sender',
            //       onChanged: (String? value) {},
            //     ).expanded,
            //   ],
            // ),
            const SizedBox(height: AppSizes.spaceBetweenItems),
            AppTextField(
              controller: TextEditingController(),
              labelText: "Additional Information",
              minLines: 7,
              maxLines: 10,
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems),

            AppElevatedButton(
              label: "Find Driver",
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
