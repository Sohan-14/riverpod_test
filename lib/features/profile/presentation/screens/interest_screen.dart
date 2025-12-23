import 'package:app/core/config/colors.dart';
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:app/core/storage/secure_storage_service.dart';
import 'package:app/features/profile/presentation/controllers/interest_controller.dart';
import 'package:app/features/profile/presentation/providers/profile_providers.dart'; // adjust path
import 'package:app/features/profile/presentation/state/interest_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';

class InterestScreen extends ConsumerWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final InterestState state = ref.watch(interestProvider);
    final InterestNotifier notifier = ref.read(interestProvider.notifier);

    const List<String> chipLabels = <String>[
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


    return Scaffold(
      appBar: CustomAppBar(
        title: "Your Interest",
        showBackBtn: false,
        titleAlignment: TitleAlignment.left,
        alignmentValue: 0,
        elevation: 4.0,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await SecureStorageService().clear();
              context.go(RoutePaths.role);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Text(
              "Select a few of your interests and let everyone know what you’re passionate about.",
              textAlign: TextAlign.start,
              style: context.txtTheme.bodyMedium?.copyWith(
                wordSpacing: 2.0,
                height: 2.0,
              ),
            ),
            const SizedBox(height: AppSizes.md),
            Wrap(
              spacing: 4.0,
              runSpacing: 8.0,
              children: chipLabels.map((String label) {
                final bool isSelected = state.selectedInterests.contains(label);
                return ChoiceChip(
                  selectedColor: AppColors.primary.withValues(alpha: 0.5),
                  label: Text(label, style: context.txtTheme.bodyMedium),
                  selected: isSelected,
                  onSelected: (bool selected) {
                    final List<String> newSelection = List<String>.from(
                      state.selectedInterests,
                    );
                    if (selected) {
                      newSelection.add(label);
                    } else {
                      newSelection.remove(label);
                    }
                    notifier.setSelectedInterests(newSelection);
                  },
                );
              }).toList(),
            ),
            if (state.formError != null) ...<Widget>[
              const SizedBox(height: 12),
              Text(
                state.formError!,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 20),
            AppElevatedButton(
              onPressed: state.isSubmitting
                  ? null
                  : () => notifier.submitInterests(),
              isLoading: state.isSubmitting,
              label: 'Continue',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
