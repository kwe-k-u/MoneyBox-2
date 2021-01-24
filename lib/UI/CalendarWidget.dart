import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  int day;
  int month;
  int year;
  Color backgroundColor;
  Color textColor;
  Color foregroundColor;


  CalendarWidget({
    this.day,
    this.month,
    this.year,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.black,
    this.foregroundColor = Colors.white
  });


  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    return GestureDetector(
        child: Row(
          children: [


            //Day
            Container(
              width: size.width * 0.3,
              height: size.height * 0.1,
              child: Card(
                elevation: 16.0,
                color: widget.backgroundColor,

                child: Container(
                  decoration: BoxDecoration(
                      color: widget.foregroundColor,
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.day.toString(),
                        style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text("Day",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //month
            Container(
              width: size.width * 0.3,
              height: size.height * 0.1,
              child: Card(
                elevation: 16.0,
                color: widget.backgroundColor,

                child: Container(
                  decoration: BoxDecoration(
                      color: widget.foregroundColor,
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.month.toString(),
                        style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text("month",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //year
            Container(
              width: size.width * 0.3,
              height: size.height * 0.1,
              child: Card(
                elevation: 16.0,
                color: widget.backgroundColor,

                child: Container(
                  decoration: BoxDecoration(
                      color: widget.foregroundColor,
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.year.toString(),
                        style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text("Year",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          //todo figure out how to change date time
          DateTime date;

          showDialog(
            context: context,
            builder: (context)=>AlertDialog(
              content:
              Container(
                width:size.width * 0.8,
                child: CalendarDatePicker(
                    initialDate: DateTime(2020),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2029),
                    onDateChanged: (date) {
                      setState(() {
                        widget.day = date.day;
                        widget.month =date.month;
                        widget.year = date.year;

                      });
                      Navigator.pop(context);
                    }

                ),
              ),
            ),
          );
        }
    );
  }
}