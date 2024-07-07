import 'package:e_commerce/pages/add_addres/page/add_address_screen.dart';
import 'package:e_commerce/pages/address/manager/address_cubit.dart';
import 'package:e_commerce/pages/edit_addres/page/edit_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final cubit = AddressCubit();

  @override
  void initState() {
    super.initState();
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => cubit,
          child: BlocBuilder<AddressCubit, AddressState>(
            buildWhen: (previous, current) => current is AddressSuccessState,
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        overlayColor: WidgetStateColor.transparent,
                        child: Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 7.h),
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 28.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.28,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 18.h),
                              padding: EdgeInsets.symmetric(vertical: 7.h),
                              child: Text(
                                'Shipping Address',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.16,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(bottom: 18.h),
                              child: InkWell(
                                overlayColor: WidgetStateColor.transparent,
                                onTap: () => navToAddAddressScreen(),
                                child: SvgPicture.asset(
                                    'assets/icons/more.svg'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cubit.addressData['data']['data'].length,
                        itemBuilder: (context, index) => buildAddress(index),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAddress(int index) {
    return Container(
      height: 250.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: Offset(0.2, 0.2),
            blurRadius: 3,
            spreadRadius: 3,
          )
        ],
        border: Border.all(
          color: Colors.white,
          width: 3.w,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Name: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${cubit.addressData['data']['data'][index]['name']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'City: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${cubit.addressData['data']['data'][index]['city']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Region: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${cubit.addressData['data']['data'][index]['region']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Details: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${cubit.addressData['data']['data'][index]['details']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Notes: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${cubit.addressData['data']['data'][index]['notes']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          BlocListener<AddressCubit, AddressState>(
            listener: (context, state) => logic(state),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  overlayColor: WidgetStateColor.transparent,
                  onTap: () => cubit.deleteAddress(index),
                  child: Container(
                    alignment: Alignment.center,
                    width: 128.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF81140),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                    ),
                    child: Text(
                      'Delete',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF3F3F3),
                        fontSize: 16.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w300,
                        height: 0.10,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  overlayColor: WidgetStateColor.transparent,
                  onTap: () =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditAddressScreen(),
                          )),
                  child: Container(
                    alignment: Alignment.center,
                    width: 128.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFF004CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                    ),
                    child: Text(
                      'Edit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF3F3F3),
                        fontSize: 16.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w300,
                        height: 0.10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  logic(state) {
    if(state is AddressDeleteSuccessState){
      Fluttertoast.showToast(msg: state.massage);
    }else if(state is AddressDeleteFailureState){
      Fluttertoast.showToast(msg: state.errorMassage);
    }
  }

  navToAddAddressScreen() async{
    final res = await Navigator.push(context, MaterialPageRoute(
      builder: (context) =>
          AddAddressScreen(),));
    cubit.addAddress(res);
  }
}
