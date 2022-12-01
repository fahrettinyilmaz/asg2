import 'package:asg2/model/user_address.dart';
import 'package:asg2/model/user_company.dart';

class User {
  final String username;
  final String name;
  final String email;
  final String phone;
  final String website;
  final UserAddress address;
  final UserCompany company;

  User(
      {required this.username,
      required this.name,
      required this.email,
      required this.phone,
      required this.website,
      required this.address,
      required this.company});

  factory User.fromMap(Map<String, dynamic> e) {
    final geo = Geo.fromMap(e['geo']);
    final address = UserAddress.fromMap(e['address']);
    final company = UserCompany.fromMap(e['company']);
    return User(
        username: e['username'],
        name: e['name'],
        email: e['email'],
        website: e['website'],
        phone: e['phone'],
        address: address,
        company: company);
  }

  String get fullAddress {
    return address.street + ' - ' + address.city;
  }
}

class UserCompany {
  final String name;
  final String catchPhrase;
  final String bs;
  UserCompany(
      {required this.name, required this.catchPhrase, required this.bs});

  factory UserCompany.fromMap(Map<String, dynamic> json) {
    return UserCompany(
      name: json['name'],
      bs: json['bs'],
      catchPhrase: json['catchPhrase'],
    );
  }
}

class UserAddress {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;
  UserAddress(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory UserAddress.fromMap(Map<String, dynamic> json) {
    return UserAddress(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: json['geo']);
  }
}

class Geo {
  final double lat;
  final double lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromMap(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
