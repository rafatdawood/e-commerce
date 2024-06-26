import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Settings',
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
                    'Your Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.16,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 105,
                      width: 105,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.07),
                              offset: Offset(0, 3),
                              spreadRadius: 2,
                              blurRadius: 1)
                        ],
                      ),
                    ),
                    Positioned(
                      top: 6.5,
                      right: 6.5,
                      child: Container(
                        height: 92,
                        width: 92,
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                          width: 30,
                          height: 30,
                          child: SvgPicture.asset('assets/icons/edit_image.svg')),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
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
                          hintText: 'Email',
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
                          hintText: 'Password',
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
