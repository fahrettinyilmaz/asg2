import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:asg2/model/user.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final result = jsonDecode(body) as List<dynamic>;
    final users = result.map((e) {
      final geo = Geo(
          lat: double.parse(e['address']['geo']['lat']),
          lng: double.parse(e['address']['geo']['lng']));
      final address = UserAddress(
          street: e['address']['street'],
          suite: e['address']['suite'],
          city: e['address']['city'],
          zipcode: e['address']['zipcode'],
          geo: geo);
      final company = UserCompany(
          name: e['company']['name'],
          bs: e['company']['bs'],
          catchPhrase: e['company']['catchPhrase']);
      return User(
          username: e['username'],
          name: e['name'],
          email: e['email'],
          website: e['website'],
          phone: e['phone'],
          address: address,
          company: company);
    }).toList();
    return users;
  }
}
