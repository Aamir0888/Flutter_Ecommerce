import 'package:flutter/material.dart';
import 'package:flutter_demo/ecommerce_app/ProductDetails/detail_app_bar.dart';
import 'package:flutter_demo/ecommerce_app/ProductDetails/image_slider.dart';
import 'package:flutter_demo/ecommerce_app/constants.dart';
import 'package:flutter_demo/ecommerce_app/models/product_model.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int currentImage = 0;

  // int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      body: SafeArea(
          child: Column(
        children: [
          const DetailAppBar(),
          MyImageSlider(
              onChange: (index) {
                setState(() {
                  currentImage = index;
                });
              },
              image: widget.product.image),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (index) => AnimatedContainer(
                      duration: const Duration(microseconds: 300),
                      width: currentImage == index ? 15 : 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentImage == index
                              ? Colors.black
                              : Colors.transparent,
                          border: Border.all(color: Colors.black)),
                    )),
          )
        ],
      )),
    );
  }
}
