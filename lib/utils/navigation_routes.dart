// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:practice_application/screens/data_screen.dart';
import 'package:practice_application/screens/details_screen.dart';
import 'package:practice_application/screens/home_screen.dart';
import 'package:practice_application/screens/second_screen.dart';
import 'package:practice_application/screens/third_screen.dart';

 List<GetPage> Routes =
 [
    GetPage(
      name: DataScreen.routeName, 
      page: ()=> const DataScreen(),
    ),

    GetPage(
      name: DetailsScreen.routeName, 
      page: ()=> const DetailsScreen(),
    ),

    GetPage(
      name: HomeScreen.routeName, 
      page: ()=> const HomeScreen(),
    ),
    
    GetPage(
      name: SecondScreen.routeName, 
      page: ()=>  SecondScreen(),
    ),

    GetPage(
      name: ThirdScreen.routeName, 
      page: ()=> ThirdScreen(),
    ),
  ];

