import 'dart:async';
import 'dart:convert';
import 'package:api_test/models/item.dart';
import 'package:http/http.dart' as http;
import 'helpers.dart';

//good patch v put article
//https://medium.com/backticks-tildes/restful-api-design-put-vs-patch-4a061aa3ed0b

class CrudServices{
  String baseUrl = "http://localhost:3000/v1/items";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  CrudHelpers helpers = CrudHelpers();

  Future<http.Response> createItem(String name, String price) async {

    var body = jsonEncode({"name": name, "price": price});

    http.Response response = await http.post(baseUrl, headers: headers, body: body);
    return response;
  }

  Future<List<Item>> requestIndex() async {
    http.Response response = await http.get(baseUrl, headers: headers);
    if (response.statusCode == 200) {
      //decode takes string and returns Map<String, dynamic>
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Item.fromMap(item)).toList();
    } else {
      return [];
    }
  }

  Future<http.Response> putUpdate(Item item, Map<String, dynamic> data) async {
    var body = helpers.createPutBody(item.mapFromFields(), data);

    String url = baseUrl + "${item.id}";
    http.Response response = await http.put(url, headers: headers, body: body);
    return response;
  }

  Future<http.Response> patchUpdate(Item item, Map<String, dynamic> data) async{
    String url = baseUrl + "${item.id}";

    http.Response response = await http.patch(url, headers: headers, body: data);
    return response;
  }

  Future<http.Response> destroyItem(Item item) async {
    String url = baseUrl + "${item.id}";

    http.Response response = await http.delete(url, headers: headers);
    return response;
  }

  Future<Item> findItem(int id) async {
    String url = baseUrl + "/$id";
    http.Response response = await http.get(url, headers: headers);
    print(response.body);
    if(response.body.toString().contains("null")){
      return null;
    }
    print(Item.fromMap(jsonDecode(response.body)));
    return Item.fromMap(jsonDecode(response.body));
  }

  //TODO * BONUS * findItemByName
//TODO * BONUS * findItemsByPrice


}