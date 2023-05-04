import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_state_management/models/user_model.dart';

class ApiServices {
  String endpoint = 'https://reqres.in/api/users/?page=2';
  Future<List<User>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result =
          jsonDecode(response.body)['data']; //we want data section
      //we save it in the list, we want to convert it to an object , (CREATE MODEL)
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
