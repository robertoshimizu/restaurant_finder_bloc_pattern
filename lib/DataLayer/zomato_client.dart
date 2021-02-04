import 'dart:async';
import 'dart:convert' show json;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'location.dart';
import 'restaurant.dart';

class ZomatoClient {
  String _apiKey = "PASTE YOUR API KEY HERE";
  String _host = "developers.zomato.com";
  String _contextRoot = "api/v2.1";

  // String _apiKey;
  // String _host;
  // String _contextRoot;

  // ZomatoClient() {
  //   String contents = new File('zomato.json').readAsStringSync();
  //   var jeson = json.decode(contents);
  //   this._apiKey = jeson['apiKey'];
  //   this._host = jeson['host'];
  //   this._contextRoot = jeson['contextRoot'];
  // }

  // String get host => this._host;

  Future<List<Location>> fetchLocations(String query) async {
    final results = await request(
        path: 'locations', parameters: {'query': query, 'count': '10'});

    final suggestions = results['location_suggestions'];
    return suggestions
        .map<Location>((json) => Location.fromJson(json))
        .toList(growable: false);
  }

  Future<List<Restaurant>> fetchRestaurants(
      Location location, String query) async {
    final results = await request(path: 'search', parameters: {
      'entity_id': location.id.toString(),
      'entity_type': location.type,
      'q': query,
      'count': '10'
    });

    final restaurants = results['restaurants']
        .map<Restaurant>((json) => Restaurant.fromJson(json['restaurant']))
        .toList(growable: false);

    return restaurants;
  }

  Future<Map> request(
      {@required String path, Map<String, String> parameters}) async {
    final uri = Uri.https(_host, '$_contextRoot/$path', parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers =>
      {'Accept': 'application/json', 'user-key': _apiKey};
}
