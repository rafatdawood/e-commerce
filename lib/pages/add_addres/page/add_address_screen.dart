import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  final detailsController = TextEditingController();
  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          alignment: Alignment.center,
          height: 50.w,
          width: 50.w,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            overlayColor: WidgetStateColor.transparent,
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w,),
            child: Container(
              height: 812.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 7.h),
                        child: Text(
                          'Shipping Address',
                          style: TextStyle(
                            color: Color(0xFF202020),
                            fontSize: 28.sp,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.28,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.symmetric(vertical: 7.h),
                        child: Text(
                          'Add Address',
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
                        margin: EdgeInsets.only(top: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                fillColor: Color(0xFFF1F4FE),
                                filled: true,
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD2D2D2),
                                  fontSize: 13.83.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 16.h),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'City',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextField(
                              controller: cityController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                fillColor: Color(0xFFF1F4FE),
                                filled: true,
                                hintText: 'City',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD2D2D2),
                                  fontSize: 13.83.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 16.h),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Region',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextField(
                              controller: regionController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                fillColor: Color(0xFFF1F4FE),
                                filled: true,
                                hintText: 'Region',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD2D2D2),
                                  fontSize: 13.83.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 16.h),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Details',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextField(
                              controller: detailsController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                fillColor: Color(0xFFF1F4FE),
                                filled: true,
                                hintText: 'Details',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD2D2D2),
                                  fontSize: 13.83.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 16.h),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Notes',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextField(
                              controller: notesController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(9.r)),
                                fillColor: Color(0xFFF1F4FE),
                                filled: true,
                                hintText: 'Notes',
                                hintStyle: TextStyle(
                                  color: Color(0xFFD2D2D2),
                                  fontSize: 13.83.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 16.h),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => addAddress(
                          name: nameController.text,
                          city: cityController.text,
                          details: detailsController.text,
                          notes: notesController.text,
                          region: regionController.text,
                        ),
                        overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.h),
                          alignment: Alignment.center,
                          height: 61.h,
                          width: 335.w,
                          decoration: BoxDecoration(
                            color: Color(0xff004CFF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                          ),
                          child: Text(
                            "Save Changes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFF3F3F3),
                              fontSize: 22.sp,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }

  Future<void> addAddress({
    required String name,
    required String city,
    required String region,
    required String details,
    required String notes,
  }) async {
    final response = await AppDio.post(endpoint: EndPoints.addresses, body: {
      'name': name,
      'city': city,
      'region': region,
      'details': details,
      'notes': notes,
      'latitude': '0.0',
      'longitude': '0.0',
    });
    Navigator.pop(context, response.data['data']);
  }
}
