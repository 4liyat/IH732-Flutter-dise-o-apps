import 'package:flutter/material.dart';
import 'package:testflutter/screens/splash_screen.dart'; // Import the SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movieteca',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Text Widget
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '1. Text Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Este es un ejemplo de un widget de texto simple.',
              ),
            ),

            const Divider(),

            // 2. Row Widget
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '2. Row Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home),
                Icon(Icons.search),
                Icon(Icons.person),
              ],
            ),

            const Divider(),

            // 3. Column Widget
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '3. Column Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Elemento 1 de la columna'),
                Text('Elemento 2 de la columna'),
                Text('Elemento 3 de la columna'),
              ],
            ),

            const Divider(),

            // 4. Stack Widget
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '4. Stack Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                const Text('Encima'),
              ],
            ),

            const Divider(),

            // 5. Container Widget
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '5. Container Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text('Este es un contenedor'),
            ),
          ],
        ),
      ),
    );
  }
}