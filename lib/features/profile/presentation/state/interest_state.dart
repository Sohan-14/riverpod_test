class InterestState {
  final List<String> selectedInterests;
  final bool isSubmitting;
  final String? formError;

  const InterestState({
    this.selectedInterests = const <String>[],
    this.isSubmitting = false,
    this.formError,
  });

  InterestState copyWith({
    List<String>? selectedInterests,
    bool? isSubmitting,
    String? formError,
  }) {
    return InterestState(
      selectedInterests: selectedInterests ?? this.selectedInterests,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      formError: formError,
    );
  }
}
