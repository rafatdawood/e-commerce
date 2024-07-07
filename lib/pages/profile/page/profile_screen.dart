import 'package:e_commerce/pages/profile/manager/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final cubit = ProfileCubit();

  @override
  void initState() {
    // TODO: implement initState
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
          child: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => current is ProfileSuccessState,
            builder: (context, state) {
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 50.h,
                              width: 50.h,
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                overlayColor: WidgetStateColor.transparent,
                                child: Icon(Icons.arrow_back_ios_new_outlined),
                              ),
                            ),
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
                            Container(
                              margin: EdgeInsets.only(bottom: 18.h),
                              padding: EdgeInsets.symmetric(vertical: 7.h),
                              child: Text(
                                'Your Profile',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.16,
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 105.w,
                                  width: 105.w,
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
                                  top: 6.5.h,
                                  right: 6.5.w,
                                  child: Container(
                                    height: 92.w,
                                    width: 92.w,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                      width: 30.w,
                                      height: 30.w,
                                      child: SvgPicture.asset(
                                          'assets/icons/edit_image.svg')),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: cubit.name,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                          BorderRadius.circular(9.r)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                          BorderRadius.circular(9.r)),
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
                                  TextField(
                                    enabled: false,
                                    controller: cubit.email,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                          BorderRadius.circular(9.r)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                          BorderRadius.circular(9.r)),
                                      fillColor: Color(0xFFF1F4FE),
                                      filled: true,
                                      hintText: 'Email',
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
                                  TextField(
                                    controller: cubit.phone,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                          BorderRadius.circular(9.r)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                          BorderRadius.circular(9.r)),
                                      fillColor: Color(0xFFF1F4FE),
                                      filled: true,
                                      hintText: 'Phone',
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
                          ],
                        ),
                        BlocListener<ProfileCubit, ProfileState>(
                          listener: (context, state) => logic(state),
                          child: InkWell(
                            onTap: () => cubit.saveChanges(),
                            overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20.h),
                              alignment: Alignment.center,
                              height: 61.h,
                              width: 336.w,
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
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  logic(state) {
    if(state is ProfileEditSuccessState){
      Fluttertoast.showToast(msg: state.massage);
    }else if(state is ProfileEditFailureState){
      Fluttertoast.showToast(msg: state.errorMassage);
    }
  }
}
