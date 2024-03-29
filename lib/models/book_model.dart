import 'dart:convert';

class BookModel {
  int? id;
  String? title;
  String? author;
  String? publisher;
  String? year;
  String? isbn;
  String? cover;
  String? file;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? is_read;

  BookModel({
    this.id,
    this.title,
    this.author,
    this.publisher,
    this.year,
    this.isbn,
    this.cover,
    this.file,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.is_read,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        author: json['author'] as String?,
        publisher: json['publisher'] as String?,
        year: json['year'] as String?,
        isbn: json['isbn'] as String?,
        cover: json['cover'] as String?,
        file: json['file'] as String?,
        description: json['description'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        is_read: json['is_read'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'publisher': publisher,
        'year': year,
        'isbn': isbn,
        'cover': cover,
        'file': file,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'is_read': is_read,
      };
}
