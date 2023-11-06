import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Domain/di.dart';
import 'package:e_commerce_app/homescreen/Cubit/HomeTab_States.dart';
import 'package:e_commerce_app/homescreen/Cubit/hometab_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeTab extends StatelessWidget {
// CategoryEntity categoryEntity;
// HomeTab({required this.categoryEntity});
HomeTabViewModel viewModel=HomeTabViewModel(getAllCategoriesUseCase: injectGetAllCategoriesUseCase(),
getAllBrandsUseCase: injectGetAllBrandsUseCase()
);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
      bloc:viewModel..getCategories()..getBrands() ,


        builder: (context, state)=>
          viewModel.CategiresList.isEmpty?
              Center(child: CircularProgressIndicator()):

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: ImageSlideshow(
                    /// Width of the [ImageSlideshow].
                    width: double.infinity,

                    /// Height of the [ImageSlideshow].
                    height: 200,

                    /// The page to show when first creating the [ImageSlideshow].
                    initialPage: 0,

                    /// The color to paint the indicator.
                    indicatorColor: Color(0xff004182),

                    /// The color to paint behind th indicator.
                    indicatorBackgroundColor: Colors.white,

                    /// The widgets to display in the [ImageSlideshow].          /// Add the sample image file into the images folder
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/dd.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/dd.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/images/dd.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],

                    /// Called whenever the page in the center of the viewport changes.          onPageChanged: (value) {
                    //print('Page changed: $value');          },
                    /// Auto scroll interval.
                    /// Do not auto scroll with null or 0.          autoPlayInterval: 5000,
                    /// Loops back to first slide.
                    isLoop: true,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 9),
                  child: Row(
                    children: [
                      Text("Category",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text("View All",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            maxRadius:
                            30, //child: Image.asset("assets/images/salal.jpg"),
                            backgroundImage:
                            
                            NetworkImage(
                              viewModel.CategiresList[index].image??''
                            ),

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              viewModel.CategiresList[index].name??'',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                          )
                        ],
                      );
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 9),
                  child: Row(
                    children: [
                      Text("BRANDS",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text("View All",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            //child: Image.asset("assets/images/salal.jpg"),
                            backgroundImage:
                            NetworkImage(
                              viewModel.BrandsList[index].image??''
                            ),

                            maxRadius: 30,
                          ),  SizedBox(
                             height: 8,
                          ),
                          Text(viewModel.BrandsList[index].name??'')
                        ],
                      );
                    },
                    itemCount: viewModel.BrandsList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                )

              ],
            ),
          )
    );
  }
}
