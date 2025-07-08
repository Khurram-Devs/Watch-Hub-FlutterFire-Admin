import 'package:adminside/changes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adminside/core/res/responsive.dart';

class OrdersActionButton extends StatefulWidget {
  final String label;
  final int index;
  final int selectedValue;
  final ValueChanged<int> onTap;
  const OrdersActionButton({
    super.key,
    required this.label,
    required this.index,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  State<OrdersActionButton> createState() => _OrdersActionButtonState();
}

class _OrdersActionButtonState extends State<OrdersActionButton> {
  @override
  Widget build(BuildContext context) {
    double textWidth = calculateTextWidth(
      widget.label,
      GoogleFonts.inter(fontSize: Responsive.isDesktop(context) ? 16 : 12),
    );

    return InkWell(
      onTap: () {
        widget.onTap(widget.index);
      },
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 10 : 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: GoogleFonts.inter(
                color:
                    widget.selectedValue == widget.index
                        ? primaryColor
                        : Colors.grey,
                fontSize: Responsive.isDesktop(context) ? 16 : 12,
              ),
            ),
            const SizedBox(height: 10),
            if (widget.selectedValue == widget.index)
              Container(height: 2, width: textWidth + 2, color: primaryColor),
          ],
        ),
      ),
    );
  }

  double calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}
