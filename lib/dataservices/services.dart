import 'dart:convert';
import 'package:getx_api_fakestore/api/product/product.dart';
import 'package:http/http.dart' as http;

class Services {
  //get method
  var url = 'https://fakestoreapi.com/products';
  Future<List<Product>?> getProduct() async {
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      return List<Product>.from(data.map((e)=>Product.fromJson(e)));
    } else {
      return null;
    }
  }
}
