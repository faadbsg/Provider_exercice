import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_exercice_prepa/cubit/provider_ex_cubit.dart';
import 'package:provider_exercice_prepa/display_values.dart';
import 'package:provider_exercice_prepa/tata.dart';
import 'package:provider_exercice_prepa/toto.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Toto>(create: (context) => const Toto(stringValue: 'Faadel')),
        ChangeNotifierProvider<Tata>(create: (context) => Tata()),
        BlocProvider(create: (context) => ProviderExCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Exo Provider',
        home: DisplayValues(),
      ),
    );
  }
}

// class MyAppCubit extends StatelessWidget {
//   const MyAppCubit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(create: (context));
//   }
// }