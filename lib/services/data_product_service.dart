import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rphu_application/models/data_product_model.dart';
import 'package:rphu_application/shared/shared_values.dart';

class DataProductService {
  final token = 'BdKYsP2022';

  Future<List<DataProduct>> getDataProducts() async {
    try {

      final res = await http.get(Uri.parse('$baseUrl/rphu-get'), headers: {
        'Authorization': token,
      });

      print(res.body);

      if (res.statusCode == 200) {
        return List<DataProduct>.from(
          jsonDecode(res.body)['result'].map(
            (data) => DataProduct.fromJson(data),
          ),
        ).toList();
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<DataProductResponse> fetchDataProducts() async {
    try {

      final Map<String, dynamic> body = {};

      final res = await http.post(Uri.parse('$baseUrl/rphu-get/'),body: jsonEncode(body) , headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json'
      });

      var responseJson = json.decode(res.body.toString());
      return DataProductResponse.fromJson(responseJson);
      
    } catch (e) {
      throw e.toString();
    }
  }

  Future<DataProductResponse> fetchDataProductsDetail({
    required int rphuId
  }) async {
    try {

      final Map<String, dynamic> body = {};

      final res = await http.post(Uri.parse('$baseUrl/rphu-get/$rphuId'),body: jsonEncode(body) , headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json'
      });

      var responseJson = json.decode(res.body.toString());
      return DataProductResponse.fromJson(responseJson);
      
    } catch (e) {
      throw e.toString();
    }
  }

}
