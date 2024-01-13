import 'dart:convert';
//https://javiercbk.github.io/json_to_dart/

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/models/prodcuts_model.dart';

class APIHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
    //Static is so you dont have to create an instance of the class and can just call the method.
    // https://api.escuelajs.co/api/v1/products
    var uri = Uri.https(BASE_URL,
        "/api/v1/products"); //TODO: Why is this better than Uri.parse()
    var response = await http.get(
      uri,
    );

    // print(
    //   'response: ${jsonDecode(response.body)}',
    // );
    var data = jsonDecode(response.body);

    List tempList = [];
    for (var v in data) { //TODO: This sorts through each item in the list, which are product maps
      tempList.add(v);
      //print("V $v \n\n");
    }
    return ProductsModel.productsFromSnapshot(tempList);
  }
}
