import 'package:flutter/widgets.dart';
import 'package:todos_client/todos_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  List todos = [];

  getTodos() async {
    todos = await client.todos.readAllTodos();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todos with Serverpod'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter a title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _controller2,
                decoration: const InputDecoration(
                  labelText: 'Enter a new content',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var todo = Todos(
                  title: _controller.text,
                  content: _controller2.text,
                  created_at: DateTime.now(),
                  updated_at: DateTime.now(),
                );
                client.todos.createTodo(todo);

                _controller.clear();
                _controller2.clear();
                setState(() {
                  getTodos();
                });
              },
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: getTodos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(todos[index].title),
                          subtitle: Text(todos[index].content),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              client.todos.delete(todos[index]);
                              setState(() {
                                getTodos();
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
