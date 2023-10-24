import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'IMC'),
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

  double _imc = 0.0;
  String _mensaje = "";
  final _altura = TextEditingController();
  final _peso = TextEditingController();

  void _calcular_imc() {
    setState(() {
      _imc = double.parse(_peso.text) / pow(double.parse(_altura.text), 2);
      if (_imc < 18.5) {
        _mensaje = "Su IMC es $_imc y tiene Bajo Peso";
      } else {
        if (_imc >= 18.5 && _imc < 24.9) {
          _mensaje = "Su IMC es $_imc y su peso es Normal";
        } else {
          if (_imc >= 25.0 && _imc < 29.9) {
            _mensaje = "Su IMC es $_imc y tiene Sobrepeso";
          } else {
            _mensaje = "Su IMC es $_imc y tiene obesidad";
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  controller: _peso,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Peso (kg)"
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _altura,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Altura (m)"
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  _calcular_imc();
                },
                label: const Text("Calcular IMC"),
                icon: const Icon(Icons.add, size: 18),
              ),
              Text(_mensaje,
                style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
