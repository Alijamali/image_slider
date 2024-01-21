import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_slider/slider_home_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Slider With Indicator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Slider With Indicator',
              style: GoogleFonts.badScript(
                color: Colors.white,
                fontSize: 28,
              )),
          centerTitle: true,
          backgroundColor: Colors.black87,
          toolbarHeight: 80,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              width: screenWidth * 0.9,
              height: screenHeight * 0.8,
              child: Stack(
                children: [
                  SliderHomePageWidget(controller: pageController),

                  //now , create controller and indicator for change slides
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 4,
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInCubic),
                        //also , we can change animation
                        //now change indicator effect
                        effect: const ExpandingDotsEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.amber,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
