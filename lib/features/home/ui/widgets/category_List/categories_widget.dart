import 'package:bloc_mini_project_new/features/web_link_news_list_screen/ui/web_link_news_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../news_list/ui/news_list.dart';
import '../../../datas/categories_list.dart';

class CategoriesWidget extends StatelessWidget {
   CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>WebLinkListNewsList(title: categoryList[index].name,)));
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    categoryList[index].image,
                    fit: BoxFit.cover,
                    width: 125,
                    height: 70,
                  ),
                ),
                Container(
                  width: 125,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  child: Center(
                    child: Text(
                      categoryList[index].name,
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: categoryList.length,
    );
  }
}
