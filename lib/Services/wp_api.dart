import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreferences;

Future<List> fetchtitle() async {
  final response = await http.get(
      'http://whatsawhizzerwebnovels.com/wp-json/v2/app/catagories',
      headers: {'Accept': 'application/json'});
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    print(response.body);
    return json.decode(response.body);
  }
}

Future<List> fetchPosts(int perpage, int id, int offset) async {
  sharedPreferences = await SharedPreferences.getInstance();
  String token = sharedPreferences.getString('token');
  final response = await http.get(
      'http://whatsawhizzerwebnovels.com/wp-json/v2/app/posts?per_page=$perpage&category=$id&off_set=$offset&',
      headers: {
        'Accept': 'Application/json',
        'Authorization': 'Bearer $token'
      });
  if (response.statusCode == 200) {
    print(response.body);
    return json.decode(response.body);
  } else {
    print(response.body);
    return json.decode(response.body);
  }
}
