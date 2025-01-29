import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_food/widgets/TextFieldForms.dart';
import 'package:gym_food/widgets/calendrer.dart';
import 'package:gym_food/widgets/titleRow.dart';

class CustomForms extends StatefulWidget {
  const CustomForms({super.key});

  @override
  State<CustomForms> createState() => _CustomFormsState();
}

class _CustomFormsState extends State<CustomForms> {
  String dropdownValue = 'One';
  String dropdownValue2 = 'One';
  String gender = 'Male';
  bool industryChecked = false;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 30),
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 235, 235, 235),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleRow(title: 'Forms Custom'),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    child: Text(
                      'Ordrinary Form',
                      style: GoogleFonts.manrope(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Textfieldforms(
                                title: 'Name',
                                hint: 'Enter your name',
                                isBlocked: false,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Textfieldforms(
                                title: 'Company Name',
                                hint: 'Company Name',
                                isBlocked: false,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Textfieldforms(
                                title: 'Phone',
                                hint: 'Enter your phone',
                                isBlocked: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: DropdownSelector(
                                title: 'Select Dropdown',
                                value: dropdownValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              flex: 1,
                              child: CalendarApp()
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        GenderSelector(
                          selectedGender: gender,
                          onChanged: (newValue) {
                            setState(() {
                              gender = newValue!;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        CheckBoxes(),
                        const SizedBox(height: 16),
                        Switches(),
                        const SizedBox(height: 16),
                        SliderWidgets(sliderValue: 0.5),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 500,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                child: DropdownButtonFormField<String>(
                                  borderRadius: BorderRadius.circular(10),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff635bff), width: 0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5,
                                        )),
                                  ),
                                  dropdownColor: Colors.white,
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  value: dropdownValue2,
                                  items: ["One", "Two", "Three"]
                                      .map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 100,
                                child: DropdownButtonFormField<String>(
                                  borderRadius: BorderRadius.circular(10),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff635bff), width: 0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5,
                                        )),
                                  ),
                                  dropdownColor: Colors.white,
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  value: dropdownValue,
                                  items: ["One", "Two", "Three"]
                                      .map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        VolumeIncDec(),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(text: "Add New", color: Colors.blue),
                            CustomButton(
                                text: "Add New", color: Colors.lightBlueAccent),
                            CustomButton(text: "Success", color: Colors.green),
                            CustomButton(text: "Info", color: Colors.lightBlue),
                            CustomButton(text: "Warning", color: Colors.orange),
                            CustomButton(text: "Danger", color: Colors.red),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DropdownSelector extends StatelessWidget {
  final String value;
  final String title;
  final Function(String?) onChanged;

  const DropdownSelector(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(10),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff635bff), width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                )),
          ),
          dropdownColor: Colors.white,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          value: value,
          items: ["One", "Two", "Three"].map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final Function(String?) onChanged;

  const GenderSelector(
      {super.key, required this.selectedGender, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Gender",
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio<String>(
                  activeColor: Color(0xff635bff),
                  hoverColor: Colors.transparent,
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: onChanged,
                ),
                Text(
                  'Male',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  activeColor: Color(0xff635bff),
                  hoverColor: Colors.transparent,
                  value: "Female",
                  groupValue: selectedGender,
                  onChanged: onChanged,
                ),
                Text(
                  'Female',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  hoverColor: Colors.transparent,
                  activeColor: Color(0xff635bff),
                  value: "Disabled",
                  groupValue: selectedGender,
                  onChanged: onChanged,
                ),
                Text(
                  'Disabled',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

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

class CustomCalendrer extends StatefulWidget {
  const CustomCalendrer({super.key});

  @override
  State<CustomCalendrer> createState() => _CustomCalendrerState();
}

class _CustomCalendrerState extends State<CustomCalendrer> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;

  const CustomButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () {},
      child: Text(text,
          style: GoogleFonts.manrope(fontSize: 14, color: Colors.white)),
    );
  }
}
