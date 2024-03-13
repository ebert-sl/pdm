import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gasolina x Alcool',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditeControllerAlcool = TextEditingController();
  final TextEditingController _textEditeControllerGasolina = TextEditingController();
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Gasolina x Alcool'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Gasolina x Alcool',
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 100,
              height: 100,
              child: Image.asset('assets/fuel_pump.png')
            ),
            Container(
              width: 400,
              margin: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Valor do Alcool'),
                ),
                controller: _textEditeControllerAlcool,
              ),
            ),
            Container(
              width: 400,
              margin: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Valor da Gasolina'),
                ),
                controller: _textEditeControllerGasolina,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  double valorAlcool = double.parse(_textEditeControllerAlcool.text);
                  double valorGasolina = double.parse(_textEditeControllerGasolina.text);

                  double calculo = (valorAlcool / valorGasolina) * 100;

                  setState(() {
                    if (calculo >= 70) {
                      _resultado = 'Abasteça com álcool';
                    } else {
                      _resultado = 'Abasteça com gasolina';
                    }
                  });
                },
                child: const Text('Calcular'),
              ),
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
