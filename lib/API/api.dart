//import 'dart:html' show HttpRequest;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mwn_flutter/API/news_feed.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class API {
  final String trendsUrl = "https://trends.gab.com/trend-feed/json";
  final String urlForWeb = "https://menezesworks.com:8081/trends";

  Future<String> getJsonString(String str) async {
    final url = Uri.parse(str);
    final response = await http.get(url);
    return response.body;
  }

  Future<NewsFeed> getNewsFeed() async {
    final string = await getJsonString(kIsWeb ? urlForWeb : trendsUrl);
    final obj = json.decode(string);
    final feed = NewsFeed.fromJson(obj);
    return feed;
  }
}
