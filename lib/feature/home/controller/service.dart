import 'dart:convert';
import 'package:http/http.dart';
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

  homeData({
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequestWithoutBody(
        endpoint: Endpoints.home,
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

  allMarketData({
    required String categoryId,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.getRequest(
        endpoint: Endpoints.allMarket + categoryId,
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

  marketDetailsData({
    required String marketID,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.getRequest(
        endpoint: Endpoints.marketDetails + marketID,
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

  marketPurchase({
    required int itemId,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequest(
        body: {'item_id': itemId},
        endpoint: Endpoints.purchase,
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
