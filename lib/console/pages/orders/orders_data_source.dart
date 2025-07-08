import 'package:adminside/feature/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:adminside/core/res/responsive.dart';

class OrdersDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];
  List<OrderModel> _orders;
  BuildContext context;

  OrdersDataSource({required List<OrderModel> orders, required this.context})
    : _orders = orders {
    _updateDataGridRow();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;
  void _updateDataGridRow() {
    _dataGridRows =
        _orders.map<DataGridRow>((orders) {
          return DataGridRow(
            cells: [
              DataGridCell(columnName: 'Orders', value: orders.order),
              DataGridCell(columnName: 'Date', value: orders.date),
              DataGridCell(columnName: 'Customer', value: orders.customer),
              DataGridCell(columnName: 'Payment', value: orders.paymentStatus),
              DataGridCell(columnName: 'Status', value: orders.orderStatus),
              DataGridCell(columnName: 'Price', value: orders.price),
            ],
          );
        }).toList();
  }

  void updateData(List<OrderModel> newData) {
    _orders = newData;
    _updateDataGridRow();
    notifyListeners();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final dateFormater = DateFormat('MMM d, yyyy')
    return DataGridRowAdapter(
      cells:
          row.getCells().map<Widget>((cell) {
            return Container(
              alignment:
                  cell.columnName == 'Orders'
                      ? Alignment.centerLeft
                      : Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context) ? 30 : 10, vertical: 15),
              child:
                  cell.columnName == 'Orders'
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (cell.value as Order).product,
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: Responsive.isDesktop(context) ? 14 : 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: Responsive.isDesktop(context) ?10 :5),
                          Text(
                            (cell.value as Order).id,
                            style: GoogleFonts.inter(
                              color: Colors.black45,
                              fontSize: Responsive.isDesktop(context) ? 14:10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                      : cell.columnName == 'Date' ? Text(
                        dateFormater.format(cell.value),
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: Responsive.isDesktop(context) ? 14:10,
                          fontWeight: FontWeight.w700,
                        ),
                      ) : cell.columnName == 'Payment' ||cell.columnName == 'Status' ? 
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: Responsive.isDesktop(context) ?20 : 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: cell.value == 'Paid' || cell.value == 'Delivered' ? const Color(0xFFE7F7EF) : 
                          cell.value == "Unpaid" ? Color(0xFFF4F0FF) : 
                          cell.value == "Canceled" ? Color(0xFFFFF0F0) :
                          Color(0xFFFFF0E6),
                          
                        ),
                        child: Text(
                        cell.value.toString(),
                        style: GoogleFonts.inter(
                          color: cell.value == 'Paid' || cell.value == 'Delivered' ? const Color(0xFF0CAF60) : 
                          cell.value == "Unpaid" ? Color(0xFF8C62FF) : 
                          cell.value == "Canceled" ? Color(0xFFFD6A6A) :
                          Color(0xFFFE964A),
                          fontSize: Responsive.isDesktop(context) ? 14:10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      )
                       : cell.columnName == 'Price' ? Text(
                        '\$${cell.value.toString()}',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: Responsive.isDesktop(context) ? 14:10,
                          fontWeight: FontWeight.w700,
                        ),
                      ) : Text(
                        cell.value.toString(),
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: Responsive.isDesktop(context) ? 14:10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
            );
          }).toList(),
    );
  }
}
