import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/product/page/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  final List products = List.generate(
    20,
    (index) => {
      'id': index,
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'price': 17.00
    },
  ).toList();
  final List categories = List.generate(
    5,
    (index) => {'id': index, 'name': 'Product $index'},
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Shop',
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 28,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.28,
                      ),
                    ),
                    SizedBox(width: 19),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(59)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(59)),
                          fillColor: Color(0xFFF8F8F8),
                          filled: true,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Color(0xFFD2D2D2),
                            fontSize: 13.83,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          CarouselSlider.builder(
                            itemCount: images.length,
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              final image = images[index]['image'];
                              return buildImage(
                                image,
                                index,
                              );
                            },
                            options: CarouselOptions(
                              height: 130,
                              viewportFraction: 1,
                              autoPlay: true,
                              onPageChanged: (index, reason) =>
                                  setState(() => activeIndex = index),
                            ),
                          ),
                          SizedBox(height: 10),
                          buildIndicator(),
                        ],
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 21,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.21,
                        ),
                      ),
                      GridView.builder(
                        itemCount: categories.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 9,
                            mainAxisSpacing: 6,
                            mainAxisExtent: 192,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) =>
                            buildGridCategories(index),
                      ),
                      Text(
                        'Products',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 21,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.21,
                        ),
                      ),
                      GridView.builder(
                        itemCount: products.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 9,
                            mainAxisSpacing: 6,
                            mainAxisExtent: 245,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) =>
                            buildGridProducts(index),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(image, int index) => Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: images.length,
        effect: JumpingDotEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Color(0xFFC7D6FB),
            activeDotColor: Color(0xFF004CFF)),
      );

  buildGridCategories(int index) {
    return Container(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/welcome_2.jpg'),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              alignment: Alignment.centerLeft,
              height: 32,
              child: Text(
                categories[index]['name'],
                style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 17,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.17,
                ),
              ))
        ],
      ),
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
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

  buildGridProducts(int index) {
    return Container(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(),
            )),
        child: Column(
          children: [
            Container(
              height: 181,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                    width: 5, style: BorderStyle.solid, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0.2,
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(2.0, 2.0),
                  ),
                ],
                image: DecorationImage(
                    image: AssetImage('assets/images/welcome_1.jpg'),
                    fit: BoxFit.fitWidth),
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  alignment: Alignment.centerLeft,
                  height: 32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index]['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        '\$${products[index]['price'].toString()}',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 17,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0.07,
                          letterSpacing: -0.17,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
