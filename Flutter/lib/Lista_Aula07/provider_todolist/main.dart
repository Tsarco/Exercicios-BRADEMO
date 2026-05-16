import 'package:flutter/material.dart';
import 'package:flutter_ex1/Lista_Aula07/provider_todolist/todo_cache.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoCache())],
      child: MaterialApp(home: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => TodoCache(),
    //   builder: (context, child) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => SelectTodoItem())),
              child: Text("Seleciona Item "),
            ),
            TextButton(
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => ShowTodoItem())),
              child: Text("Mostra Item "),
            ),
          ],
        ),
      ),
    );
    //   },
    // );
  }
}

class SelectTodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoCache>(
      builder: (context, cache, child) {
        return Scaffold(
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  cache.index = 0;
                  Navigator.of(context).pop();
                },
                child: Text("Select 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  cache.index = 1;
                  Navigator.of(context).pop();
                },
                child: Text("Select 2"),
              ),
              ElevatedButton(
                onPressed: () {
                  cache.index = 2;
                  Navigator.of(context).pop();
                },
                child: Text("Select 3"),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShowTodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoCache>(
      builder: (context, cache, child) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(child: Text("${cache.list[cache.index].title}")),
        );
      },
    );
  }
}
