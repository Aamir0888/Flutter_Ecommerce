import 'package:flutter/material.dart';
import 'package:flutter_demo/ecommerce_app/Home/Widget/home_app_bar.dart';
import 'package:flutter_demo/ecommerce_app/Home/Widget/image_slider.dart';
import 'package:flutter_demo/ecommerce_app/Home/Widget/search_bar.dart';
import 'package:flutter_demo/ecommerce_app/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const CustomAppBar(),
              const SizedBox(
                height: 10,
              ),
              const MySearchBar(),
              const SizedBox(
                height: 10,
              ),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(
                    () {
                      currentSlider = value;
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
