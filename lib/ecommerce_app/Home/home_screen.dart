import 'package:flutter/material.dart';
import 'package:flutter_demo/ecommerce_app/Home/Widget/category.dart';
import 'package:flutter_demo/ecommerce_app/Home/Widget/home_app_bar.dart';
import 'package:flutter_demo/ecommerce_app/Home/Widget/image_slider.dart';
import 'package:flutter_demo/ecommerce_app/Home/Widget/product_card.dart';
import 'package:flutter_demo/ecommerce_app/Home/Widget/search_bar.dart';
import 'package:flutter_demo/ecommerce_app/constants.dart';
import 'package:flutter_demo/ecommerce_app/models/product_model.dart';

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
      resizeToAvoidBottomInset: true,
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
              ),
              const SizedBox(
                height: 10,
              ),
              const Categories(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  )
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.78, crossAxisSpacing: 20, mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
