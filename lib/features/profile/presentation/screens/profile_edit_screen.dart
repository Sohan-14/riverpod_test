// profile_edit_screen.dart
import 'dart:io';
import 'package:app/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/utils/toast/toast.dart';
import '../../domain/entities/user_profile.dart';
import '../controllers/profile_edit_controller.dart';
import '../providers/profile_providers.dart';
import '../state/profile_edit_state.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  final UserProfile userProfile;

  const ProfileEditScreen({super.key, required this.userProfile});

  @override
  ConsumerState<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with empty values first
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _bioController = TextEditingController();

    // Initialize notifier AFTER build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(profileEditProvider.notifier)
          .initializeWithProfile(widget.userProfile);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProfileEditState state = ref.watch(profileEditProvider);

    // Update controllers only when state changes (to avoid flicker)
    if (state.status == ProfileEditStatus.loaded) {
      _nameController.text = state.name;
      _phoneController.text = state.phone;
      _addressController.text = state.address;
      _bioController.text = state.bio;
    }

    if (state.status == ProfileEditStatus.initial) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Edit Profile"),
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
              // Profile Image
              GestureDetector(
                onTap: () => _pickImage(ref.read(profileEditProvider.notifier)),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    ClipOval(
                      child: Container(
                        width: 120,
                        height: 120,
                        color: AppColors.grey.withValues(alpha: 0.2),
                        child: state.imageUrl != null
                            ? ImageLoader(
                                imagePath: state.imageUrl!,
                                width: 120,
                                height: 120,
                              )
                            : const Icon(
                                Icons.person,
                                size: 60,
                                color: AppColors.grey,
                              ),
                      ),
                    ),
                    if (state.isUploadingImage)
                      const Positioned.fill(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ).centered,

              if (state.uploadError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    state.uploadError!,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ).centered,
                ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AppTextField(
                controller: _nameController,
                onChanged: (String v) =>
                    ref.read(profileEditProvider.notifier).setName(v),
                labelText: 'Name',
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppTextField(
                controller: _phoneController,
                onChanged: (String v) =>
                    ref.read(profileEditProvider.notifier).setPhone(v),
                labelText: 'Phone',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppTextField(
                controller: _addressController,
                onChanged: (String v) =>
                    ref.read(profileEditProvider.notifier).setAddress(v),
                labelText: 'Address',
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppTextField(
                controller: _bioController,
                onChanged: (String v) =>
                    ref.read(profileEditProvider.notifier).setBio(v),
                labelText: 'Bio',
                minLines: 3,
                maxLines: 5,
              ),
              const SizedBox(height: AppSizes.spaceBetweenItems),

              if (state.submitError != null)
                Text(
                  state.submitError!,
                  style: const TextStyle(color: Colors.red),
                ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AppElevatedButton(
                onPressed: state.isSubmitting
                    ? null
                    : () {
                        ref
                            .read(profileEditProvider.notifier)
                            .updateProfile()
                            .then((_) {
                              if (ref.read(profileEditProvider).submitError ==
                                  null) {
                                Toast.showSuccess("Profile updated!");
                                ref.invalidate(userProfileProvider);
                                Navigator.of(context).pop();
                              }
                            });
                      },
                label: state.isSubmitting ? 'Updating...' : 'Update Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage(ProfileEditNotifier notifier) async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      notifier.setImageFile(File(image.path));
    }
  }
}
