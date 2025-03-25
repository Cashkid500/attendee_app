import 'package:attendee_app/data/repository/users/edit_profile_abstract.dart';
import 'package:attendee_app/models/users/body/edit_profile.dart';
import 'package:attendee_app/providers/repo_provider.dart';
import 'package:attendee_app/state/users/edit_profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileStateNotifier extends StateNotifier<EditProfileState> {
  final EditProfileRepo _editProfileRepository;

  EditProfileStateNotifier(Ref ref)
      : _editProfileRepository = ref.read(editProfileRepositoryProvider),
        super(EditProfileInitial());

  Future<void> editProfile({
    required EditProfileModel payload,
  }) async {
    state = EditProfileLoading();

    final userTransactionListOrError =
        await _editProfileRepository.editProfile(payload: payload);

    state = userTransactionListOrError.fold(
      (l) => EditProfileFailure(
        failure: l,
      ),
      (r) => EditProfileSuccess(responseData: r),
    );

    if (state is EditProfileFailure) {
      final failureState = state as EditProfileFailure;
    } else if (state is EditProfileSuccess) {}
  }

  void resetstate() {
    state = EditProfileInitial();
  }
}
