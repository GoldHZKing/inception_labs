// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: hei * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    child: Container(
                      height: hei * 0.06,
                      width: wid * 0.15,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.two_k_outlined,
                            size: 40,
                          )),
                    ),
                  ),
                  Container(
                    width: wid * 0.45,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    child: FloatingSearchAppBar(
                      automaticallyImplyBackButton: false,
                     // leadingActions: [Icon(Icons.)],

                      //color: Colors.blue.shade50,
                      //alwaysOpened: true,
                      hint: "Finf for food",
                      hintStyle: TextStyle(color: Colors.blue),
                      body: null,
                      elevation: 10,
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    child: Container(
                      height: hei * 0.06,
                      width: wid * 0.15,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings_outlined,
                            color: Colors.green,
                            size: 40,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hei * 0.05,
              ),
              Text(
                "What would you like you\nto order",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: hei * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FoodCard(
                    foodName: 'Suya',
                    Iconn: Icons.food_bank_outlined,
                    color: Colors.amber,
                  ),
                  FoodCard(
                    foodName: 'Meals',
                    Iconn: Icons.airline_seat_flat,
                    color: Colors.red,
                  ),
                  FoodCard(
                    foodName: 'Sides',
                    Iconn: Icons.food_bank_outlined,
                    color: Colors.green,
                  ),
                ],
              ),
              SizedBox(
                height: hei * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FoodCard(
                    foodName: 'Shawarma',
                    Iconn: Icons.rotate_left_outlined,
                    color: Colors.teal,
                  ),
                  FoodCard(
                    foodName: 'Drinks',
                    Iconn: Icons.drag_indicator,
                    color: Colors.purple,
                  ),
                  FoodCard(
                    foodName: 'Spices',
                    Iconn: Icons.policy,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(
                height: hei * 0.01,
              ),
              CarouselSlider(
                items: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: wid * 0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("4,5"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: hei * 0.05,
                                    child: Icon(Icons.album_sharp),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: hei * 0.07,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: hei * 0.03,
                                  width: wid * 0.17,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Align(child: Text("Add")),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: hei * 0.0055),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.network(
                                      "https://media.gettyimages.com/photos/mini-burgers-and-beer-picture-id155358715?s=2048x2048")
                                  .image,
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: wid * 0.15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4,5"),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: hei * 0.05,
                                  child: Icon(Icons.album_sharp),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: hei * 0.07,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: hei * 0.03,
                                width: wid * 0.17,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Align(child: Text("Add")),
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.symmetric(vertical: hei * 0.0055),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.network(
                                      "https://media.gettyimages.com/photos/cheeseburger-with-bacon-on-slate-picture-id1023296112?s=2048x2048")
                                  .image,
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: wid * 0.15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4,5"),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: hei * 0.05,
                                  child: Icon(Icons.album_sharp),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: hei * 0.07,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: hei * 0.03,
                                width: wid * 0.17,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Align(child: Text("Add")),
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.symmetric(vertical: hei * 0.0055),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.network(
                                      "https://media.gettyimages.com/photos/creamy-tuna-salad-sliders-with-sweet-pickles-swiss-cheese-tomato-and-picture-id1287498840?s=2048x2048")
                                  .image,
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
                options: CarouselOptions(
                  height: hei * 0.22,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.Iconn,
    required this.foodName,
    required this.color,
  }) : super(key: key);

  final IconData Iconn;
  final String foodName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
      elevation: 10,
      child: Container(
        height: hei * 0.17,
        width: wid * 0.25,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Iconn,
              size: hei * 0.057,
              color: color,
            ),
            Text(
              foodName,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
