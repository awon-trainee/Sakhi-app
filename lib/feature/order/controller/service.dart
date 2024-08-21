import 'dart:convert';
import 'package:http/http.dart';

import '../../../core/constant/endpoint.dart';
import '../../../core/service/http.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final box = GetStorage();

  allOrders({
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.getRequest(
        endpoint: Endpoints.allOrders,
        headers: {
          'Accept' : 'application/json',
          'Content-Type':'application/json',
          'Authorization':'Bearer ${box.read('token')}'

        },
      );
      var result = await jsonDecode(response.body);


      if (response.statusCode.toString().startsWith('2')) {

        onDone(result['data']);
      } else if (response.statusCode.toString().startsWith('4')) {

        onError(result);
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