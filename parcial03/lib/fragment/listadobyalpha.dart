import 'package:flutter/material.dart';
import 'package:parcial03/fragment/detailsgame.dart';
import 'package:parcial03/models/pantallaModel.dart';
import 'package:parcial03/modules/navbar.dart';
import 'package:parcial03/utils/api_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class listadoAlphabet extends StatefulWidget {
  @override
  _listadoAlphabetState createState() => _listadoAlphabetState();
}

class _listadoAlphabetState extends State<listadoAlphabet> {
  late List dataApi = [];
  
  Future<String> getData() async {
    var response = await http.get(Uri.parse(api[6]["gamebyAlpha"]!));
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      dataApi = convertDataToJson;
    });
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
      body: ListView.builder(
        itemCount: dataApi == null ? 0 : dataApi.length,
        itemBuilder: (BuildContext context, int index) {
           ScreenArguments obj;
          return GestureDetector(
            onTap: () => {
                  obj = ScreenArguments(dataApi[index]["title"].toString() ,dataApi[index]["id"].toString() , dataApi[index]["thumbnail"]),

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => detailsgame( datos: obj ,))
                      
                      ),
                    

            },
            child: Container(
                height: 120, // aquí defines la altura del contenedor
                child: Card(
                  
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        SizedBox(width: 4.0), // añadir un espacio en blanco
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                  width: 120,
                                  child: Image.network(
                                    dataApi[index]["thumbnail"],
                                    height: 100.0,
                                    width: 100.0,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataApi[index]["title"],
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            8.0), // añadir un espacio en blanco
                                    Text(
                                      dataApi[index]["short_description"],
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 11.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
