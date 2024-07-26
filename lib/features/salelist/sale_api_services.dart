import 'dart:convert';
import 'package:cabzing/features/salelist/sale_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String apiUrl =
      'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/';

  Future<List<Sale>> fetchSales(int pageNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? userId = prefs.getInt('userId');

    if (token == null || userId == null) {
      throw Exception('Token or UserID not found');
    }

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "BranchID": 1,
        "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
        "CreatedUserID": userId,
        "PriceRounding": 2,
        "page_no": pageNumber,
        "items_per_page": 10,
        "type": "Sales",
        "WarehouseID": 1
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((sale) => Sale.fromJson(sale)).toList();
    } else {
      throw Exception('Failed to load sales');
    }
  }
}
