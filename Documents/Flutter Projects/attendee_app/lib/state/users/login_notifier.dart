import 'package:attendee_app/Screens/Login/login.dart';
import 'package:attendee_app/data/repository/users/login_abstract.dart';
import 'package:attendee_app/models/users/body/login.dart';
import 'package:attendee_app/providers/repo_provider.dart';
import 'package:attendee_app/state/users/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  final LoginRepo _loginRepository;

  LoginStateNotifier(Ref ref)
      : _loginRepository = ref.read(loginRepositoryProvider),
        super(LoginInitial());

  Future<void> login({
    required BuildContext context,
    required LoginModel value,
  }) async {
    state = LoginLoading();

    final userTransactionListOrError =
        await _loginRepository.login(value: value);

    state = userTransactionListOrError.fold(
      (l) => LoginFailure(
        failure: l,
      ),
      (r) => LoginSuccess(responseData: r),
    );

    if (state is LoginFailure) {
      final failureState = state as LoginFailure;
      final failuremessage = failureState.failure.message;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp){
        ShowToast.errorToast(context, failuremessage);
      });
    } else if (state is LoginSuccess) {}
  }

  void resetstate(){
     state = LoginInitial();
  }
}
