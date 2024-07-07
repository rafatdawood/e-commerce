import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../order_details/page/order_details_screen.dart';
import '../manager/orders_cubit.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final cubit = OrdersCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => cubit,
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  S().orders,
                  style: TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 28.sp,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.28,
                  ),
                ),
              ),
              BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  return Expanded(
                    child: checkIsEmpty(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrders(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Container(
        height: 150.h,
        width: 356.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${S().total}: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.16,
                  ),
                ),
                Text(
                  '\$${cubit.ordersData['data']['data'][index]['total']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${S().date}: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.16,
                  ),
                ),
                Text(
                  '${cubit.ordersData['data']['data'][index]['date']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${S().status}: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.16,
                  ),
                ),
                Text(
                  '${cubit.ordersData['data']['data'][index]['status']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget checkIsEmpty() {
    if (cubit.ordersData['data']['data'].isEmpty) {
      return Image.asset('assets/images/empty_cart.png');
    } else {
      return ListView.builder(
        itemCount: cubit.ordersData['data']['data'].length,
        itemBuilder: (context, index) => InkWell(
            onTap: () => navToOrderDetailsScreen(
                cubit.ordersData['data']['data'][index]['id']),
            overlayColor: WidgetStateColor.transparent,
            child: buildOrders(index)),
      );
    }
  }

  navToOrderDetailsScreen(int id) async {
    final response = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(
          id: id,
        ),
      ),
    );
    if(response.isNotEmpty){
      cubit.edit(response);
    }
  }
}
