import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/order_details_cubit.dart';

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
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 50.w,
                        height: 50.w,
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
                              padding: EdgeInsets.all(10.w),
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
                              margin: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                S().trackingOrder,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.26,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                checkStatus(),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                S().toAddress,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.26,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.h),
                                height: 100.h,
                                width: 375.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.r),
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
                                        fontSize: 15.sp,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      cubit.orderDetails['data']['address']
                                          ['details'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      cubit.orderDetails['data']['address']
                                          ['notes'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 280.h,
                              width: 375.w,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19.r)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 70.h,
                                          color: Color(0xFFF8F8F8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                     EdgeInsets.all(8.0.w),
                                                child: Text(
                                                  S().date,
                                                  style: TextStyle(
                                                    color: Color(0xFF202020),
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Raleway',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: -0.14,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                     EdgeInsets.all(8.0.w),
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
                                          height: 70.h,
                                          color: Color(0xFFE5EBFC),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                     EdgeInsets.all(8.0.w),
                                                child: Text(
                                                  S().price,
                                                  style: TextStyle(
                                                    color: Color(0xFF202020),
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Raleway',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: -0.14,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                     EdgeInsets.all(8.0.w),
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
                                          height: 70.h,
                                          color: Color(0xFFF8F8F8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                     EdgeInsets.all(8.0.w),
                                                child: Text(
                                                  S().vat,
                                                  style: TextStyle(
                                                    color: Color(0xFF202020),
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Raleway',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: -0.14,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                     EdgeInsets.all(8.0.w),
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
                                          height: 70.h,
                                          color: Color(0xFFE5EBFC),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                     EdgeInsets.all(8.0.w),
                                                child: Text(
                                                  S().total,
                                                  style: TextStyle(
                                                    color: Color(0xFF202020),
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Raleway',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: -0.14,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                     EdgeInsets.all(8.0.w),
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
      height: 40.w,
      width: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE5EBFC),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 30.w,
        width: 30.w,
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
      height: 40.w,
      width: 40.w,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 15.w,
            width: 40.w,
            decoration: BoxDecoration(color: Color(0xFFE5EBFC)),
            child: Container(
              height: 5.w,
              width: 40.w,
              decoration: BoxDecoration(color: Color(0xFF004CFF)),
            ),
          ),
        ],
      ),
    );
  }

  buildGridProductsOrder(int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
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
          Radius.circular(10.r),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.h,
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
                        height: 20.h,
                        child: Text(
                          '${S().name}: ',
                          style: TextStyle(
                            color: Color(0xFF202020),
                            fontSize: 14.sp,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.14,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 20.h,
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
                        '${S().quantity}: ',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 14.sp,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.14,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 20.h,
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
                        '${S().price}: ',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 14.sp,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.14,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        height: 20.h,
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
        width: 375.w,
        height: 50.h,
        child: Text(
          S().cancelled,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
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
                width: 40.w,
                child: Text(
                  textAlign: TextAlign.center,
                  S().orderPlaced,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
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
                width: 40.w,
                child: Text(
                  textAlign: TextAlign.center,
                  S().packed,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
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
                width: 40.w,
                child: Text(
                  textAlign: TextAlign.center,
                  S().shipped,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.sp,
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
                width: 40.w,
                child: Text(
                  textAlign: TextAlign.center,
                  S().delivered,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
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
        margin: EdgeInsets.symmetric(vertical: 20.h),
        alignment: Alignment.center,
        height: 61.h,
        width: 336.w,
        decoration: BoxDecoration(
          color: Color(0xffeeeeee),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
        ),
        child: Text(
          S().cancelOrder,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black12,
            fontSize: 22.sp,
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
          margin: EdgeInsets.symmetric(vertical: 20.h),
          alignment: Alignment.center,
          height: 61.h,
          width: 336.w,
          decoration: BoxDecoration(
            color: Color(0xff004CFF),
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
          ),
          child: Text(
            S().cancelOrder,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF3F3F3),
              fontSize: 22.sp,
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
    }
  }
}
