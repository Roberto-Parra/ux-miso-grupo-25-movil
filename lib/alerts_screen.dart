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
          PopupMenuButton<String>(
      onSelected: (String value) {
        print(value); // Solo para fines de demostración
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Estado',
            child: Text('Estado'),
          ),
          const PopupMenuItem<String>(
            value: 'Materia',
            child: Text('Materia'),
          ),
        ];
      },
      icon: Image.asset('assets/images/setting.png'),
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
                _buildSquareButton(Icons.attach_file, context), 
                const SizedBox(width: 10),
                _buildSquareButton(Icons.settings, context), 
                const SizedBox(width: 10), 
                _buildSquareButton(Icons.priority_high, context), 
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareButton(IconData icon, BuildContext context) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black),
    ),
    child: IconButton(
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      onPressed: () {
        if (icon == Icons.priority_high) {
          _showPriorityDialog(context);
        }
      },
    ),
  );
}
void _showPriorityDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        insetPadding: const EdgeInsets.all(10),
        buttonPadding: const EdgeInsets.all(0),
        title: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.black,
              size: 24,
            ),
            const SizedBox(width: 30),
            Expanded(
  child: RichText(
    textAlign: TextAlign.left,
    text: const TextSpan(
      children: [
        TextSpan(
          text: 'Estas seguro? \n', // Añade '\n' para el salto de línea
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: 'Vas a apelar a la inasistencia',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),
        ),
      ],
    ),
  ),
), 
          ],
        ),
        actions: <Widget>[
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        child: const Text('No, cancelar', style: TextStyle(color: Colors.black)),
        onPressed: () {
          Navigator.of(context).pop(); 
        },
      ),
      const SizedBox(width: 8), 
      TextButton(
        child: const Text('Sí, confirmar', style: TextStyle(color: Colors.black)),
        onPressed: () {
          Navigator.of(context).pop(); 
          _showConfirmationDialog(context); 
        },
      ),
    ],
  ),
]
      );
    },
  );
}

void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        insetPadding: const EdgeInsets.all(10),
        buttonPadding: const EdgeInsets.all(0),
        title: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.black,
              size: 24,
            ),
            const SizedBox(width: 30), 
            Expanded(
          child: RichText(
            textAlign: TextAlign.left,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'El profesor ha sido notificado\n', // Añade '\n' para el salto de línea
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Espera su respuesta',
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
)
          ],
        ),
        actions: <Widget>[
          Center(
  child: TextButton(
    child: const Text(
      'Aceptar',
      style: TextStyle(color: Colors.white), 
    ),
    style: TextButton.styleFrom(
      backgroundColor: Color(0xFF48464C), 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), 
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
),
    ],
  );
},
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
              setState(() {isExpanded = !isExpanded;});
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
