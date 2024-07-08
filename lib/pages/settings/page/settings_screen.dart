import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../about/page/about_screen.dart';
import '../../address/page/address_screen.dart';
import '../../f_a_qs/page/f_a_qs_screen.dart';
import '../../language/page/language_screen.dart';
import '../../notifications/page/notifications_screen.dart';
import '../../profile/page/profile_screen.dart';
import '../../start/page/start_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S().setting,
                style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 28.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.28,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 40.h),
                    Text(
                      S().personal,
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 20.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProfileScreen(),)),
                      overlayColor: WidgetStateColor.transparent,
                      child: Container(
                        width: 334.92.w,
                        height: 42.50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S().profile,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AddressScreen(),)),
                      overlayColor: WidgetStateColor.transparent,
                      child: Container(
                        width: 334.92.w,
                        height: 42.50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S().shipping_address,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 40.h),
                    Text(
                      S().account,
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 20.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => LanguageScreen(),)),
                      overlayColor: WidgetStateColor.transparent,
                      child: Container(
                        width: 334.92.w,
                        height: 42.50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S().language,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    PreferenceUtils.getString(
                                        PrefKeys.language) == 'en' ? 'English':'عربي',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                                ),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => NotificationsScreen(),)),
                      overlayColor: WidgetStateColor.transparent,
                      child: Container(
                        width: 334.92.w,
                        height: 42.50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S().notifications,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => FAQsScreen(),)),
                      overlayColor: WidgetStateColor.transparent,
                      child: Container(
                        width: 334.92.w,
                        height: 42.50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S().faqs,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AboutScreen(),)),
                      overlayColor: WidgetStateColor.transparent,
                      child: Container(
                        width: 334.92.w,
                        height: 42.50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S().about,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 30.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-Commeerce',
                          style: TextStyle(
                            color: Color(0xFF202020),
                            fontSize: 20.sp,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        InkWell(
                          onTap: () => logout(),
                          child: Text(
                            '${S().version} 1.0 June, 2024',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 15.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  logout() {
    AppDio.post(endpoint: EndPoints.logout,).then((val) {
      PreferenceUtils.setString(PrefKeys.apiToken, '');
      PreferenceUtils.setBool(PrefKeys.loggedIn, false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StartScreen(),));
    });
  }
}
