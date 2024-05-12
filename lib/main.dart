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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue
        )
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
  String figura = '';
  String mensaje = '';

  void dibujarFigura() {
    setState(() {
      if (_controller.text.toLowerCase() == 'triángulo') {
        figura = 'triángulo';
        mensaje = '';
      } else if (_controller.text.toLowerCase() == 'cuadrado') {
        figura = 'cuadrado';
        mensaje = '';
      } else if(_controller.text.toLowerCase() == 'círculo'){
        figura = 'círculo';
        mensaje = '';
      }else if(_controller.text.toLowerCase() == 'línea'){
        figura = 'línea';
        mensaje = '';
      } else {
        figura = '';
        mensaje = 'Figura no encontrada';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dibujo de Figuras'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Introduce una figura (triángulo, cuadrado, círculo o línea)',
                labelStyle: TextStyle(color: Colors.black, fontSize: 19),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: dibujarFigura,
              child: const Text('Aceptar'),
            ),
            const SizedBox(height: 32),
            if (mensaje.isNotEmpty)
              Text(
                mensaje,
                style: const TextStyle(color: Colors.red),
              ),
            if (figura.isNotEmpty) ...[
              if (figura == 'triángulo')
                CustomPaint(
                  size: const Size(100, 100),
                  painter: TrianguloPainter(),
                ),
              if (figura == 'cuadrado')
                CustomPaint(
                  size: const Size(100, 100),
                  painter: CuadradoPainter(),
                ),
              if (figura == 'círculo')
                 CustomPaint(
                  size: const Size(100, 100),
                  painter: CirculoPainter(),
                ),
              if (figura == 'línea')
                CustomPaint(
                  size: const Size(100, 100),
                  painter: LineaPainter(),
                ),
            ]
          ],
        ),
      ),
    );
  }
}

class TrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CuadradoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
class CirculoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LineaPainter extends CustomPainter{
  @override 
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()
    ..color = Colors.pink
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}