import 'package:adminside/changes/colors.dart';
import 'package:adminside/core/res/responsive.dart';
import 'package:adminside/console/pages/orders/orders_actions_button.dart';
import 'package:adminside/console/pages/orders/orders_data_source.dart';
import 'package:adminside/console/pages/orders/orders_utils.dart';
import 'package:adminside/core/providers/order_provider.dart';
import 'package:adminside/feature/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedValue = 0;
  int _rowPerPage = 6;
  OrdersDataSource? _ordersDataSource;
  List<OrderModel> _orders = [];
  List<OrderModel> _filteredOrders = [];
  late OrderProvider orderProvider;

  @override
  void initState() {
    super.initState();
    orderProvider = Provider.of<OrderProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateOrdersData();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateOrdersData() {
    final orders =
        _selectedValue == 0
            ? orderProvider.orders
            : orderProvider.getOrdersByStatus(
              OrdersUtils.names[_selectedValue],
            );

    setState(() {
      _orders = orders;
      _filteredOrders = _orders;
      _ordersDataSource = OrdersDataSource(
        orders: _filteredOrders,
        context: context,
      );
    });
  }

  void _onNavBarTop(int index) {
    setState(() {
      _selectedValue = index;
    });
    _updateOrdersData();
    _filterRows(_searchController.text);
  }

  void _filterRows(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredOrders = _orders;
      } else {
        _filteredOrders =
            _orders.where((order) {
              return order.order.id.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ||
                  order.order.product.toLowerCase().contains(
                    query.toLowerCase(),
                  );
            }).toList();
        if (_filteredOrders.isEmpty) {
          _filteredOrders = _orders;
        }
      }
      _ordersDataSource!.updateData(_filteredOrders);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (_ordersDataSource == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 0 : 20,
          vertical: Responsive.isMobile(context) ? 0 : 10,
        ),
        child: Card(
          shadowColor: Colors.black26,
          surfaceTintColor: Colors.transparent,
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Divider(
                      thickness: 2,
                      height: 0,
                      color: Colors.grey.shade100,
                    ),
                  ),
                  Row(
                    children:
                        OrdersUtils.names
                            .asMap()
                            .entries
                            .map(
                              (e) => OrdersActionButton(
                                label: e.value,
                                index: e.key,
                                selectedValue: _selectedValue,
                                onTap: _onNavBarTop,
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSearchBar(screenWidth),
              const SizedBox(height: 20),
              _buildDataGrid(),
              _buildDataPager(),
            ],
          ),
        ),
      ),
    );
  }

  SfDataPagerTheme _buildDataPager() {
    return SfDataPagerTheme(
      data: SfDataPagerThemeData(
        backgroundColor: Colors.white,
        itemBorderWidth: 0.5,
        itemBorderColor: Colors.grey.shade400,
        itemBorderRadius: BorderRadius.circular(8),
        selectedItemColor: primaryColor,
        itemTextStyle: TextStyle(color: Colors.black),
      ),
      child: SfDataPager(
        delegate: _ordersDataSource!, // ✅ FIXED: named parameter
        firstPageItemVisible: false,
        lastPageItemVisible: false,
        navigationItemWidth: 100,
        availableRowsPerPage: const [6, 12, 18],
        visibleItemsCount: 3,
        pageCount:
            (_filteredOrders.isEmpty
                    ? 1
                    : (_filteredOrders.length / _rowPerPage).ceil())
                .toDouble(),
        onRowsPerPageChanged: (value) {
          setState(() {
            _rowPerPage = value!;
          });
          _updateOrdersData();
        },
        pageItemBuilder: (text) {
          if (text == "Next") {
            return const Center(child: Text("Next"));
          }
          if (text == "Previous") {
            return const Center(child: Text("Previous"));
          }
          return null;
        },
      ),
    );
  }

  SfDataGridTheme _buildDataGrid() {
    return SfDataGridTheme(
      data: SfDataGridThemeData(
        headerHoverColor: Colors.transparent,
        gridLineColor: Colors.grey.shade100,
        headerColor: Colors.white,
        gridLineStrokeWidth: 0,
      ),
      child: SfDataGrid(
        showCheckboxColumn: false,
        columnWidthMode: ColumnWidthMode.fill,
        shrinkWrapRows: true,
        rowHeight: Responsive.isDesktop(context) ? 90 : 120,
        source: _ordersDataSource!,
        columns: _buildGridColumns(),
      ),
    );
  }

  List<GridColumn> _buildGridColumns() {
    return [
      _buildGridColumn('Orders'),
      _buildGridColumn('Date'),
      _buildGridColumn('Customer'),
      _buildGridColumn('Payment'),
      _buildGridColumn('Status'),
      _buildGridColumn('Price'),
    ];
  }

  GridColumn _buildGridColumn(String columnName) {
    return GridColumn(
      columnName: columnName,
      width:
          columnName == "Orders" && Responsive.isDesktop(context)
              ? 150
              : columnName == "Customer" && Responsive.isDesktop(context)
              ? 150
              : double.nan,
      label: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 10 : 30,
        ),
        alignment:
            columnName == "Orders" ? Alignment.centerLeft : Alignment.center,
        child: Text(
          columnName,
          style: GoogleFonts.inter(
            color: Colors.black45,
            fontSize: Responsive.isDesktop(context) ? 16 : 12,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Padding _buildSearchBar(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.white24),
        ),
        child: TextFormField(
          controller: _searchController,
          cursorColor: primaryColor,
          scrollPadding: EdgeInsets.all(0),
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: SvgPicture.asset(
              '../../../../assets/icons/search.svg',
              height: 20,
              color: Colors.black,
            ),
            hintText: 'Search by ID, product, or others...',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          onChanged: (value) => _filterRows(value),
        ),
      ),
    );
  }
}
