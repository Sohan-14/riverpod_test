import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/custom_dropdown.dart';
import '../widgets/post_card.dart';

class PostProfileTab extends StatelessWidget {
  const PostProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.md,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "My Posts",
              style: context.txtTheme.bodyMedium,
            ),

            SizedBox(
              width: 200.0,
              height: 50.0,
              child: CustomDropdown<String>(
                options: const <String>["Weekly", "Monthly", "Yearly"],
                initialValue: "Monthly",
                displayString: (String value) {
                  return value;
                },
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),

        ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const PostCard();
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: AppSizes.md,
          ),
        ),
      ],
    );
  }
}
