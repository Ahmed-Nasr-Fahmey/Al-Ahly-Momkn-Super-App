import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../shared/app_constants.dart';
import '../../../../../../shared/cache_constants.dart';
import '../../../../../Ordering_Notifications/core/utils/cache_helper.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/api_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  UserModel user = UserModel();

  Future<void> createNewUser() async {
    emit(SignUpLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.createNewUser(userModel: user);
      if (data['message'] == 'User Created Successfully') {
        emit(SignUpSuccessState());
      } else if (data['message'] == 'National ID already exists') {
        emit(SignUpFaliureState(erorrMessage: 'National ID already exists'));
      } else if (data['message'] == 'User already exists') {
        emit(SignUpFaliureState(erorrMessage: 'User already exists'));
      } else if (data['message'] == 'Internal server error') {
        emit(SignUpFaliureState(erorrMessage: 'Internal Server Error, try later.'));
      }
    } catch (e) {
      emit(SignUpFaliureState(erorrMessage: 'There was an error, try again.'));
    }
  }

  Future<void> login({required String userEmail, required String userPass, required String userNID}) async {
    emit(LoginLoadingState());
    try {
      Map<String, dynamic> data = await ApiService.login(userEmail: userEmail, userNID: userNID, userPass: userPass);
      if (data['message'] == 'Login successful') {
        // user = UserModel();
        user = UserModel.fromJson(data['user']);
        log("user id from datasource is ${user.userID}");
        await CacheHelper.put(cachedUserCacheKey, user.toJson());
        await AppConstants.initAppConstants();
        log("user id after caching is ${AppConstants.cachedCurrentUserObject!.userID}");

        emit(LoginSuccessState());
      } else if (data['message'] == 'National ID does not match') {
        log('National ID does not match');
        emit(LoginFaliureState(erorrMessage: 'National ID does not match'));
      } else if (data['message'] == 'User not found') {
        log('User not found');
        emit(LoginFaliureState(erorrMessage: 'User not found'));
      } else if (data['message'] == 'Wrong password') {
        log('Wrong password');
        emit(LoginFaliureState(erorrMessage: 'Wrong password'));
      } else if (data['message'] == 'Internal Server Error') {
        log('Internal Server Error');
        emit(LoginFaliureState(erorrMessage: 'Internal Server Error'));
      }
    } catch (e) {
      log(e.toString());
      emit(LoginFaliureState(erorrMessage: 'There was an error, try again.'));
    }
  }

  Future<void> scanQrCode({required String consumerId}) async {
    await ApiService.scanQrCode(agentId: AppConstants.cachedCurrentUserObject!.userID!, consumerId: consumerId);
  }
}
