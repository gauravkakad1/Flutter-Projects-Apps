import 'dart:convert';

import 'package:covid_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Models/countries_list_model.dart';
import '../Models/worldstates_model.dart';

class StatesServices{

  Future<WorldStatesModel> getStatsData  ()async{
    final response  = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if(response.statusCode == 200){
      var data  = json.decode(response.body);
      return WorldStatesModel.fromJson(data);
    }
    else{
        throw(Exception("Error"));
    }
  }
  Future <List<dynamic>> getCountriesList() async {
    var response = await http.get(Uri.parse(AppUrl.countriesList));
    var data;
    if(response.statusCode ==200){
      data = json.decode(response.body.toString());
      return data;
    }
    else{
      throw Exception("error");
    }
  }

}