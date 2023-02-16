import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({Key? key}) : super(key: key);

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  // Text editing controllers for the name and date fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Date picker state
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    // Clean up the text editing controllers when the widget is disposed
    _nameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Appointment',
          style: GoogleFonts.balsamiqSans(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/doc.png'),
                height: 200,
              ),
              // SvgPicture.asset(
              //   'assets/images/doc.svg',
              //   semanticsLabel: 'My SVG Image',
              //   height: 150,
              // ),
              const SizedBox(height: 20),
              // Name field
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Date field
              TextField(
                controller: _dateController,
                readOnly: true,
                onTap: () => _showDatePicker(context),
                decoration: const InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Book appointment button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () => _bookAppointment(),
                child: Text('Book Appointment',
                    style: GoogleFonts.balsamiqSans(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show the date picker dialog
  Future<void> _showDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
        _dateController.text = DateFormat.yMMMd().format(_selectedDate);
      });
    }
  }

  // Book the appointment
  void _bookAppointment() {
    final name = _nameController.text;
    final date = _selectedDate;

    // Do something with the name and date (e.g. send to API)
    // ...

    // Show a success message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Appointment Booked'),
        content: Text(
            'Thank you for booking an appointment, $name. Your appointment is scheduled for ${DateFormat.yMMMd().format(date)}.',
            style: GoogleFonts.balsamiqSans(
              color: Colors.grey,
              fontSize: 16,
            )),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
