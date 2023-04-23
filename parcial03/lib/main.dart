import 'package:flutter/material.dart';
import 'package:parcial03/fragment/detailsgame.dart';
import 'package:parcial03/fragment/inicio.dart';
import 'package:parcial03/fragment/listadoprincipal.dart';
import 'package:parcial03/models/pantallaModel.dart';
import 'package:parcial03/modules/appbar.dart';

void main() {
  runApp(parcial03());
}

class parcial03 extends StatelessWidget {
  //const MyApp({super.key});
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
    Tab(text: 'Tab 3'),
    Tab(text: 'Tab 4'),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // Cuando naveguemos hacia la ruta "/", crearemos el Widget FirstScreen
        '/': (context) => incio(),
        // Cuando naveguemos hacia la ruta "/second", crearemos el Widget SecondScreen
        // '/detalle': (context) => detailsgame(),
      },
      
    );
  }
}
