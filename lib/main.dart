import 'package:flutter/material.dart';
import 'package:flutter_tutorial/dummy_json_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Mitm Proxy Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  Future<void> _loadData() async {
    final api = DummyJsonApi();

    setState(() {
      _isLoading = true;
    });

    final loginFuture = api.login();
    final productsFuture = api.products();
    final todosFuture = api.todos();

    await Future.wait([
      loginFuture,
      productsFuture,
      todosFuture,
    ]);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 16, horizontal: 24),
            ),
            _isLoading ? CircularProgressIndicator() : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadData,
        tooltip: 'Load',
        child: const Icon(Icons.add),
      ),
    );
  }
}
