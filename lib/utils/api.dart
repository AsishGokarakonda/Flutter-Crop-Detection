import 'dart:convert';

import 'package:http/http.dart' as http;
class APILoad{
  String api = 'http://10.196.9.231:8000';
  Future <List> getallinfo() async{
    try {
      
      var response = await http.get(Uri.parse(api));
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      }else{
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}