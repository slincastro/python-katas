import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'financial_table.dart';
import 'input_and_list_view.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker de Gastos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tracker de Gastos'),
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
  final TextEditingController _textController = TextEditingController();
  List<String> _items = [];
  int _totalGastos = 0;
  String _response = 'No data';
  int _ingresos = 3000;
  int _sobrante = 0;
  final FocusNode _textFocusNode = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _textFocusNode.dispose(); // Clean up the focus node when the form is disposed
    super.dispose();
  }

  void _addItem() {
    setState(() {
      String text = _textController.text;
      if (text.isNotEmpty && int.tryParse(text) != null) {
        _items.add(text);
        _textController.clear();
        _calculateTotal();
        _sobrante = _ingresos - _totalGastos;
        _textFocusNode.requestFocus();
      }
    });
  }

  void _calculateTotal() {
    _totalGastos = _items.fold(0, (sum, item) => sum + int.parse(item));
  }

  void _fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/hello'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body); 
        setState(() {
          _response = data['message'];
        });
      } else {
        setState(() {
          _response = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Error: ${e.toString()}';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                      FinancialTable(
                                    ingresos: _ingresos.toDouble(),
                                    totalGastos: _totalGastos.toDouble(),
                                    sobrante: _sobrante.toDouble(),
                                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                            Expanded(
                              child: TextField(
                                key: ValueKey("myTextField"),
                                controller: _textController,
                                focusNode: _textFocusNode,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Ingresa un Gasto',
                                  border: OutlineInputBorder(),
                                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onSubmitted: (value) {
                  if (value.isNotEmpty && int.tryParse(value) != null) {
                    _addItem();
                  }
                },
              ),
            ),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text('Registrar'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]),
                  );
                },
              ),
            ),
                        Text('Response: $_response', 
                style: Theme.of(context).textTheme.headlineMedium),
            ElevatedButton(
                  onPressed: _fetchData,
                  child: const Text('Fetch Data'),
                ),
          ],
        ),
      ) 
    );
  }
}
