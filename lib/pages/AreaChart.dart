import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/titleRow.dart';

class AreaChart extends StatefulWidget {
  const AreaChart({super.key});

  @override
  State<AreaChart> createState() => _AreaChartState();
}

class _AreaChartState extends State<AreaChart> {
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      'Area Chart',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 0.5,),
                  SizedBox(height: 20),
                  Container(
                    child: Chart(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<double> values1 = [30, 35, 40, 50, 60, 90, 100];
  List<double> values2 = [10, 25, 45, 35, 50, 65, 70];
  List<String> labels = ["19:00", "20:00", "21:00", "22:00", "23:00", "00:00", "Sep 19"];
  
  Offset? selectedPoint;
  String? selectedLabel;
  double? selectedValue;

  void onTap(Offset position, Size size) {
    double padding = 50;
    double chartWidth = size.width - padding * 2;
    double xStep = chartWidth / (values1.length - 1);
    
    for (int i = 0; i < values1.length; i++) {
      double x = padding + (i * xStep);
      if ((position.dx - x).abs() < 10) { 
        setState(() {
          selectedPoint = Offset(x, position.dy);
          selectedLabel = labels[i];
          selectedValue = values1[i]; // Change this if you want to show values2
        });
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTapDown: (details) {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            onTap(renderBox.globalToLocal(details.globalPosition), Size(400, 300));
          },
          child: Stack(
            children: [
              CustomPaint(
                size: Size(400, 300),
                painter: AreaChartPainter(values1, values2, labels, selectedPoint),
              ),
              if (selectedPoint != null)
                Positioned(
                  left: selectedPoint!.dx - 30,
                  top: selectedPoint!.dy - 50,
                  child: TooltipBubble(label: "$selectedLabel: $selectedValue"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AreaChartPainter extends CustomPainter {
  final List<double> values1;
  final List<double> values2;
  final List<String> labels;
  final Offset? selectedPoint;

  AreaChartPainter(this.values1, this.values2, this.labels, this.selectedPoint);

  @override
  void paint(Canvas canvas, Size size) {
    double padding = 50;
    double chartHeight = size.height - padding * 2;
    double chartWidth = size.width - padding * 2;

    Paint axisPaint = Paint()..color = Colors.grey..strokeWidth = 1.5;
    Paint linePaint1 = Paint()..color = Colors.blue..strokeWidth = 3..style = PaintingStyle.stroke;
    Paint fillPaint1 = Paint()..color = Colors.blue.withOpacity(0.2)..style = PaintingStyle.fill;
    Paint linePaint2 = Paint()..color = Colors.cyan..strokeWidth = 3..style = PaintingStyle.stroke;
    Paint fillPaint2 = Paint()..color = Colors.cyan.withOpacity(0.2)..style = PaintingStyle.fill;
    Paint pointPaint = Paint()..color = Colors.red..style = PaintingStyle.fill;

    canvas.drawLine(Offset(padding, size.height - padding), Offset(size.width, size.height - padding), axisPaint);
    canvas.drawLine(Offset(padding, size.height - padding), Offset(padding, padding), axisPaint);

    double maxValue = [...values1, ...values2].reduce((a, b) => a > b ? a : b);
    double yScale = chartHeight / maxValue;
    double xStep = chartWidth / (values1.length - 1);

    Path createSmoothPath(List<double> values) {
      Path path = Path();
      path.moveTo(padding, size.height - padding - values[0] * yScale);
      for (int i = 1; i < values.length; i++) {
        double x = padding + (i * xStep);
        double y = size.height - padding - values[i] * yScale;
        double prevX = padding + ((i - 1) * xStep);
        double prevY = size.height - padding - values[i - 1] * yScale;
        path.quadraticBezierTo(prevX + (x - prevX) / 2, prevY, x, y);
      }
      return path;
    }

    Path createFilledPath(Path linePath) {
      Path filledPath = Path.from(linePath);
      filledPath.lineTo(padding + (values1.length - 1) * xStep, size.height - padding);
      filledPath.lineTo(padding, size.height - padding);
      filledPath.close();
      return filledPath;
    }

    Path path1 = createSmoothPath(values1);
    Path fillPath1 = createFilledPath(path1);
    canvas.drawPath(fillPath1, fillPaint1);
    canvas.drawPath(path1, linePaint1);

    Path path2 = createSmoothPath(values2);
    Path fillPath2 = createFilledPath(path2);
    canvas.drawPath(fillPath2, fillPaint2);
    canvas.drawPath(path2, linePaint2);

    for (int i = 0; i < labels.length; i++) {
      double x = padding + (i * xStep);
      TextPainter textPainter = TextPainter(
        text: TextSpan(text: labels[i], style: TextStyle(color: Colors.black, fontSize: 12)),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - 10, size.height - padding + 5));
    }

    if (selectedPoint != null) {
      canvas.drawCircle(selectedPoint!, 5, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TooltipBubble extends StatelessWidget {
  final String label;
  
  TooltipBubble({required this.label});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}


