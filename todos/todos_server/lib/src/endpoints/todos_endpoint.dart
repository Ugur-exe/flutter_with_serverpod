import 'package:serverpod/serverpod.dart';
import 'package:todos_server/src/generated/protocol.dart';

class TodosEndpoint extends Endpoint {
  Future<void> createTodo(Session session, Todos todos) async {
    try {
      await Todos.db.insertRow(session, todos);
    } catch (e) {
      throw Exception('Error creating todo: $e');
    }
  }

  Future<List<Todos>> readAllTodos(Session session) async {
    try {
      return await Todos.db
          .find(session, orderBy: (p0) => p0.id, orderDescending: true);
    } catch (e) {
      throw Exception('Error reading todos: $e');
    }
  }

  Future<void> delete(Session session, Todos todos) async {
    await Todos.db.deleteRow(session, todos);
  }
}
