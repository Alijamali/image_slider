import 'package:flutter/material.dart';

class SliderHomePageWidget extends StatefulWidget {

  var controller;

  SliderHomePageWidget({super.key , required this.controller});

  @override
  State<SliderHomePageWidget> createState() => _SliderHomePageWidgetState();
}

class _SliderHomePageWidgetState extends State<SliderHomePageWidget> {
  //list all image for show in slider
  var images = [
    'assets/images/a1.png',
    'assets/images/a2.png',
    'assets/images/a3.png',
    'assets/images/a4.png',

  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      controller: widget.controller,
      children: [
        customSliderWidget(images[0]),
        customSliderWidget(images[1]),
        customSliderWidget(images[2]),
        customSliderWidget(images[3]),
      ],
    );
  }

  Widget customSliderWidget(String imagePath){
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Image(
        image: AssetImage(imagePath),
        fit: BoxFit.fill,
      ),
    );
  }

}
