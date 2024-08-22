import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola Mundo',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Material App Bar'),
            actions: const [Icon(Icons.alarm), Icon(Icons.abc_rounded)],
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  child: const Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Widgets
                      MiWidget(text: "1er Texto", icon: Icons.home),
                      MiWidget(text: "2do Texto", icon: Icons.star),
                      MiWidget(text: "3er Texto", icon: Icons.favorite),
                    ],
                  ),
                ),
                const MyWidgetStateful(),
              ],
            ),
          )),
    );
  }
}

class MiWidget extends StatelessWidget {
  const MiWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Mi primer widget"),
        Text(text),
        Icon(icon),
      ],
    );
  }
}

class MyWidgetStateful extends StatefulWidget {
  const MyWidgetStateful({super.key});

  @override
  State<MyWidgetStateful> createState() => _MyWidgetStatefulState();
}

class _MyWidgetStatefulState extends State<MyWidgetStateful> {
  late int _contador;
  // Método que se ejecuta al inicio (Cuando se crea el widget)
  // Nos sirve para inicializar métodos = programación asincrona
  // Se ejecuta antes del primer frame (initState) [][][][]
  @override
  void initState() {
    super.initState();
    _contador = 0;
    print("INIT_STATE");
  }

  // Método que se ejecu)
  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_contador);
    return Column(
      children: [
        Text("Contador: $_contador"),
        TextButton(
          onPressed: () {
            setState(() {
              _contador++;
            });
            print(_contador);
          },
          child: const Text("Sumar Contador"),
        ),
      ],
    );
  }
}

/// Inicia un widget
/// initState -> Renderiza(build) -> dispose
/// setState(()  {}); -> Vuelve a ejecutar el build
/// Cuidado! con el uso excesivo setState