/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Todos implements _i1.SerializableModel {
  Todos._({
    this.id,
    required this.title,
    required this.content,
    required this.created_at,
    required this.updated_at,
  });

  factory Todos({
    int? id,
    required String title,
    required String content,
    required DateTime created_at,
    required DateTime updated_at,
  }) = _TodosImpl;

  factory Todos.fromJson(Map<String, dynamic> jsonSerialization) {
    return Todos(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      created_at:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['created_at']),
      updated_at:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updated_at']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String content;

  DateTime created_at;

  DateTime updated_at;

  Todos copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? created_at,
    DateTime? updated_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'created_at': created_at.toJson(),
      'updated_at': updated_at.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TodosImpl extends Todos {
  _TodosImpl({
    int? id,
    required String title,
    required String content,
    required DateTime created_at,
    required DateTime updated_at,
  }) : super._(
          id: id,
          title: title,
          content: content,
          created_at: created_at,
          updated_at: updated_at,
        );

  @override
  Todos copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
    DateTime? created_at,
    DateTime? updated_at,
  }) {
    return Todos(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }
}
