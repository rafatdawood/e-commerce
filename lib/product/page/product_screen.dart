import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int activeIndex = 0;
  Map productData = {
    "status": true,
    "message": null,
    "data": {
      "id": 53,
      "price": 5599,
      "old_price": 10230,
      "discount": 45,
      "image":
          "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg",
      "name":
          "JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM",
      "description":
          "GENERAL SPECIFICATIONS\r\nMusic playing time: 15 hours\r\nOutput power (W): 2 x 20\r\nDIMENSIONS\r\nDimensions: 13.6 x 28.8 x 13.2 centimeters\r\nWeight: 2.39 kilograms\r\nCONTROL AND CONNECTION SPECIFICATIONS\r\nBluetooth version: 4.2\r\nBATTERY\r\nBattery capacity: 10000 mAh\r\nCharging time: 3.5 hours\r\nFEATURES\r\n3.5 mm audio cable Input: Yes\r\nAuto power off: Yes\r\nBluetooth: Yes\r\nJBL Connect+: Yes\r\nPower bank: Yes\r\nSpeakerphone: Yes\r\nVoice Assistant: Yes\r\nWaterproof: Yes",
      "in_favorites": false,
      "in_cart": false,
      "images": [
        "https://student.valuxapps.com/storage/uploads/products/1615440689Oojt6.item_XXL_36330138_142814947.jpeg",
        "https://student.valuxapps.com/storage/uploads/products/16154406895ynKU.item_XXL_36330138_142814944.jpeg",
        "https://student.valuxapps.com/storage/uploads/products/1615440689MjvIY.item_XXL_36330138_142814940.jpeg",
        "https://student.valuxapps.com/storage/uploads/products/1615440689QITsu.item_XXL_36330138_142814934.jpeg"
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Container(
                height: 439,
                width: 100.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: productData['data']['images'].length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        final image = productData['data']['images'][index];
                        return buildImage(
                          image,
                          index,
                        );
                      },
                      options: CarouselOptions(
                        height: 439,
                        viewportFraction: 1,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                    ),
                    Positioned(
                      child: buildIndicator(),
                      bottom: 10,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        '\$${productData['data']['price']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.26,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    discount(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: 335,
                      height: 62,
                      child: Text(
                        productData['data']['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.26,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: 100.w,
                      child: Text(
                        productData['data']['description'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                            height: 2.5),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: 100.w,
            height: 84,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  overlayColor: WidgetStateColor.transparent,
                  child: isLiked(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        overlayColor: WidgetStateColor.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Color(0xFF202020),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          width: 128,
                          height: 40,
                          child: Text(
                            'Add to cart',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF3F3F3),
                              fontSize: 16,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        overlayColor: WidgetStateColor.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Color(0xFF004CFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          width: 128,
                          height: 40,
                          child: Text(
                            'Buy now',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF3F3F3),
                              fontSize: 16,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(
    image,
    int index,
  ) =>
      Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Image(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
          ],
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: productData['data']['images'].length,
        effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Color(0xFF707070),
            activeDotColor: Color(0xFF004BFF)),
      );

  Widget isLiked() {
    if (productData['data']['in_favorites']) {
      return SvgPicture.asset('assets/icons/like_true.svg');
    } else {
      return SvgPicture.asset('assets/icons/like_false.svg');
    }
  }

  Widget discount() {
    if(productData['data']['discount'] > 0){
      return Row(
        children: [
          Text(
            '\$${productData['data']['old_price']}',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationColor: Color(0xFFF1AEAE),
              color: Color(0xFFF1AEAE),
              fontSize: 14,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w800,
              letterSpacing: 0.17,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            width: 39,
            height: 18,
            alignment: Alignment.center,
            child: Text(
              '-${productData['data']['discount']}%',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: -0.13,
              ),
            ),
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.00, 0.00),
                end: Alignment(1, 0),
                colors: [Color(0xFFFF5790), Color(0xFFF81140)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
            ),
          ),
        ],
      );
    }else{
      return const SizedBox();
    }
  }
}
