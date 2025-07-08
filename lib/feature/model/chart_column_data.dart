import 'package:flutter/material.dart';

class ChartColumnData {
  ChartColumnData(this.month, this.amount, this.color);
  final String month;
  final double? amount;
  final Color color;
}

final List<ChartColumnData> chartData = <ChartColumnData>[
  ChartColumnData("Jan", 1700, const Color(0xFFE6E8F0)),
  ChartColumnData("Feb", 1800, const Color(0xFFE6E8F0)),
  ChartColumnData("Mar", 1600, const Color(0xFFE6E8F0)),
  ChartColumnData("Apr", 1500, const Color(0xFFE6E8F0)),
  ChartColumnData("May", 1200, const Color(0xFFE6E8F0)),
  ChartColumnData("Jun", 3700, const Color(0xFFE6E8F0)),
  ChartColumnData("Jul", 3200, const Color(0xFFE6E8F0)),
  ChartColumnData("Aug", 2100, const Color(0xFFE6E8F0)),
  ChartColumnData("Sep", 1800, const Color(0xFFE6E8F0)),
  ChartColumnData("Oct", 3500, const Color(0xFFE6E8F0)),
  ChartColumnData("Nov", 1700, const Color(0xFFE6E8F0)),
  ChartColumnData("Dec", 1900, const Color(0xFFE6E8F0)),
];

class LegendItem {
  final Color color;
  final String title;

  LegendItem({required this.color, required this.title});
}

final List<LegendItem> legendItemsColumn = [
  LegendItem(color: const Color(0xFF7264D6), title: "Pending (10%)"),
  LegendItem(color: const Color(0xFF7264D6), title: "Income"),
  LegendItem(color: const Color(0xFF7264D6), title: "Expense"),
];

final List<LegendItem> legendItemsRadial = [
  LegendItem(color: const Color(0xFF7264D6), title: "Current customers"),
  LegendItem(color: const Color(0xFF7264D6), title: "New customers"),
];