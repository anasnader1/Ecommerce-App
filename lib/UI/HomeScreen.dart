
import 'package:e_commerce_app/homescreen/Cubit/HomeScreen_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../homescreen/Cubit/HomeScreen_States.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel =HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel,HomeScreenStates>(
      bloc: viewModel,
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar:
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft:  Radius.circular(25),
                  bottomRight:  Radius.circular(25)
                    ),
              ),

              child: BottomNavigationBar(
                onTap: (index){
                  viewModel.ChangeBottomNavigationBar(index);
                },

                // currentIndex: selected,
                // onTap: (index) {
                //   selected = index;
                //   setState(() {});
                // },
                type: BottomNavigationBarType.fixed, // Add this line
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME"),
                  BottomNavigationBarItem(icon:
                      Icon(Icons.category),label: "Category"),

                  BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favourite"),

                  BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),


                ],
              ),
            ) ,

            body: viewModel.tabs[viewModel.selectedIndex]
        );
      },
    );



  }
}
