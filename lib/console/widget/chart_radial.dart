import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChartRadial extends StatefulWidget {
  const ChartRadial({super.key});

  @override
  State<ChartRadial> createState() => _ChartRadialState();
}

class _ChartRadialState extends State<ChartRadial> {
  List<Color> colorsBlue = [
    const Color(0xFFC2A0F8),
    const Color(0xFFC2A0F8),
    const Color(0xFFC2A0F8),
    const Color(0xFFC2A0F8),
  ];

  List<Color> colorsGreen = [
    const Color(0xFF9BC14E),
    const Color(0xFF9BC14E),
    const Color(0xFF9BC14E),
    const Color(0xFF9BC14E),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white, Color(0xFFE4E5EE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: Offset(0, 20),
            color: Color(0xFFE4E5EE),
          ),
        ],
      ),
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        axes: [
          RadialAxis(
            radiusFactor: 0.7,
            axisLineStyle: AxisLineStyle(
              thickness: 20,
              color: Colors.grey.shade200,
            ),
            startAngle: 145,
            endAngle: 270,
            showLabels: false,
            showTicks: false,
            annotations: [
              GaugeAnnotation(
                widget: Container(
                  height:
                      screenWidth > 1800
                          ? 150
                          : screenWidth < 1550
                          ? 90
                          : 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: Offset(4, 10),
                        color: Color.fromARGB(255, 227, 228, 245),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "82.3%",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                angle: 270,
                positionFactor: 0,
              ),
            ],
          ),
          RadialAxis(
            radiusFactor: 0.8,
            pointers: [
              RangePointer(
                value: 100,
                gradient: SweepGradient(
                  colors: colorsBlue,
                  stops: const [0.0, 0.33, 0.66, 1.0],
                ),
                width: 50,
              ),
            ],
            startAngle: 270,
            endAngle: 0,
            showTicks: false,
            showLabels: false,
            showAxisLine: false,
          ),
          RadialAxis(
            radiusFactor: 0.8,
            pointers: [
              RangePointer(
                value: 100,
                gradient: SweepGradient(
                  colors: colorsBlue,
                  stops: const [0.0, 0.33, 0.66, 1.0],
                ),
                width: 50,
              ),
            ],
            startAngle: 270,
            endAngle: 0,
            showTicks: false,
            showLabels: false,
            showAxisLine: false,
          ),
          RadialAxis(
            radiusFactor: 0.76,
            pointers: [
              RangePointer(
                value: 55,
                gradient: SweepGradient(
                  colors: colorsGreen,
                  stops: const [0.0, 0.33, 0.66, 1.0],
                ),
                width: 36,
              ),
            ],
            startAngle: 0,
            endAngle: 270,
            showTicks: false,
            showLabels: false,
            showAxisLine: false,
          ),
          RadialAxis(
            radiusFactor: 0.76,
            pointers: [
              RangePointer(
                value: 55,
                gradient: SweepGradient(
                  colors: colorsGreen,
                  stops: const [0.0, 0.33, 0.66, 1.0],
                ),
                width: 36,
              ),
            ],
            startAngle: 0,
            endAngle: 270,
            showTicks: false,
            showLabels: false,
            showAxisLine: false,
          ),
        ],
      ),
    );
  }
}
