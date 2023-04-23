import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  //navbar({Key? key}) : super(key: key);

  @override
  _navbarState createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container(
          height: 25,
          color: Colors.blue,
        ),
        Container(
          height: 50,
          color: Color.fromARGB(255, 8, 83, 61),
           child: Padding(
             padding: const EdgeInsets.all(2.0),
             child: Row(
                children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                            'Hola mundo',
                            style: TextStyle(
                              color: Colors.red ,fontWeight: FontWeight.w200, fontSize: 30
                            ),
                          ),
                      ),
                    )
                ],
             ),
           ),
        ),
      ],
    );
  }
}