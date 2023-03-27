import 'dart:convert';

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

	WritingModel({
		this.id, 
		this.studentId, 
		this.title, 
		this.content, 
		this.cover, 
		this.description, 
		this.status, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory WritingModel.fromMap(Map<String, dynamic> data) => WritingModel(
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
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'student_id': studentId,
				'title': title,
				'content': content,
				'cover': cover,
				'description': description,
				'status': status,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WritingModel].
	factory WritingModel.fromJson(String data) {
		return WritingModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [WritingModel] to a JSON string.
	String toJson() => json.encode(toMap());
}
