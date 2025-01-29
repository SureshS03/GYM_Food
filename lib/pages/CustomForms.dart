import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_food/widgets/TextFieldForms.dart';
import 'package:gym_food/widgets/calendrer.dart';
import 'package:gym_food/widgets/titleRow.dart';

import '../widgets/CheckBoxe.dart';
import '../widgets/CustomButtons.dart';
import '../widgets/DropDown.dart';
import '../widgets/RadioSelecter.dart';
import '../widgets/Slider.dart';
import '../widgets/Switches.dart';
import '../widgets/VolumeSlider.dart';

class CustomForms extends StatefulWidget {
  const CustomForms({super.key});

  @override
  State<CustomForms> createState() => _CustomFormsState();
}

class _CustomFormsState extends State<CustomForms> {
  String dropdownValue = 'One';
  String dropdownValue2 = 'One';
  //String gender = 'Male';
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
                            Expanded(flex: 1, child: CalendarApp())
                          ],
                        ),
                        const SizedBox(height: 16),
                        GenderSelector(),
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
