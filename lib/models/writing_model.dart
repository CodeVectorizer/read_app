import 'dart:convert';

import 'package:read_app/models/student_model.dart';

class WritingModel {
  int? id;
  int? studentId;
  String? title;
  String? content;
  String? cover;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  StudentModel? student;

  WritingModel(
      {this.id,
      this.studentId,
      this.title,
      this.content,
      this.cover,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.student});

  factory WritingModel.fromJson(Map<String, dynamic> data) => WritingModel(
        id: data['id'] as int?,
        studentId: data['student_id'] as int?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        cover: data['cover'] as String?,
        description: data['description'] as String?,
        status: data['status'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        student: StudentModel.fromJson(data['student'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'student_id': studentId,
        'title': title,
        'content': content,
        'cover': cover,
        'description': description,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'student': student?.toJson()
      };
}
