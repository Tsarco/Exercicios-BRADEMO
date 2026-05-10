import 'package:flutter/material.dart';
import 'package:flutter_ex1/Lista_Aula06/ex03/post.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: const Color.fromARGB(249, 255, 255, 255),
          ),
        ),
      ),
      title: 'Flutter Demo',
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = null;

  @override
  initState() {
    super.initState();
    fetchData();
  }

  //pega dados online, conectando
  Future<void> fetchData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    await Future.delayed(Duration(seconds: 5));
    Post postInicial = Post.fromJson(response.body);

    setState(() {
      data =
          'Status Inicial: ${response.statusCode} \n Response Body: ${postInicial.toJson()}';
    });
  }

  //GET
  Future<void> getPost() async {
    setState(() {
      data = null;
    });

    var url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    Post postEncontrado = Post.fromJson(response.body);

    setState(() {
      data =
          'Status Response: ${response.statusCode} \n Response Body: ${postEncontrado.toJson()}';
    });
  }

  //GET LISTA
  Future<void> getLista() async {
    setState(() {
      data = null;
    });

    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    setState(() {
      data =
          'Status Response: ${response.statusCode} \n Lista recuperada: ${response.body}';
    });
  }

  //POST
  Future<void> postarPost() async {
    setState(() {
      data = null;
    });

    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');

    Post novoPost = Post(1, 0, "IFGRAM", "Post feito com sucesso!!! :D");

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: novoPost.toJson(),
    );

    setState(() {
      data =
          'Status Response: ${response.statusCode} \n Response Body: ${response.body}';
    });
  }

  //PUT
  Future<void> putPost() async {
    setState(() {
      data = null;
    });

    var url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');

    Post postAtualizado = Post(
      1,
      1,
      "IFGRAM2",
      "Post atualizado com sucesso!!! :D",
    );

    var response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: postAtualizado.toJson(),
    );

    setState(() {
      data =
          'Status Response: ${response.statusCode} \n Response Body: ${response.body}';
    });
  }

  //DELETE
  Future<void> deletarPost() async {
    setState(() {
      data = null;
    });

    var url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
    var response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    setState(() {
      data =
          'Status Delete: ${response.statusCode}\n Response Body: ${response.body}';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
          children: [
            SizedBox(height: 30),
            ElevatedButton(onPressed: getPost, child: Text("GET")),

            ElevatedButton(onPressed: getLista, child: Text("GET LISTA")),

            ElevatedButton(onPressed: postarPost, child: Text("POST")),

            ElevatedButton(onPressed: putPost, child: Text("PUT")),

            ElevatedButton(onPressed: deletarPost, child: Text("DELETE")),

            SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(data.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
