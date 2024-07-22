import 'package:bloc_mini_project_new/features/home/blocs/home_breaking_bloc/home_bloc.dart';
import 'package:bloc_mini_project_new/features/home/ui/home_screen.dart';
import 'package:bloc_mini_project_new/features/news_details/bloc/newsdetails_bloc.dart';
import 'package:bloc_mini_project_new/features/news_list/bloc/newslist_bloc.dart';
import 'package:bloc_mini_project_new/features/news_list/ui/news_list.dart';
import 'package:bloc_mini_project_new/features/on_boarding_screen/ui/on_boarding_screen.dart';
import 'package:bloc_mini_project_new/features/web_link_news_list_screen/bloc/web_link_news_list_bloc.dart';
import 'package:bloc_mini_project_new/features/write_to_developer/bloc/write_to_dev_bloc.dart';
import 'package:bloc_mini_project_new/features/write_to_developer/write_to_delevoler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Please create the instance with BlocProvider or MultiBlocProvider to get the data
    // I used 3 different blocs in HomeScreen. I was advised not to do that, but to manage it in single Bloc.

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeBloc()),
        BlocProvider(create: (context)=>NewsdetailsBloc()),
        BlocProvider(create: (context)=>NewslistBloc()),
        BlocProvider(create: (context)=>WebLinkNewsListBloc()),
        BlocProvider(create: (context)=>WriteToDevBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black, brightness: Brightness.light),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
