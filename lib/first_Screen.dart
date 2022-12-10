// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:clothes_store/app_styles.dart';
import 'package:clothes_store/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int currentTab = 0;

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: kPaddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,world",
                        style: kEncodeSansMedium.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      Text(
                        "Mohamed Amer",
                        style: kEncodeSansBold.copyWith(
                          color: kDarkBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4.0,
                        ),
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: kDarkGrey,
                    backgroundImage: AssetImage("assets/images/image-01.png"),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      border: kInputBorder,
                      errorBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      disabledBorder: kInputBorder,
                      focusedErrorBorder: kInputBorder,
                      hintText: "Search Clothes",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: Icon(
                        Icons.search,
                        color: kGrey,
                      )),
                )),
                SizedBox(
                  width: 8,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 49,
                  width: 49,
                  decoration: BoxDecoration(
                      color: kDarkBrown,
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                  child: SvgPicture.asset("assets/filter_icon.svg"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
            height: 36,
            child: ListView.builder(
              itemCount: categoris.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? kPaddingHorizontal : 15,
                        right: index == categoris.length - 1
                            ? kPaddingHorizontal
                            : 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: currentTab == index
                            ? kDarkBrown
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: currentTab == index
                                ? Colors.transparent
                                : kLightGrey,
                            width: 1)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          currentTab == index
                              ? "assets/${icons[index]}_selected.svg"
                              : "assets/${icons[index]}_unselected.svg",
                          color: currentTab == index ? kWhite : kBlack,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          categoris[index],
                          style: kEncodeSansRagular.copyWith(
                              color: currentTab == index ? kWhite : kBlack),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 32,
          ),
          MasonryGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 23,
            crossAxisSpacing: 20,
            itemCount: images.length,
            padding: EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal, vertical: 10),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.asset(
                        "assets/images/${images[index]}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 12,
                        right: 12,
                        child: SvgPicture.asset(
                            "assets/favorite_cloth_icon_unselected.svg"))
                  ]),
                  SizedBox(height: 8),
                  Text(
                    "Modern Light Clothes",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansSemibold.copyWith(
                        color: kDarkBrown,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Dress Modern",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kEncodeSansRagular.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ 212.99",
                        style: kEncodeSansBold.copyWith(
                            color: kDarkBrown,
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.0),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "5.0",
                            style: kEncodeSansRagular.copyWith(
                                color: kBrown,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 4.0),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
