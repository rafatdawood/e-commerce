import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/pages/create_account/page/create_account_screen.dart';
import 'package:e_commerce/pages/login/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    print(PreferenceUtils.getString(PrefKeys.apiToken));
    print(PreferenceUtils.getBool(PrefKeys.loggedIn));
    PreferenceUtils.setString(PrefKeys.language, 'en');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
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
                          width: 134.w,
                          height: 134.w,
                        ),
                        Container(
                          alignment: Alignment.center,
                          clipBehavior: Clip.antiAlias,
                          width: 134.w,
                          height: 134.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/start_logo.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Shoppe',
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 52.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: -0.52,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      width: 249.w,
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
                      height: 61.h,
                      width: 335.w,
                      decoration: const BoxDecoration(
                        color: Color(0xff004CFF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Text(
                        S().letsGetStarted,
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
                  SizedBox(height: 24.h),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                    child: Container(
                      alignment: Alignment.center,
                      height:30.h,
                      width: 230.w,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Expanded(
                             child: Container(
                               child: Text(
                                S().iAlreadyHaveAnAccount,
                                style: TextStyle(
                                  color: Color(0xFF202020),
                                  fontSize: 15.sp,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w300,
                                ),
                                                       ),
                             ),
                           ),
                           Container(
                            alignment: Alignment.center,
                            height: 30.w,
                            width: 30.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF004CFF),
                            ),
                            child: Icon(
                              size: 18.sp,
                              Icons.arrow_forward_sharp,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 55.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
