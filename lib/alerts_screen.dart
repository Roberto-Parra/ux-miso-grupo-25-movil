import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class AlertsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 35,
          child: Image.asset(
            'assets/images/icon.png',
            fit: BoxFit.cover,
            height: kToolbarHeight,
          ),
        ),
        backgroundColor: const Color(0xff999999),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/setting.png'),
            onPressed: () {
              // Acciones al presionar el botón de ajustes
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ListView(
                children: <Widget>[
                  _buildCard(context, 'Matemáticas', '02/03/2024'),
                  _buildCard(context, 'Español', '08/03/2024'),
                ],
              ),
            ),
            CalendarButton(), // Botón que despliega el calendario
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String date) {
    return Card(
      elevation: 0,
      color: Colors.white.withOpacity(0.36),
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
            const Text(
              'Tienes una inasistencia en',
              style: TextStyle(
                fontSize: 16.37,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 37.42,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Último plazo $date',
              style: const TextStyle(
                fontSize: 16.37,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildSquareButton(Icons.attach_file), 
                const SizedBox(width: 10),
                _buildSquareButton(Icons.settings), 
                const SizedBox(width: 10), 
                _buildSquareButton(Icons.priority_high), 
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareButton(IconData icon) {
    return Container(
      width: 50, 
      height: 50, 
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(8), 
        border: Border.all(color: Colors.black), 
        ),
child: Icon(
icon,
color: Colors.black,
),
);
}
}

// ignore: use_key_in_widget_constructors
class CalendarButton extends StatefulWidget {
@override
_CalendarButtonState createState() => _CalendarButtonState();
}

class Event {
  final DateTime date;
  final String title;

  Event(this.date, this.title);
}


class _CalendarButtonState extends State<CalendarButton> {
bool isExpanded = false;
DateTime _selectedDate = DateTime.now();

@override
Widget build(BuildContext context) {
return Column(
children: <Widget>[
ListTile(
title: Text(
DateFormat('MMMM yyyy').format(_selectedDate),
style: const TextStyle(fontWeight: FontWeight.bold),
),
trailing: IconButton(
icon: isExpanded ? const Icon(Icons.arrow_drop_up) : const Icon(Icons.arrow_drop_down),
onPressed: () {
setState(() {
isExpanded = !isExpanded;
});
},
),
),
AnimatedContainer(
duration: const Duration(milliseconds: 500),
curve: Curves.easeInOut,
height: isExpanded ? 350 : 0,
child: CalendarCarousel(
onDayPressed: (DateTime date, List<dynamic> events) {
    this.setState(() => _selectedDate = date);
  },
weekendTextStyle: const TextStyle(
color: Colors.red,
),
thisMonthDayBorderColor: Colors.grey,
height: 350,
selectedDateTime: _selectedDate,
daysHaveCircularBorder: false,
),
),
],
);
}
}//
