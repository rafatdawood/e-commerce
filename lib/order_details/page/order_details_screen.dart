import 'package:e_commerce/order_details/manager/order_details_cubit.dart';
import 'package:e_commerce/orders/manager/orders_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final cubit = OrderDetailsCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.id = widget.id;
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocListener<OrderDetailsCubit, OrderDetailsState>(
          listener: (context, state) => logic(state),
          child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
            builder: (context, state) {
              if (state is OrderDetailsSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: InkWell(
                            onTap: () => Navigator.pop(context, cubit.data),
                            overlayColor: WidgetStateColor.transparent,
                            child: Icon(Icons.arrow_back_ios_new_outlined)),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            GridView.builder(
                              itemCount:
                                  cubit.orderDetails['data']['products'].length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.all(10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 9,
                                      mainAxisSpacing: 6,
                                      mainAxisExtent: 200,
                                      crossAxisCount: 1),
                              itemBuilder: (context, index) =>
                                  buildGridProductsOrder(index),
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
                            checkStatus(),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
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
                                      '${cubit.orderDetails['data']['address']['name']} - ${cubit.orderDetails['data']['address']['city']} - ${cubit.orderDetails['data']['address']['region']}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      cubit.orderDetails['data']['address']
                                          ['details'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      cubit.orderDetails['data']['address']
                                          ['notes'],
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 70,
                                          color: Color(0xFFF8F8F8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    cubit.orderDetails['data']
                                                        ['date']),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    '\$${cubit.orderDetails['data']['total'].toInt()}'),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    '\$${cubit.orderDetails['data']['cost']}'),
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
                            isCanceled(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ),
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
                      cubit.orderDetails['data']['products'][index]['image']),
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
                            cubit.orderDetails['data']['products'][index]
                                ['name']),
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
                        child: Text(
                          cubit.orderDetails['data']['products'][index]
                                  ['quantity']
                              .toString(),
                        ),
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
                            '\$${cubit.orderDetails['data']['products'][index]['price']}'),
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

  Widget checkStatus() {
    if (cubit.orderDetails['data']['status'] == 'Cancelled') {
      return Container(
        width: 100.w,
        height: 50,
        child: Text(
          'Cancelled',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        alignment: Alignment.center,
      );
    } else {
      return Row(
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
      );
    }
  }

  logic(OrderDetailsState state) {
    if (state is OrderDetailsCancelSuccessState) {
      Fluttertoast.showToast(msg: state.message);
    }
  }

  Widget isCanceled() {
    if(cubit.orderDetails['data']['status'] == 'Cancelled'){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        height: 7.51.h,
        width: 89.33.w,
        decoration: const BoxDecoration(
          color: Color(0xffeeeeee),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: const Text(
          "Cancel Order",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black12,
            fontSize: 22,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }else{
      return InkWell(
        onTap: () => cubit.cancelOrder(),
        overlayColor: const WidgetStatePropertyAll(
            Colors.transparent),
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
      );
    }
  }
}
