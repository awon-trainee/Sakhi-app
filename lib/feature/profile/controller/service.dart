import 'dart:convert';
import 'package:http/http.dart';
import 'package:sakhi_app/feature/profile/model/profile_model.dart';
import '../../../core/constant/endpoint.dart';
import '../../../core/service/http.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final box = GetStorage();

  getUserData({
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.getRequest(
        endpoint: Endpoints.profile,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
      );
      var result = await jsonDecode(response.body);

      if (response.statusCode.toString().startsWith('2')) {
        onDone(result['data']);
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

  postUserData({
    required ProfileModelData user,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequest(
        endpoint: Endpoints.profile,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
        body: {
          'id_number': user.idNumber,
          'name': user.name,
          'phone': user.phone,
          'email': user.email,
          "monthly_income": user.monthlyIncome,
          'material_status': user.materialStatus,
          'income_source': user.incomeSource
        },
      );
      var result = await jsonDecode(response.body);

      if (response.statusCode.toString().startsWith('2')) {
        onDone(result['data']);
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


  logout({
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequestWithoutBody(
        endpoint: Endpoints.logout,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
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

  delete({
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequestWithoutBody(
        endpoint: Endpoints.delete,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
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
}
