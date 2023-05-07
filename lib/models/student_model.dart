import 'dart:convert';

import 'package:read_app/models/book_model.dart';
import 'package:read_app/models/user_model.dart';

class StudentModel {
  int? id;
  int? userId;
  String? nik;
  String? classs;
  String? major;
  String? address;
  int? point;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? user;

  StudentModel({
    this.id,
    this.userId,
    this.nik,
    this.classs,
    this.major,
    this.address,
    this.point,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory StudentModel.fromJson(Map<String, dynamic> data) => StudentModel(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        nik: data['nik'] as String?,
        classs: data['class'] as String?,
        major: data['major'] as String?,
        address: data['address'] as String?,
        point: data['point'] as int?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        user: UserModel.fromJson(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'nik': nik,
        'class': classs,
        'major': major,
        'address': address,
        'point': point,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };
}
