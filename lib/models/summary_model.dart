import 'dart:convert';

import 'package:read_app/models/book_model.dart';

class SummaryModel {
  int? id;
  int? studentId;
  int? bookId;
  String? content;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  BookModel book;

  SummaryModel({
    this.id,
    this.studentId,
    this.bookId,
    this.content,
    this.status,
    this.createdAt,
    this.updatedAt,
    required this.book,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> data) => SummaryModel(
        id: data['id'] as int?,
        studentId: data['student_id'] as int?,
        bookId: data['book_id'] as int?,
        content: data['content'] as String?,
        status: data['status'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        book: BookModel.fromJson(data['book'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'student_id': studentId,
        'book_id': bookId,
        'content': content,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'book': book.toJson(),
      };
}
