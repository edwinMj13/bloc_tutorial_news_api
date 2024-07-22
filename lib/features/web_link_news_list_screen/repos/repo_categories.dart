import 'dart:convert';

import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/utils/api_key.dart';
import 'package:bloc_mini_project_new/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../data/weblink_data_model.dart';

class RepoCategories {
  static  getCategoriesNow({required String tag,String code=''}) async {
    String webUrl= tag.length==2 ?'$languageSectionUrl$tag'  :'$categorySectionUrl$tag';
    // List<BreakingDataModel> brekingList=[];
    try {
      final response = await http.get(
          Uri.parse("$baseUrl$webUrl$apiKey"));
      print("URL $baseUrl$webUrl$apiKey");
      final json = jsonDecode(response.body) as Map<String, dynamic>;
       print(json);
      return WebLinkDataModel.fromJson(json);
    }catch(e){
      print("getBreaking Exception $e");
    }
  }
}