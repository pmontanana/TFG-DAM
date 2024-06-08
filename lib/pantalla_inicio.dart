import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: [
          _buildItem('Primer medicamento', "500 gramos"),
          _buildItem('Segundo medicamento', "500 gramos"),
          _buildItem('Tercer medicamento', "500 gramos"),
          _buildItem('Cuarto medicamento', "500 gramos"),
          _buildItem('Quinto medicamento', "500 gramos"),
          _buildItem('Sexto medicamento', "500 gramos"),
          _buildItem('Septimo medicamento', "500 gramos"),
          _buildItem('Octavo medicamento', "500 gramos"),
          _buildItem('Noveno medicamento', "500 gramos"),
          _buildItem('Decimo medicamento', "500 gramos"),
          _buildItem('Undecimo medicamento', "500 gramos"),



        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed logic here
        },
        child: Icon(Icons.add), // Replace with your desired icon
      ),
    );
  }
}
Widget _buildItem(String textTitle, String subtitulo) {
  return new ListTile(
    title: new Text(textTitle),
    subtitle: new Text(subtitulo),
    leading: new Icon(Icons.medication),
  );
}