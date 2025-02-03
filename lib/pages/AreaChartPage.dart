import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/AreaChart.dart';
import '../widgets/titleRow.dart';

class AreaChart extends StatefulWidget {
  const AreaChart({super.key});

  @override
  State<AreaChart> createState() => _AreaChartState();
}

class _AreaChartState extends State<AreaChart> {

  bool isData1Hover = false;
  bool isData2Hover = false;

  void onHover(String dataKey, bool event) {
  setState(() {
    if (dataKey == "data1") {
      isData1Hover = event;
    } else if (dataKey == "data2") {
      isData2Hover = event;
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 30),
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xfff4f7fc),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleRow(title: 'Chart Apex Area'),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              //padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Area Chart',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  //SizedBox(height: 20),
                  Divider(thickness: 0.5,),
                  SizedBox(height: 18),
                  Container(
                    padding: EdgeInsets.all(20),
                    height: 300,
                    child: Chart(
                      isData1Hover: isData1Hover,
                      isData2Hover: isData2Hover,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        onEnter: (event) => onHover("data1", true),
                        onExit: (event) => onHover("data1", false),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xff3b86ff),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Sales Summary 1',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xff98a4ae),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      MouseRegion(
                        onEnter: (event) => onHover("data2", true),
                        onExit: (event) => onHover("data2", false),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF1dcdc9),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Sales Summary 2',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0xff98a4ae),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
