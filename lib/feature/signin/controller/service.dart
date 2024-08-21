import 'dart:convert';
import 'package:http/http.dart';
import 'package:sakhi_app/feature/signin/model/validate_otp.dart';

import '../../../core/constant/endpoint.dart';
import '../../../core/service/http.dart';
import '../model/sign_in_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final box = GetStorage();
  signInByPhone({
    required SignInUser user,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequest(
        endpoint: Endpoints.loginByPhone,
        body: {
          'phone':'0${user.phoneNumber}',
        },
        headers: {
          'Accept' : 'application/json',
          'Content-Type':'application/json',
        },
      );
      var result = await jsonDecode(response.body);

      if (response.statusCode.toString().startsWith('2')) {

        onDone(result);
      } else if (response.statusCode.toString().startsWith('4')) {

        onError(result['message']);
      } else {
        onError('Please contact us');
      }
    } catch (e) {
      onError(e.toString());
    } finally {
      onFinally();
    }
  }
  validateOTP({
    required ValidateOTP user,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequest(
        endpoint: Endpoints.loginOTP,
        body: {
          'phone':  '0${user.phoneNumber}',
          'sms': user.sms
        },
        headers: {
          'Accept' : 'application/json',
          'Content-Type':'application/json',
        },
      );
      var result = await jsonDecode(response.body);

      if (response.statusCode.toString().startsWith('2')) {

        box.write('token', result['data']['token']);
        onDone(result);
      } else if (response.statusCode.toString().startsWith('4')) {

        onError(result['message']);
      } else {
        onError('Please contact us');
      }
    } catch (e) {
      onError(e.toString());
    } finally {
      onFinally();
    }
  }
}