import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    'Shipping Address',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 28,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.28,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18),
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    'Edit Addres',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          fillColor: Color(0xFFF1F4FE),
                          filled: true,
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: Color(0xFFD2D2D2),
                            fontSize: 13.83,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'City',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          fillColor: Color(0xFFF1F4FE),
                          filled: true,
                          hintText: 'City',
                          hintStyle: TextStyle(
                            color: Color(0xFFD2D2D2),
                            fontSize: 13.83,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Region',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          fillColor: Color(0xFFF1F4FE),
                          filled: true,
                          hintText: 'Region',
                          hintStyle: TextStyle(
                            color: Color(0xFFD2D2D2),
                            fontSize: 13.83,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          fillColor: Color(0xFFF1F4FE),
                          filled: true,
                          hintText: 'Details',
                          hintStyle: TextStyle(
                            color: Color(0xFFD2D2D2),
                            fontSize: 13.83,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Notes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(9)),
                          fillColor: Color(0xFFF1F4FE),
                          filled: true,
                          hintText: 'Notes',
                          hintStyle: TextStyle(
                            color: Color(0xFFD2D2D2),
                            fontSize: 13.83,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                  "Save Changes",
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
}
