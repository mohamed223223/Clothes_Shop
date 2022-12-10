// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:clothes_store/app_styles.dart';
import 'package:clothes_store/first_Screen.dart';
import 'package:clothes_store/size_config.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

// Mohamed Amer

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const FirstScreen(),

        // The location of floatig acction button
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 64,
          child: CustomNavigationBar(
              isFloating: true,
              borderRadius: Radius.circular(64),
              selectedColor: kWhite,
              unSelectedColor: kGrey,
              backgroundColor: kBrown,
              // This line for the color that appear when I click the item (Like animation)
              strokeColor: Colors.transparent,
              // This line for the animation speed that appear when I click the item
              scaleFactor: 0.2,
              iconSize: 40,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                CustomNavigationBarItem(
                    icon: _currentIndex == 0
                        ? SvgPicture.asset("assets/cart_icon_selected.svg")
                        : SvgPicture.asset("assets/cart_icon_unselected.svg")),
                CustomNavigationBarItem(
                    icon: _currentIndex == 1
                        ? SvgPicture.asset("assets/cart_icon_selected.svg")
                        : SvgPicture.asset("assets/cart_icon_unselected.svg")),
                CustomNavigationBarItem(
                    icon: _currentIndex == 2
                        ? SvgPicture.asset("assets/favorite_icon_selected.svg")
                        : SvgPicture.asset(
                            "assets/favorite_icon_unselected.svg")),
                CustomNavigationBarItem(
                    icon: _currentIndex == 3
                        ? SvgPicture.asset("assets/account_icon_selected.svg")
                        : SvgPicture.asset(
                            "assets/account_icon_unselected.svg"))
              ]),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categoris = ["All Items", "Dress", "Hat", "watch"];
  List<String> icons = [
    "all_items_icon",
    "dress_icon",
    "hat_icon",
    "watch_icon"
  ];
  List<String> images = [
    "image-01.png",
    "image-02.png",
    "image-03.png",
    "image-04.png",
    "image-05.jpg",
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello , World",
                        style: kEncodeSansRagular.copyWith(
                          color: kDarkBrown,
                          // Font Size is 3.5 persent of screen size
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      Text(
                        "Mohamed Amer",
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          // Font Size is 4 persent of screen size
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kGrey,
                    backgroundImage: AssetImage("assets/images/image-05.jpg"),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kEncodeSansRagular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: Icon(
                        Icons.search,
                        color: kDarkGrey,
                      ),
                      hintText: "Search Clothes",
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 49,
                  width: 49,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: kBlack),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/filter_icon.svg",
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
            height: 36.0,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: categoris.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? kPaddingHorizontal : 15,
                        right: index == categoris.length - 1
                            ? kPaddingHorizontal
                            : 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 36,
                    decoration: BoxDecoration(
                        color: current == index ? kBrown : kWhite,
                        borderRadius: BorderRadius.circular(8),
                        border: current == index
                            ? null
                            : Border.all(color: kLightGrey, width: 1)),
                    child: Row(
                      children: [
                        SvgPicture.asset(current == index
                            ? "assets/${icons[index]}_selected.svg"
                            : "assets/${icons[index]}_unselected.svg"),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          categoris[index],
                          style: kEncodeSansMedium.copyWith(
                              color: current == index ? kWhite : kDarkBrown),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 22,
          ),
          MasonryGridView.count(
            shrinkWrap: true,
            // This line for making MansoryGridView Scrollaple
            physics: NeverScrollableScrollPhysics(),
            // Number of images in the Row
            crossAxisCount: 2,
            // The space between images horzantly
            crossAxisSpacing: 20,
            // The space between images verticaly
            mainAxisSpacing: 23,
            itemCount: images.length,
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: kPaddingHorizontal),
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          child: Image.asset(
                            "assets/images/${images[index]}",
                            fit: BoxFit.cover,
                          ),
                        )),
                        Positioned(
                          right: 12,
                          top: 12,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                                "assets/favorite_cloth_icon_unselected.svg"),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Modern light Clothes",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kEncodeSansSemibold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    Text(
                      "Dress Modren",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kEncodeSansRagular.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$212.99",
                          style: kEncodeSansBold.copyWith(
                            color: kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: kYellow,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              "5.0",
                              style: kEncodeSansRagular.copyWith(
                                color: kDarkBrown,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
