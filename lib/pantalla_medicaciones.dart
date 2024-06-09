import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfg/creacion%20medicacion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PantallaMedicaciones extends StatelessWidget {
  const PantallaMedicaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('medicamentos').snapshots(),
              builder: (context,snapshot){
                List<Row> medicamentoWidgets = [];
                if (snapshot.hasData){
                  final medicamentos = snapshot.data?.docs.reversed.toList();
                  for(var medicamento in  medicamentos!){
                    final medicamentoWidget = Row(
                      children: [
                        Icon(Icons.medication),
                        Text(medicamento['nombre']),
                        Text(' '),
                        Text(medicamento['gramos']),

                      ],
                    );
                    medicamentoWidgets.add(medicamentoWidget);
                  }
                }

                return Expanded(
                  child: ListView(
                    children: medicamentoWidgets,

                  ),
                );
              }
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CrearMedicacion(),
          ));
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