import 'dart:convert';

import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:http/http.dart' as http;

import '../../../utils/api_key.dart';
import '../../../utils/utils.dart';
class NewsListRepos {

 static getNewsList(String tag) async {
    // List<BreakingDataModel> brekingList=[];
    try {
      final response = await http.get(
          Uri.parse("$baseUrl$everythingSectionId$tag$apiKey"));
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      // print(json);
      return TrBrDataModel.fromJson(json);
    }catch(e){
      print("getBreaking Exception $e");
    }
  }
}