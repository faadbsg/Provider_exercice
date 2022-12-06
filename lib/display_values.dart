import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exercice_prepa/tata.dart';
import 'package:provider_exercice_prepa/toto.dart';

class DisplayValues extends StatefulWidget {
  const DisplayValues({super.key});

  @override
  State<DisplayValues> createState() => _DisplayValuesState();
}

class _DisplayValuesState extends State<DisplayValues> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final totoVariable = Provider.of<Toto>(context).classValue;
    final tataValue = Provider.of<Tata>(context).tataValReturn;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Exercices'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              totoVariable,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              tataValue,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _controller,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Tata>(context, listen: false)
                      .setValue(_controller.text);
                  _controller.clear();
                  setState(() {});
                },
                child: const Text('Update'))
          ],
        ),
      ),
    );
  }
}
