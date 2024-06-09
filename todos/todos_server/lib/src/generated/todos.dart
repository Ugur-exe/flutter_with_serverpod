/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Todos extends _i1.TableRow implements _i1.ProtocolSerialization {
  Todos._({
    int? id,
    required this.title,
    required this.content,
    required this.created_at,
    required this.updated_at,
  }) : super(id);

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

  static final t = TodosTable();

  static const db = TodosRepository._();

  String title;

  String content;

  DateTime created_at;

  DateTime updated_at;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'created_at': created_at.toJson(),
      'updated_at': updated_at.toJson(),
    };
  }

  static TodosInclude include() {
    return TodosInclude._();
  }

  static TodosIncludeList includeList({
    _i1.WhereExpressionBuilder<TodosTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TodosTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TodosTable>? orderByList,
    TodosInclude? include,
  }) {
    return TodosIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Todos.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Todos.t),
      include: include,
    );
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

class TodosTable extends _i1.Table {
  TodosTable({super.tableRelation}) : super(tableName: 'todos') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    created_at = _i1.ColumnDateTime(
      'created_at',
      this,
    );
    updated_at = _i1.ColumnDateTime(
      'updated_at',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnDateTime created_at;

  late final _i1.ColumnDateTime updated_at;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        content,
        created_at,
        updated_at,
      ];
}

class TodosInclude extends _i1.IncludeObject {
  TodosInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Todos.t;
}

class TodosIncludeList extends _i1.IncludeList {
  TodosIncludeList._({
    _i1.WhereExpressionBuilder<TodosTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Todos.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Todos.t;
}

class TodosRepository {
  const TodosRepository._();

  Future<List<Todos>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TodosTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TodosTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TodosTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Todos>(
      where: where?.call(Todos.t),
      orderBy: orderBy?.call(Todos.t),
      orderByList: orderByList?.call(Todos.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Todos?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TodosTable>? where,
    int? offset,
    _i1.OrderByBuilder<TodosTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TodosTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Todos>(
      where: where?.call(Todos.t),
      orderBy: orderBy?.call(Todos.t),
      orderByList: orderByList?.call(Todos.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Todos?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Todos>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Todos>> insert(
    _i1.Session session,
    List<Todos> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Todos>(
      rows,
      transaction: transaction,
    );
  }

  Future<Todos> insertRow(
    _i1.Session session,
    Todos row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Todos>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Todos>> update(
    _i1.Session session,
    List<Todos> rows, {
    _i1.ColumnSelections<TodosTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Todos>(
      rows,
      columns: columns?.call(Todos.t),
      transaction: transaction,
    );
  }

  Future<Todos> updateRow(
    _i1.Session session,
    Todos row, {
    _i1.ColumnSelections<TodosTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Todos>(
      row,
      columns: columns?.call(Todos.t),
      transaction: transaction,
    );
  }

  Future<List<Todos>> delete(
    _i1.Session session,
    List<Todos> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Todos>(
      rows,
      transaction: transaction,
    );
  }

  Future<Todos> deleteRow(
    _i1.Session session,
    Todos row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Todos>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Todos>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TodosTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Todos>(
      where: where(Todos.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TodosTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Todos>(
      where: where?.call(Todos.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
