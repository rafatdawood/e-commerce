import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  Map orderDetails = {
    "status": true,
    "message": null,
    "data": {
      "id": 44115,
      "cost": 42098,
      "discount": 0,
      "points": 14912.113068750011734664440155029296875,
      "vat": 5893.7200000000002546585164964199066162109375,
      "total": 33079.60693124998942948877811431884765625,
      "points_commission": 0,
      "promo_code": "----",
      "payment_method": "Cash",
      "date": "20 / 06 / 2024",
      "status": "New",
      "address": {
        "id": 3821,
        "name": "home",
        "city": "cairo",
        "region": "nasr city",
        "details": "zaker hussein street",
        "notes": "notes",
        "latitude": 30.061686300000001637044988456182181835174560546875,
        "longitude": 31.326008800000000320551407639868557453155517578125
      },
      "products": [
        {
          "id": 52,
          "quantity": 1,
          "price": 25000,
          "name": "Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue",
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg"
        },
        {
          "id": 53,
          "quantity": 1,
          "price": 5599,
          "name":
              "JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM",
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg"
        },
        {
          "id": 54,
          "quantity": 1,
          "price": 11499,
          "name":
              "Samsung 65 Inch Smart TV 4K Ultra HD Curved - UA65RU7300RXUM",
          "image":
              "https://student.valuxapps.com/storage/uploads/products/1615441020ydvqD.item_XXL_51889566_32a329591e022.jpeg"
        }
      ]
    }
  };
  List tracking = [
    {'title': 'Order Placed', 'value': 'new'},
    {'title': 'Packed', 'value': 'Packed'},
    {'title': 'Shipped', 'value': 'Shipped'},
    {'title': 'Delivered', 'value': 'Delivered'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              GridView.builder(
                itemCount: orderDetails['data']['products'].length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 9,
                    mainAxisSpacing: 6,
                    mainAxisExtent: 200,
                    crossAxisCount: 1),
                itemBuilder: (context, index) => buildGridProductsOrder(index),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Tracking Order',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.26,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      buildStepTrack(),
                      SizedBox(
                        width: 40,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Order Placed',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  buildStepTrackLine(),
                  Column(
                    children: [
                      buildStepTrack(),
                      SizedBox(
                        width: 40,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Packed',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  buildStepTrackLine(),
                  Column(
                    children: [
                      buildStepTrack(),
                      SizedBox(
                        width: 40,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Shipped',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  buildStepTrackLine(),
                  Column(
                    children: [
                      buildStepTrack(),
                      SizedBox(
                        width: 40,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Delivered',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'To address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.26,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  width: 356,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${orderDetails['data']['address']['name']} - ${orderDetails['data']['address']['city']} - ${orderDetails['data']['address']['region']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        orderDetails['data']['address']['details'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        orderDetails['data']['address']['notes'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 280,
                width: 100.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(19)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            color: Color(0xFFF8F8F8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Color(0xFF202020),
                                      fontSize: 14,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(orderDetails['data']['date']),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            color: Color(0xFFE5EBFC),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Price',
                                    style: TextStyle(
                                      color: Color(0xFF202020),
                                      fontSize: 14,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      '\$${orderDetails['data']['total'].toInt()}'),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            color: Color(0xFFF8F8F8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Vat',
                                    style: TextStyle(
                                      color: Color(0xFF202020),
                                      fontSize: 14,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('14%'),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            color: Color(0xFFE5EBFC),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Total',
                                    style: TextStyle(
                                      color: Color(0xFF202020),
                                      fontSize: 14,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('\$${orderDetails['data']['cost']}'),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  height: 7.51.h,
                  width: 89.33.w,
                  decoration: const BoxDecoration(
                    color: Color(0xff004CFF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Cancel Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF3F3F3),
                      fontSize: 22,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }

  Widget buildStepTrack() {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE5EBFC),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF004CFF),
        ),
      ),
    );
  }

  Widget buildStepTrackLine() {
    return Container(
      alignment: Alignment.center,
      height: 40,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 15,
            width: 70,
            decoration: BoxDecoration(color: Color(0xFFE5EBFC)),
            child: Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(color: Color(0xFF004CFF)),
            ),
          ),
        ],
      ),
    );
  }

  buildGridProductsOrder(int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
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
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      orderDetails['data']['products'][index]['image']),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        child: Text(
                          'Name: ',
                          style: TextStyle(
                            color: Color(0xFF202020),
                            fontSize: 14,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.14,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 20,
                        child: Text(
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            orderDetails['data']['products'][index]['name']),
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Quantity: ',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.14,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 20,
                        child: Text(orderDetails['data']['products'][index]
                                ['quantity']
                            .toString(),),
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.14,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 20,
                        child: Text(
                            '\$${orderDetails['data']['products'][index]['price']}'),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
