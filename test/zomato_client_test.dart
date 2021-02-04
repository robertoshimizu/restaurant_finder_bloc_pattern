import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_finder/DataLayer/entities.dart';

void main() {
  test('Test if ZomatoClient is instatiated', () {
    final _client = ZomatoClient();
    expect(_client.host, "developers.zomato.com");
  });
}
