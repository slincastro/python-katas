import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputAndListView extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function addItem;
  final List<String> items;

  const InputAndListView({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.addItem,
    required this.items,
  }) : super(key: key);

  @override
  _InputAndListViewState createState() => _InputAndListViewState();
}

class _InputAndListViewState extends State<InputAndListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: TextField(
                key: ValueKey("myTextField"),
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ingresa un Gasto',
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onSubmitted: (value) => widget.addItem(value),
              ),
            ),
            ElevatedButton(
              onPressed: () => widget.addItem(widget.controller.text),
              child: const Text('Registrar'),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.items[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
