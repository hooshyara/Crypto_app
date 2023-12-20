import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant/url.dart';
// import 'package:crypto_price_app/constant/url.dart';

class NetworkService {
  const NetworkService();

  Future<dynamic> getData({required String url}) async {
    http.Response response = await http.get(Uri.parse(priceUrl));
    if (response.statusCode == 200) {
      final body = response.body;
      final data = jsonDecode(body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
