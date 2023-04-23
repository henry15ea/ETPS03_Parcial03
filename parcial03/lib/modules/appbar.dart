import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0), // Altura preferida de la AppBar
    child: AppBar(
              title: const Text(
                'FREETOGAME',
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
              backgroundColor: Color.fromARGB(255, 255, 184, 53),
              flexibleSpace: Image.network(
                  'https://i.pinimg.com/originals/76/be/a3/76bea395a55f3f710c6435873b655d12.png',
                  width: 100, // cambiar el ancho de la imagen
                  height: 100, // cambiar la altura de la imagen
                  fit: BoxFit.cover),
              bottom: const TabBar(
                
                labelColor: Color.fromARGB(255, 255, 213, 87),
                tabs: <Widget>[
                  
                  Tab(
                    
                    icon: Icon(Icons.gamepad),
                  ),
                  Tab(
                    icon: Icon(Icons.list),
                  ),
                  Tab(
                    icon: Icon(Icons.search),
                  ),
                  Tab(
                    icon: Icon(Icons.info),
                  ),
                ],
              ),
            ),
  );
}

/*

 */