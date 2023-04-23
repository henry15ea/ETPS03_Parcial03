import 'package:flutter/material.dart';
import 'package:parcial03/utils/dataletter.dart';

class Combobox extends StatefulWidget {
  const Combobox({super.key});
  @override
  State<Combobox> createState() => _ComboboxState();
}

class _ComboboxState extends State<Combobox> {
 static const List<String> list = <String>[
  'mmorpg','shooter','moba','anime','battle-royale','strategy','fantasy','sci-fi','card','racing','fighting','social',
  'sports'
 ];

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          letraSeleccionada = value.toString();
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
