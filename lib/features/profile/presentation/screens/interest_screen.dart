import 'package:app/core/config/colors.dart';
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<String> selectedChips = <String>[];

  // List of available options for chips
  final List<String> chipLabels = <String>[
    '🎉 Events & Nightlife',
    '🎵 Music',
    '🐾 Animals & Pets',
    '🌍 Sports',
    '🧘 Mindfulness & Spirituality',
    '👗 Fashion & Style',
    '🎬 Movies & TV',
    '💻 Tech & Gadgets',
    '✏️ Art & Design',
    '🎙️ Podcasts & Talk Shows',
    '📷 Photography & Videography',
    '🎮 Gaming',
    '📚 Books & Literature',
    '🍳 Food & Cooking',
    '✈️ Travel & Adventure',
    '📰 News & Current Events',
    '🏛️ Culture & History',
    '🏋️ Fitness & Wellness',
    '💼 Business & Finance',
    '🌱 Nature & Environment',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Your Interest",
        showBackBtn: false,
        titleAlignment: TitleAlignment.center,
        alignmentValue: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Select a few of your interests and let everyone know what you’re passionate about.",
            textAlign: TextAlign.center,
              style: context.txtTheme.bodyMedium?.copyWith(
                wordSpacing: 2.0,
                height: 2.0,
              ),
            ),
            const SizedBox(
              height: AppSizes.md,
            ),
            Wrap(
              spacing: 4.0, // Horizontal space between chips
              runSpacing: 0, // Vertical space between chips
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: chipLabels.map((String label) {
                return ChoiceChip(
                  selectedColor: AppColors.primary.withValues(alpha: .5),
                  label: Text(
                    label,
                    style: context.txtTheme.bodyMedium,
                  ),
                  selected: selectedChips.contains(label),
                  onSelected: (bool isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedChips.add(label);
                      } else {
                        selectedChips.remove(label);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            AppElevatedButton(
              onPressed: () {
                context.push(RoutePaths.bottomNav);
              },
              label: 'Continue',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
