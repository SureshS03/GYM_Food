import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxes extends StatefulWidget {
  const CheckBoxes({super.key});

  @override
  State<CheckBoxes> createState() => _CheckBoxesState();
}

class _CheckBoxesState extends State<CheckBoxes> {
  final List<bool> checker = List.generate(3, (index) => false);

  final List<String> _Text = ['Enter Text', 'Enter Text', 'Disabled'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Industry Type",
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
                  cursor: (index == 2)
                      ? SystemMouseCursors.forbidden
                      : SystemMouseCursors.click,
                  child: Checkbox(
                    activeColor: Color(0xff635bff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    ),
                    value: checker[index],
                    onChanged: (index == 2)
                        ? null
                        : (value) {
                            setState(() {
                              checker[index] = value!;
                            });
                          },
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
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