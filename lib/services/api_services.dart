// ignore_for_file: avoid_print

import 'package:productsshop/models/product_details.dart';
import 'package:productsshop/models/product_models.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Products>> getProduct() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = Uri.parse('https://fakestoreapi.com/products');

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
    return productsFromJson(resBody);
  }

  Future<ProductDetails> getDetails(String id) async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = Uri.parse('https://fakestoreapi.com/products/$id');

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
    return productDetailsFromJson(resBody);
  }
}
