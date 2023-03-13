import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rphu_application/models/data_product_model.dart';
import 'package:rphu_application/shared/shared_values.dart';

class DataProductService {
  Future<List<DataProductModel>> getDataProducts() async {
    try {
      const token = 'BdKYsP2022';

      final res = await http.get(Uri.parse('$baseUrl/rphu-get'), headers: {
        'Authorization': token,
      });

      print(res.body);

      if (res.statusCode == 200) {
        return List<DataProductModel>.from(
          jsonDecode(res.body)['result'].map(
            (data) => DataProductModel.fromJson(data),
          ),
        ).toList();
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
