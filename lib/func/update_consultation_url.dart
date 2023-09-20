import 'dart:convert';
import 'dart:developer';

import 'package:healthonify_mobile/constants/api_url.dart';
import 'package:healthonify_mobile/models/http_exception.dart';
import 'package:http/http.dart' as http;

class UpdateConsultationDetails {
  static Future<void> updateJitsiLink(Map<String, dynamic> data, id) async {
    String url = "${ApiUrl.url}put/consultation?id=$id";

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );
      // log(response.body.toString());
      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode >= 400) {
        log(responseData["error"].toString());
        throw HttpException(responseData["message"]);
      }
      if (responseData["status"] == 1) {
        // final payData = json.decode(response.body)["data"];
        // log(responseData.toString());
        // log(_paymentData.rzpOrderId!);
      } else {
        log(responseData["error"].toString());
        throw HttpException(responseData["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }
}
