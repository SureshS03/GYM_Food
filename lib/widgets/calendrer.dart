import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarApp extends StatefulWidget {
  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void _showCalendarDialog() async {
    await showDialog(
      context: context,
      builder: (context) => CalendarDialog(
        initialDate: selectedDate,
        onDateSelected: (date) {
          setState(() {
            selectedDate = date;
            _dateController.text = DateFormat('MMMM dd, yyyy').format(date);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          textSelectionTheme:
              TextSelectionThemeData(selectionColor: Color(0xff635bff))),
      child: TextField(
        style: GoogleFonts.manrope(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        controller: _dateController,
        readOnly: true,
        onTap: _showCalendarDialog,
        decoration: InputDecoration(
          labelText: "Date",
          labelStyle: GoogleFonts.manrope(
            fontSize: 16,
            color: Colors.black,
          ),
          floatingLabelStyle: GoogleFonts.manrope(
            fontSize: 16,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff635bff), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(
            Icons.calendar_today,
            size: 15,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class CalendarDialog extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  CalendarDialog({required this.initialDate, required this.onDateSelected});

  @override
  _CalendarDialogState createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  late DateTime _currentDate;
  final List<String> weeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  @override
  void initState() {
    super.initState();
    _currentDate = widget.initialDate;
  }

  void _changeMonth(int offset) {
    setState(() {
      _currentDate =
          DateTime(_currentDate.year, _currentDate.month + offset, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //insetPadding: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 300,
        height: 400,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () => _changeMonth(-1),
                ),
                Text(
                  DateFormat('MMMM yyyy').format(_currentDate),
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () => _changeMonth(1),
                ),
              ],
            ),
            //const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: weeks
                  .map((day) => Expanded(
                        child: Text(
                          day,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600),
                        ),
                      ))
                  .toList(),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
              ),
              itemCount: 42, //max 6 weeks
              itemBuilder: (context, index) {
                DateTime firstDayOfMonth =
                    DateTime(_currentDate.year, _currentDate.month, 1);
                int startingWeekday = firstDayOfMonth.weekday % 7;
                DateTime date = firstDayOfMonth
                    .add(Duration(days: index - startingWeekday));
        
                bool isCurrentMonth = date.month == _currentDate.month;
                bool isSelected =
                    date.day == widget.initialDate.day && isCurrentMonth;
                /*
                print("firstDayOfMonth: $firstDayOfMonth and index: $index");
                print("firstDayOfMonth.weekday: ${firstDayOfMonth.weekday} and index: $index");
                print("firstDayOfMonth.weekday % 7: ${firstDayOfMonth.weekday % 7} and index: $index");
                print("startingWeekday: $startingWeekday and index: $index" );
                print("date: $date and index: $index");
                print("isCurrentMonth: $isCurrentMonth and index: $index");
                print("isSelected: $isSelected and index: $index");
                */
        
                return GestureDetector(
                  onTap: isCurrentMonth
                      ? () {
                          widget.onDateSelected(date);
                          Navigator.pop(context);
                        }
                      : null,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? Color(0xff635bff) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${date.day}",
                      style: GoogleFonts.manrope(
                        color: isCurrentMonth && isSelected
                            ? Colors.white
                            : isCurrentMonth
                                ? Colors.black
                                : Colors.grey,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff635bff)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                  ),
                  onPressed: () {
                    widget.onDateSelected(DateTime.now());
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Today",
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                  ),
                  onPressed: () {
                    widget.onDateSelected(DateTime(0));
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Clear",
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
