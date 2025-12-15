import 'package:app/features/auth/presentation/state/sign_in_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/forgot_password_controller.dart';
import '../controllers/reset_password_controller.dart';
import '../controllers/sign_in_controller.dart';
import '../controllers/sign_up_controller.dart';
import '../controllers/verify_email_controller.dart';
import '../state/forgot_password_state.dart';
import '../state/reset_password_state.dart';
import '../state/sign_up_form_state.dart';
import '../state/verify_email_form_state.dart';

//* ------------------------------------ Controller Providers ------------------------------------ */
final NotifierProvider<SignUpFormNotifier, SignUpFormState> signUpFormProvider =
    NotifierProvider<SignUpFormNotifier, SignUpFormState>(
      SignUpFormNotifier.new,
    );

// ignore: always_specify_types
final verifyEmailProvider =
    NotifierProvider.autoDispose<VerifyEmailNotifier, VerifyEmailState>(
      () => VerifyEmailNotifier(),
    );

final NotifierProvider<SignInNotifier, SignInFormState> signInProvider =
    NotifierProvider.autoDispose<SignInNotifier, SignInFormState>(
      () => SignInNotifier(),
    );

final NotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>
forgotPasswordProvider =
    NotifierProvider.autoDispose<ForgotPasswordNotifier, ForgotPasswordState>(
      () {
        return ForgotPasswordNotifier();
      },
    );

final NotifierProvider<ResetPasswordNotifier, ResetPasswordState>
resetPasswordProvider =
    NotifierProvider<ResetPasswordNotifier, ResetPasswordState>(
      () => ResetPasswordNotifier(),
    );
