import 'package:bloc_mini_project_new/features/home/datas/country_model.dart';
import 'package:bloc_mini_project_new/utils/api_key.dart';
import 'package:flutter/material.dart';

String baseUrl="https://newsapi.org/v2/";//everything?q=&apiKey=$apiKey";

// breaking ,trending
String everythingSectionId='everything?q=';

//categories
String categorySectionUrl='top-headlines/sources?category=';

//countries
String languageSectionUrl='top-headlines/sources?language=';


String noImageAvilable='https://www.legrand.com/ecatalogue/modules/custom/legrand_ecat/assets/img/no-image.png';

String imageNonNull(String image) {
  String checkk=image.substring(0,5);
  // print("Check $checkk");
  switch(checkk){
    case 'https':
      return image;
    default:
      return noImageAvilable;
  }

}

 List<dynamic> colorList=[
   Colors.purpleAccent,
   Colors.redAccent,
   Colors.amberAccent,
   Colors.blueAccent,
   Colors.cyanAccent,
   Colors.deepOrangeAccent,
   Colors.deepPurpleAccent,
   Colors.greenAccent,
   Colors.indigoAccent,
   Colors.lightBlueAccent,
   Colors.lightGreenAccent,
   Colors.limeAccent,
   Colors.orangeAccent,
   Colors.pinkAccent,
 ];

const fontSize14=TextStyle(fontSize: 14);
const fontSize15ColorWhite=TextStyle(fontSize: 15,color: Colors.white);
const fontSize16=TextStyle(fontSize: 16);
const fontSize17ColorWhite=TextStyle(fontSize: 17,color: Colors.white);
const fontSize18=TextStyle(fontSize: 18);
const fontSize19=TextStyle(fontSize: 19);
const fontSize20=TextStyle(fontSize: 20);


snackBar(String tag,BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(tag)));
}
