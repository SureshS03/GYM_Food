import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderWidgets extends StatefulWidget {
  double sliderValue;
  SliderWidgets({super.key, required this.sliderValue});

  @override
  State<SliderWidgets> createState() => _SliderWidgetsState();
}

class _SliderWidgetsState extends State<SliderWidgets> {
  //double sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Slider(
        activeColor: Color(0xff635bff),
        value: widget.sliderValue,
        onChanged: (value) {
          setState(() {
            widget.sliderValue = value;
          });
        },
      ),
    );
  }
}