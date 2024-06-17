import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/main/page/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int activeIndex = 0;
  List images = [
    {
      'image': 'assets/images/welcome_1.jpg',
      'title': 'Hello',
      'contact':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
      'pt': false
    },
    {
      'image': 'assets/images/welcome_2.jpg',
      'title': 'Ready?',
      'contact': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'pt': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bubbles_welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final image = images[index]['image'];
                  final title = images[index]['title'];
                  final contact = images[index]['contact'];
                  final pt = images[index]['pt'];
                  return buildImage(image, index, title, contact, pt);
                },
                options: CarouselOptions(
                  height: 614,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
              ),
            ),
            SizedBox(height: 20),
            buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildImage(image, int index, title, contact, pt) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.2,
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: const Offset(2.0, 2.0),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            SizedBox(height: 40),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF202020),
                fontSize: 28,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.28,
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: 244,
              height: 111,
              child: Text(
                contact,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            ptIsTrue(pt)
          ],
        ),
      );

  ptIsTrue(pt) {
    if (pt) {
      return InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen(),));
        },
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        child: Container(
          alignment: Alignment.center,
          width: 201,
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xff004CFF),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: const Text(
            "Let's Start",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF3F3F3),
              fontSize: 22,
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: JumpingDotEffect(
            dotHeight: 20,
            dotWidth: 20,
            dotColor: Color(0xFFC7D6FB),
            activeDotColor: Color(0xFF004CFF)),
      );
}
