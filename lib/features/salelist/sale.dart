import 'package:cabzing/features/salelist/sale_api_services.dart';
import 'package:cabzing/features/salelist/sale_model.dart';
import 'package:flutter/material.dart';

class SaleScreen extends StatefulWidget {
  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final ApiService apiService = ApiService();
  List<Sale> sales = [];
  int pageNumber = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  @override
  void initState() {
    super.initState();
    fetchSales();
  }

  void fetchSales() async {
    if (isLoading || !hasMoreData) return;
    setState(() {
      isLoading = true;
    });

    try {
      List<Sale> fetchedSales = await apiService.fetchSales(pageNumber);
      setState(() {
        sales.addAll(fetchedSales);
        isLoading = false;
        hasMoreData = fetchedSales.length ==
            10; // If fetched sales are less than 10, assume no more data
        if (hasMoreData) pageNumber++;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching sales: $e');
    }
  }

  void _searchSales(String query) {
    final results = sales.where((sale) {
      final saleName = sale.customerName.toLowerCase();
      final input = query.toLowerCase();

      return saleName.contains(input);
    }).toList();

    setState(() {
      sales = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Invoices',
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: SaleSearchDelegate(sales));
            },
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification &&
              scrollNotification.metrics.extentAfter == 0) {
            fetchSales();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: sales.length + 1,
          itemBuilder: (context, index) {
            if (index == sales.length) {
              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Container();
            }

            return ListTile(
              title: Text(
                sales[index].customerName,
                style: const TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Invoice No: ${sales[index].voucherNo}, Date: ${sales[index].date}',
                style: const TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Text(
                '\$${sales[index].grandTotalRounded}',
                style: const TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SaleSearchDelegate extends SearchDelegate {
  final List<Sale> sales;

  SaleSearchDelegate(this.sales);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = sales.where((sale) {
      final saleName = sale.customerName.toLowerCase();
      final input = query.toLowerCase();

      return saleName.contains(input);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              sales[index].customerName,
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Invoice No: ${sales[index].voucherNo}, Date: ${sales[index].date}',
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text('\$${results[index].grandTotalRounded}'),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = sales.where((sale) {
      final saleName = sale.customerName.toLowerCase();
      final input = query.toLowerCase();

      return saleName.contains(input);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              sales[index].customerName,
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Invoice No: ${sales[index].voucherNo}, Date: ${sales[index].date}',
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Text('\$${suggestions[index].grandTotalRounded}'),
          );
        },
      ),
    );
  }
}
