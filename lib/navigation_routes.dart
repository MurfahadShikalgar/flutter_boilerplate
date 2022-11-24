// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:practice_application/home_screen.dart';
import 'package:practice_application/second_screen.dart';
import 'package:practice_application/third_screen.dart';

 List<GetPage> Routes =
 [
    GetPage(
      name: '/first', 
      page: ()=> HomeScreen(),
    ),
    
    GetPage(
      name: '/second', 
      page: ()=> const SecondScreen(),
    ),

    GetPage(
      name: '/third', 
      page: ()=> const ThirdScreen(),
    ),

  ];

