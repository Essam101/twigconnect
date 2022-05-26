import 'dart:convert';

import 'package:twigconnect/features/auth/domain/entities/users_entity.dart';

class UserModel extends UsersEntity {
  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
