import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/pages/language/manager/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final cubit = LanguageCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50.w,
                      width: 50.w,
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
                          child: InkWell(
                            onTap: (){
                              print(PreferenceUtils.getString(PrefKeys.language));
                            },
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
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 18.h),
                          padding: EdgeInsets.symmetric(vertical: 7.h),
                          child: Text(
                            'Language',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.16,
                            ),
                          ),
                        ),
                        customRadio('English', 'en'),
                        SizedBox(height: 6.h),
                        customRadio('عربي', 'ar'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customRadio(String text, String value) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () => cubit.changeLanguage(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        height: 50.h,
        width: 400.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.r),
          color: cubit.language == value ? Color(0xFFE5EBFC) : Color(
              0xFFF8F8F8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(cubit.language == value
                ? 'assets/icons/check.svg'
                : 'assets/icons/check_empty.svg')
          ],
        ),
      ),
    );
  }
}
