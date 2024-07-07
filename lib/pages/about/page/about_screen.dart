import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50.h,
                width: 50.h,
                child: InkWell(
                  onTap: ()=>Navigator.pop(context),
                  overlayColor: WidgetStateColor.transparent,
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 400.h,
                      width: 375.w,
                      child: Image.asset('assets/images/start_logo.jpg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'About Shoppe',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 28.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.28,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          child: Text(
                            'Shoppe - Shopping UI kit" is likely a user interface (UI) kit designed to facilitate the development of e-commerce or shopping-related applications. UI kits are collections of pre-designed elements, components, and templates that developers and designers can use to create consistent and visually appealing user interfaces.',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 16.sp,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          child: Text(
                            'If you need help or you have any questions, feel free to contact me by email.',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 16.sp,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          child: Text(
                            'hello@mydomain.com',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 17.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.17,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
