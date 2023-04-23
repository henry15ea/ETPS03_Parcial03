

import 'package:flutter/material.dart';
import 'package:parcial03/fragment/detailsgame.dart';
import 'package:parcial03/models/pantallaModel.dart';
import 'package:parcial03/modules/appbar.dart';
import 'package:parcial03/modules/combobox.dart';
import 'package:parcial03/utils/dataletter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/api_url.dart';

class listadobyletters extends StatefulWidget {
  listadobyletters({Key? key}) : super(key: key);

  @override
  _listadobylettersState createState() => _listadobylettersState();
}

class _listadobylettersState extends State<listadobyletters> {
  @override
 late List dataApi = [];
   String? uri_api;

//api[2]["gameCatergory"].toString()
  String _textValue = '';

  void _setValue() {
    setState(() {
      
      
    });
  }


  Future<String> getData() async {

    _textValue = letraSeleccionada;
      if (_textValue == null){
          uri_api = api[2]["gameCatergory"].toString()+ "anime";
      }else{
        uri_api = api[2]["gameCatergory"].toString()+ _textValue;
      }



    var response = await http.get(Uri.parse(uri_api!));
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      dataApi = convertDataToJson;
    });
    print(dataApi.length);
    return "Success!";
  }

   @override
  void initState() {
    super.initState();
    //getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
          Row(
            children: [
              Text("Selecciona una letra :"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width: 120
              , child: Combobox()),
              ),
              ElevatedButton(
              
                onPressed: getData,
                
                child: Text("Buscar"),
              ),
            ],
          ),
          Container(
            height: 480 ,
            child: ListView.builder(
              
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
          ),

        ],
      ),
      )
    );
  }
}
