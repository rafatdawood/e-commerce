import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List cartsList = List.generate(
    0,
    (index) => {
      'id': index,
      'name': 'Lorem ipsum dolor sit amet consectetur.',
      'imageUrl': 'assets/images/welcome_1.jpg',
      'price': 17.00,
      'units': 1,
    },
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Cart',
                  style: TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 28,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Shipping Address',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.14,
                        ),
                      ),
                      SizedBox(
                        width: 237,
                        height: 50,
                        child: Text(
                          '26, Duong So 2, Thao Dien Ward, An Phu, District 2, Ho Chi Minh city',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 32,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset('assets/icons/button_edit.svg'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: checkIsEmpty(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCartItems(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        height: 109,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 129,
                  height: 109,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(cartsList[index]['imageUrl']),
                        fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0.2,
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer,
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/button_delete.svg',
                      width: 35,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 36,
                      child: Text(
                        maxLines: 2,
                        cartsList[index]['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Text(
                            '\$${cartsList[index]['price']}',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 18,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.18,
                            ),
                          ),
                        ),
                        Container(
                          width: 109,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){},
                                child:
                                    SvgPicture.asset('assets/icons/less.svg'),
                              ),
                              Container(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  '${cartsList[index]['units']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.16,
                                  ),
                                ),
                                width: 37,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xffE5EBFC)),
                              ),
                              InkWell(
                                onTap: () {},
                                child:
                                    SvgPicture.asset('assets/icons/more.svg'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkIsEmpty() {
    if (cartsList.isEmpty) {
      return Image.asset('assets/images/empty_cart.png');
    } else {
      return ListView.builder(
        itemCount: cartsList.length,
        itemBuilder: (context, index) => buildCartItems(index),
      );
    }
  }
}
