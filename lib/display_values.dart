import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider_exercice_prepa/cubit/provider_ex_cubit.dart';
import 'package:provider_exercice_prepa/tata.dart';
import 'package:provider_exercice_prepa/toto.dart';

class DisplayValues extends StatefulWidget {
  const DisplayValues({super.key});

  @override
  State<DisplayValues> createState() => _DisplayValuesState();
}

class _DisplayValuesState extends State<DisplayValues> {
  late TextEditingController _controller;
  bool valSwitch = false;

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
        child: Stack(
          children: [
            BlocBuilder<ProviderExCubit, ProviderExState>(
              builder: (context, state) {
                if (state is ProviderExInitialState) {
                  return const SizedBox.shrink();
                } else if (state is ProviderExGreyState) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.grey[800],
                  );
                } else if (state is ProviderExWhiteState) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                  );
                } else {
                  throw '';
                }
              },
            ),
            Column(
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
                    Provider.of<Toto>(context, listen: false)
                        .setTotoValue(_controller.text);
                    _controller.clear();
                    setState(() {});
                  },
                  child: const Text('Update'),
                ),
                const SizedBox(height: 10),
                Switch(
                  value: valSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      valSwitch = value;
                      Provider.of<ProviderExCubit>(context, listen: false)
                          .changeBackground(valSwitch);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
