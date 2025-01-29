import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Switches extends StatefulWidget {
  const Switches({super.key});

  @override
  State<Switches> createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {
  final List<bool> checker = List.generate(4, (index) => false);

  final List<String> _Text = [
    'Enter Text',
    'Enter Text',
    'Enter Text',
    'Enter Text'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Switches",
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(checker.length, (index) {
            return Row(
              children: [
                MouseRegion(
                  cursor: (index == 2 || index == 3)
                      ? SystemMouseCursors.forbidden
                      : SystemMouseCursors.click,
                  child: SizedBox(
                    child: Switch(
                      inactiveThumbColor:
                          (index == 3) ? Color(0xff635bff) : Colors.grey,
                      activeColor: Color(0xff635bff),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: (index == 3) ? true : checker[index],
                      inactiveTrackColor:
                          (index == 3) ? Color(0xff635bff) : Color(0xffe6e7eb),
                      onChanged: (index == 2 || index == 3)
                          ? null // Disable the switch for the last two indices
                          : (value) {
                              setState(() {
                                checker[index] = value;
                              });
                            },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  _Text[index],
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          }),
        )
      ],
    );
  }
}