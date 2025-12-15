import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../providers/auth_providers.dart';
import '../state/sign_up_form_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_title_section.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
              const SizedBox(height: AppSizes.spaceBetweenSections),

              const ImageLoader(
                imagePath: AppIcons.signUp,
                width: 160,
                height: 160,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              const AuthTitleSection(
                title: "Create Your Account",
                subTitle: "Please provide your details to sign up",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(signUpFormProvider.notifier).setName = value,
                onEditingCompleted: () =>
                    ref.read(signUpFormProvider.notifier).markNameTouched(),
                errorText: ref.watch(
                  signUpFormProvider.select((SignUpFormState s) => s.nameError),
                ),
                labelText: 'User Name',
                prefixIcon: CupertinoIcons.profile_circled,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(signUpFormProvider.notifier).setEmail = value,
                onEditingCompleted: () =>
                    ref.read(signUpFormProvider.notifier).markEmailTouched(),
                errorText: ref.watch(
                  signUpFormProvider.select(
                    (SignUpFormState s) => s.emailError,
                  ),
                ),
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(signUpFormProvider.notifier).setLocation = value,
                labelText: 'Location',
                keyboardType: TextInputType.text,
                prefixIcon: Icons.location_on_outlined,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              DatePickerField(
                selectedDate: ref.watch(
                  signUpFormProvider.select(
                    (SignUpFormState s) => s.dateOfBirth,
                  ),
                ),
                onDateSelected: (DateTime? date) =>
                    ref.read(signUpFormProvider.notifier).setDateOfBirth = date,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AuthTextField(
                onChanged: (String value) =>
                    ref.read(signUpFormProvider.notifier).setPassword = value,
                onEditingCompleted: () =>
                    ref.read(signUpFormProvider.notifier).markPasswordTouched(),
                errorText: ref.watch(
                  signUpFormProvider.select(
                    (SignUpFormState s) => s.passwordError,
                  ),
                ),
                labelText: 'Password',
                obscureText: true,
                prefixIcon: Icons.lock,
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              // if (ref.watch(
              //       signUpFormProvider.select(
              //         (SignUpFormState s) => s.formError,
              //       ),
              //     ) !=
              //     null) ...<Widget>[
              //   Text(
              //     ref.watch(
              //       signUpFormProvider.select(
              //         (SignUpFormState s) => s.formError,
              //       ),
              //     ),
              //     style: context.txtTheme.bodyMedium?.copyWith(
              //       color: Colors.red,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              //   const SizedBox(height: AppSizes.spaceBetweenItems),
              // ],
              
              Row(
                children: <Widget>[
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: ref.watch(
                      signUpFormProvider.select(
                        (SignUpFormState s) => s.termsAccepted,
                      ),
                    ),
                    isError:
                        ref.watch(
                          signUpFormProvider.select(
                            (SignUpFormState s) => s.termsError,
                          ),
                        ) !=
                        null,
                    onChanged: (bool? value) {
                      if (value != null) {
                        ref.read(signUpFormProvider.notifier).setTermsAccepted =
                            value;
                      }
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "By creating an account, I accept the ",
                        style: context.txtTheme.bodyMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Terms & Conditions",
                            style: context.txtTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: " & ",
                          ),
                          TextSpan(
                            text: "Privacy Policy.",
                            style: context.txtTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBetweenItems),

              AppElevatedButton(
                onPressed: () {
                  debugPrint(
                    "Submit Sign Up valid: ${ref.watch(
                      signUpFormProvider.select((SignUpFormState s) => s.isValid),
                    )} submitting: ${ref.watch(
                      signUpFormProvider.select((SignUpFormState s) => s.isSubmitting),
                    )}",
                  );
                  if (ref.read(
                            signUpFormProvider.select(
                              (SignUpFormState s) => s.isSubmitting,
                            ),
                          ) ==
                          false &&
                      ref.read(
                        signUpFormProvider.select(
                          (SignUpFormState s) => s.isValid,
                        ),
                      )) {
                    debugPrint("dhaka 1");

                    ref.read(signUpFormProvider.notifier).submitSignUp(ref);
                  }
                  debugPrint("dhaka 2 ");

                  // context.go(
                  //   RoutePaths.verifyEmail,
                  //   extra: <String, String>{"type": "signup"},S
                  // );
                  // ref
                  //     .read(loginControllerProvider.notifier)
                  //     .login(
                  //       emailController.text,
                  //       passwordController.text,
                  //     );
                },
                isLoading: ref.watch(
                  signUpFormProvider.select(
                    (SignUpFormState s) => s.isSubmitting,
                  ),
                ),
                label: 'Continue',
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: context.txtTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () => context.push(RoutePaths.login),
                    child: Text(
                      'Sign In',
                      style: context.txtTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DatePickerField extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;

  const DatePickerField({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          onDateSelected(picked);
        }
      },
      child: AbsorbPointer(
        child: AuthTextField(
          controller: TextEditingController(
            text: selectedDate == null
                ? ''
                : DateFormat('dd/MM/yyyy').format(selectedDate!),
          ),
          labelText: 'Tap to select date',
          suffixIcon: Icons.calendar_today,
        ),
      ),
    );
  }
}
