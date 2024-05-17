import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? id;
  String name;
  String email;
  String type;
  String cin;
  String status;
  UserModel({
    this.status = "en attente",
    this.id,
    required this.cin,
    required this.name,
    required this.email,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'type': type,
      'cin': cin,
      'status': status
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cin: map['cin'],
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      type: map['type'] as String,
    );
  }
}
