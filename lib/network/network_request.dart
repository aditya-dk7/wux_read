import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:wux_read/models/wuxia_novel_model.dart';

class NetworkRequest {
  static List<WuxiaNovel> parseWuxiaNovels(String responseBody) {
    Map<String, dynamic> list =
        json.decode(responseBody) as Map<String, dynamic>;
    var finalList = list["wuxiaNovels"] as List<dynamic>;
    List<WuxiaNovel> wuxiaNovels =
        finalList.map((model) => WuxiaNovel.fromJson(model)).toList();
    return wuxiaNovels; //WuxNovelModel.items;
  }

  static Future<List<WuxiaNovel>> fetchWuxiaNovels(String token) async {
    Map<String, String> requestHeaders = {'Authorization': 'Bearer $token'};
    final response = await http.get(
        Uri.parse(FlutterConfig.get('WUX_READ_GET_ALL_WUXIA_NOVELS_URL')),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return compute(parseWuxiaNovels, response.body);
    } else {
      throw Exception("Unable to get Novels.");
    }
  }
}
