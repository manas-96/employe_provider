import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiResponse{
  final baseUrl="http://192.168.0.15:81/api/";
  _buildHeader(){
    return { 'Accept' : 'application/json', 'cache-control' : 'no-cache'};
  }
  _buildHeaderWithAuth()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    return { 'Accept' : 'application/json', 'Authorization' : 'Bearer $token'};
  }
  postFunction(body,url) async {
    final response = await http.post(Uri.parse(baseUrl+url), headers: _buildHeader(), body: body);
    print(response.body);
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    }
    else {
      return 'failed';
    }
  }
  postFunctionWithAuth(body,url)async{
    final header = await _buildHeaderWithAuth();
    final response = await http.post(Uri.parse(baseUrl+url), headers: header, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    }
    else {
      return 'failed';
    }
  }
  getFunctionWithAuth(url)async{
    final header = await _buildHeaderWithAuth();
    final response = await http.get(Uri.parse(baseUrl+url), headers: header,);
    print(response.body);
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    }
    else {
      return 'failed';
    }
  }
  getFunction(url) async {
    final response = await http.get(Uri.parse(baseUrl+url), headers: _buildHeader(),);
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    } else {
      return 'failed';
    }
  }
  putFunction(body,url) async {
    final response = await http.put(Uri.parse(baseUrl+url), headers: _buildHeader(),body: json.encode(body));
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    } else {
      return 'failed';
    }
  }
  deleteFunction(url) async {
    final response = await http.delete(Uri.parse(baseUrl+url), headers: _buildHeader());
    if (response.statusCode == 200) {
      final resData = await  json.decode(response.body);
      return resData;
    } else {
      return 'failed';
    }
  }
}