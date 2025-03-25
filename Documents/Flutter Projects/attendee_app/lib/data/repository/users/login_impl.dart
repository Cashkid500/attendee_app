import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/login_abstract.dart';
import 'package:attendee_app/data/source/users/login_abstract.dart';
import 'package:attendee_app/models/users/body/login.dart';
import 'package:attendee_app/models/users/response/login.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:attendee_app/services/auth_manager/auth_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRepoImpl implements LoginRepo{
  final NetworkInfo netinfo;
  final Login log;
  LoginRepoImpl({required Ref ref})
      : log = ref.read(loginSourceProvider),
        netinfo = ref.read(networkInfoProvider);
        
@override
        Future<Either<Failure, LoginResponse>> login({
      required LoginModel value,
  }){
    ServiceRunner<Failure, LoginResponse> sR = ServiceRunner(netinfo);

    return sR.tryRemoteandCatch(
      call: log.login(value: value).then((value){
        return AuthManager.instance.saveAuthenticatedUser(value);
          
      }),
      errorTitle: "Login Error,"
    );
  }
}