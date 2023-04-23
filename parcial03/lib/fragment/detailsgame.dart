import 'package:flutter/material.dart';
import 'package:parcial03/modules/appbar.dart';
import 'package:parcial03/utils/api_url.dart';
import '../models/pantallaModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class detailsgame extends StatefulWidget {
  final ScreenArguments datos;

  const detailsgame({super.key, required this.datos});

  @override
  _detailsgameState createState() => _detailsgameState();
}

class _detailsgameState extends State<detailsgame> {
  // Aquí puedes guardar cualquier estado propio de la segunda pantalla

  late var responseData = {};

  Future<String> getData() async {
    String item = api[5]["gameById"].toString() + widget.datos.id;

    var response = await http.get(Uri.parse(item));
    setState(() {
      // var convertDataToJson = jsonDecode(response.body);
      responseData = jsonDecode(response.body);
    });

    print(responseData.length);
    print(responseData['title']);
    print(item);
    //dataApi = responseData as List;
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.datos.title,
            maxLines: 5,
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 35, 253, 217),
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  color: Color.fromARGB(255, 144, 255, 41),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromARGB(255, 64, 0, 70),
        ),
        body: SingleChildScrollView(

          child: Column(
          children: [
            Container(
              child: Image.network(responseData['thumbnail'] != null
                  ? responseData['thumbnail']
                  : 'https://vectorified.com/images/roblox-game-icon-size-8.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Container(
                          width: 110,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 139, 214, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Text("Estado : "),
                                Text(
                                  responseData['status'] != null
                                      ? responseData['status']
                                      : 'Sin datos',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 36, 35, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ))),
                          Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 11, 172, 65),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text("Plataforma : "),
                                  Text(
                                    responseData['platform'] != null
                                        ? responseData['platform']
                                        : 'Sin datos',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 36, 35, 0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(responseData['description'] != null
                                    ? responseData['description']
                                    : 'Sin datos'),
                        )
          ],
        )),
        );
        
        
         
  }
}
