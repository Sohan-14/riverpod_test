import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/sign_up_controller.dart';
import '../state/sign_up_form_state.dart';



//* ------------------------------------ Controller Providers ------------------------------------ */
final NotifierProvider<SignUpFormNotifier, SignUpFormState> signUpFormProvider =
    NotifierProvider<SignUpFormNotifier, SignUpFormState>(
      SignUpFormNotifier.new,
    );
