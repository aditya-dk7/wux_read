import 'dart:convert';
import 'dart:ffi';
import 'package:wux_read/models/wuxia_novel_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String getAllWuxiaNovelUrl =
      "";
  static List<WuxiaNovel> parseWuxiaNovels(String responseBody) {
    Map<String, dynamic> list =
        json.decode(responseBody) as Map<String, dynamic>;
    var finalList = list["wuxiaNovels"] as List<dynamic>;
    List<WuxiaNovel> wuxiaNovels =
        finalList.map((model) => WuxiaNovel.fromJson(model)).toList();
    return wuxiaNovels; //WuxNovelModel.items;
  }

  static Future<List<WuxiaNovel>> fetchWuxiaNovels() async {
    Map<String, String> requestHeaders = {
      'Authorization':
          'Bearer '
    };
    final response =
        await http.get(Uri.parse(getAllWuxiaNovelUrl), headers: requestHeaders);
    if (response.statusCode == 200) {
      return compute(parseWuxiaNovels, response.body);
    } else {
      throw Exception("Unable to get Novels.");
    }
  }
}
