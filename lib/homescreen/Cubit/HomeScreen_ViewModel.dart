
import 'package:e_commerce_app/Tabs/FavoriteTab.dart';
import 'package:e_commerce_app/Tabs/ProductListTab.dart';
import 'package:e_commerce_app/Tabs/ProfileTab.dart';
import 'package:e_commerce_app/homescreen/Cubit/HomeScreen_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Tabs/HomeTab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{

  HomeScreenViewModel():super(HomeScreenInitialState());

  int selectedIndex=0;
  List<Widget>tabs=[
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void ChangeBottomNavigationBar(int newSelectedError){
    HomeScreenInitialState();
    selectedIndex=newSelectedError;
    emit(ChangeBottomNavigationBarState());
  }
}