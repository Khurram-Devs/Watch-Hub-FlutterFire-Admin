import 'package:flutter/material.dart';
import 'package:adminside/feature/model/chart_column_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartColumn extends StatelessWidget {
  const ChartColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBackgroundColor: Colors.transparent,
      margin: const EdgeInsets.all(0),
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      primaryXAxis: const CategoryAxis(
        plotOffset: 20,
        axisLine: AxisLine(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(width: 0),
      ),
      primaryYAxis: const NumericAxis(
        isVisible: false,
        minimum: 5000,
        maximum: 50000,
        interval: 5000,
      ),
      series: <CartesianSeries>[
        ColumnSeries<ChartColumnData, String>(
          borderRadius: BorderRadius.circular(6),
          dataSource: chartData,
          width: 0.6,
          xValueMapper: (ChartColumnData data, _) => data.month,
          yValueMapper: (ChartColumnData data, _) => data.amount,
          onCreateRenderer: (series) => _CustomColumnSeriesRenderer(),
        ),
      ],
    );
  }
}

class _CustomColumnSeriesRenderer
    extends ColumnSeriesRenderer<ChartColumnData, String> {
  _CustomColumnSeriesRenderer();

  @override
  ColumnSegment<ChartColumnData, String> createSegment() {
    return _CustomColumnPainter();
  }
}

class _CustomColumnPainter extends ColumnSegment<ChartColumnData, String> {
  _CustomColumnPainter();

  @override
  Paint getFillPaint() {
    final Paint paint = Paint();
    if (segmentRect != null &&
        currentSegmentIndex < series.dataSource!.length) {
      final data = series.dataSource![currentSegmentIndex];

      if (data.month == 'Jun' || data.month == 'Mar' || data.month == 'Oct') {
        paint.shader = LinearGradient(
          colors: [data.color.withAlpha(127), data.color],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(segmentRect!.outerRect);
      } else {
        paint.shader = LinearGradient(
          colors: [data.color, data.color],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(segmentRect!.outerRect);
      }
    }
    paint.style = PaintingStyle.fill;
    return paint;
  }

  @override
  void onPaint(Canvas canvas) {
    super.onPaint(canvas);
  }
}
