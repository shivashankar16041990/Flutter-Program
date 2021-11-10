import 'dart:html';
import 'request base.dart';
import 'item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestItem implements HTTPRequest <Item>{

 final String url;
 const RequestItem(this.url);




  @override


  Future<Item> execute() async {

    final response =await http.get(Uri(query: url));

    if (response.statusCode!=200)
      {
        throw http.ClientException("status code is ${response.statusCode}");
      }

    return _parseJson(response.body);

  }
  Item _parseJson(String json){
    return Item.fromJson(jsonDecode(json));
  }





}


