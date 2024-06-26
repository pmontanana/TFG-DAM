import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ajuste_calendario.dart';


class PantallaAjustes extends StatefulWidget {
  const PantallaAjustes({super.key});

  @override
  _PantallaAjustesState createState() => _PantallaAjustesState();
}

class _PantallaAjustesState extends State<PantallaAjustes> {
  bool _notificationsEnabled = false;
  ThemeMode _themeMode = ThemeMode.system;
  Color _colors = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors,
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notificaciones'),
            trailing: Switch(
              activeColor: Colors.blueAccent,
              inactiveTrackColor: _colors,
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_4),
            title: const Text('Tema'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text('Selecciona tema'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          setState(() {
                            _themeMode = ThemeMode.light;
                            _colors = Colors.white;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Claro'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          setState(() {
                            _themeMode = ThemeMode.dark;
                            _colors = Colors.grey;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Oscuro'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          setState(() {
                            _themeMode = ThemeMode.system;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Segun el Sistema'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Tipo de Calendario'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Consumer<CalendarSettings>(
                    builder: (context, calendarSettings, child) {
                      return SimpleDialog(
                        title: const Text('Selecciona el tipo de calendario'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              calendarSettings.setCalendarType(1);
                              Navigator.pop(context);
                            },
                            child: const Text('Con cabecera'),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              calendarSettings.setCalendarType(2);
                              Navigator.pop(context);
                            },
                            child: const Text('Sin cabecera'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}