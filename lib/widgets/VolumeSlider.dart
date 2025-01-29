import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Slider.dart';

class VolumeIncDec extends StatefulWidget {
  const VolumeIncDec({super.key});

  @override
  State<VolumeIncDec> createState() => _VolumeIncDecState();
}

class _VolumeIncDecState extends State<VolumeIncDec> {
  double volumeValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.volume_down),
          onPressed: () {
            if (volumeValue != 0.10000000000000003) {
              print(volumeValue);
              setState(() {
                volumeValue -= 0.1;
              });
            }
          },
        ),
        SizedBox(width: 8),
        SliderWidgets(
          sliderValue: volumeValue,
        ),
        SizedBox(width: 8),
        IconButton(
          icon: Icon(Icons.volume_up),
          onPressed: () {
            if (volumeValue != 0.9999999999999999) {
              print(volumeValue);
              setState(() {
                volumeValue += 0.1;
              });
            }
          },
        ),
      ],
    );
  }
}