import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:ePastillero/creacion_medicacion.dart';
import 'package:ePastillero/pantalla_info_medicacion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:provider/provider.dart';
import 'ajuste_calendario.dart';


class PantallaCalendario extends StatefulWidget {const PantallaCalendario({super.key});

@override
_PantallaCalendarioState createState() => _PantallaCalendarioState();
}

class _PantallaCalendarioState extends State<PantallaCalendario> {
  DateTime _targetDateTime = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());


  late final int calenType;
  late final Widget _calendarCarousel = CalendarCarousel();
  late final Widget _calendarCarouselNoHeader = CalendarCarousel(showHeader: false);

  @override
  Widget build(BuildContext context) {
    final calendarSettings = Provider.of<CalendarSettings>(context);

    return Scaffold(
      backgroundColor: Colors.white24,
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (calendarSettings.calendarType == 1)
              _buildCalendarWithIcon()
            else
              _buildCalendarWithoutHeader(),
            ],
        ),
      ),
    );
  }

  Widget _buildCalendarWithIcon() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: _calendarCarousel,
      ),
    );
  }

  Widget _buildCalendarWithoutHeader() {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(
          top: 30.0,
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
        ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  _currentMonth,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
              _buildNavigationButton('PREV', () {
                setState(() {
                  _targetDateTime = DateTime(
                    _targetDateTime.year,
                    _targetDateTime.month - 1,
                  );
                  _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                });
              }),
              _buildNavigationButton('NEXT', () {
                setState(() {
                  _targetDateTime = DateTime(
                    _targetDateTime.year,
                    _targetDateTime.month + 1,
                  );
                  _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                });}),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _calendarCarouselNoHeader,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}