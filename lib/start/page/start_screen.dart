import 'package:e_commerce/create_account/page/create_account_screen.dart';
import 'package:e_commerce/login/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0.2,
                              blurRadius: 20,
                              blurStyle: BlurStyle.outer,
                              offset: const Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        width: 35.w,
                        height: 16.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
                        width: 35.w,
                        height: 16.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/start_logo.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.46.h),
                  Text(
                    'Shoppe',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 27.sp,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: -0.52,
                    ),
                  ),
                  SizedBox(height: 2.46.h),
                  SizedBox(
                    width: 66.40.w,
                    height: 7.27.h,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Beautiful eCommerce UI Kit for your online store',
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 17.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w300,
                        height: 1.9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen(),));
                  },
                  overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                  child: Container(
                    alignment: Alignment.center,
                    height: 7.51.h,
                    width: 89.33.w,
                    decoration: const BoxDecoration(
                      color: Color(0xff004CFF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Let's get started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF3F3F3),
                        fontSize: 21.5.sp,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.46.h),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                  child: Container(
                    alignment: Alignment.center,
                    height: 3.69.h,
                    width: 56.80.w,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Container(
                           child: Text(
                            "I already have an account",
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 15,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300,
                            ),
                                                   ),
                         ),
                        Container(
                          alignment: Alignment.center,
                          height: 3.69.h,
                          width: 3.69.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF004CFF),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 6.16.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
