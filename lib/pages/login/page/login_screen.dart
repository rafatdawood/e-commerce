import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../welcom/page/welcome_screen.dart';
import '../manager/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) => logic(state),
        child: Scaffold(
          body: ListView(children: [
            Container(
              height: 812.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bubbles_login_screen.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            S().login,
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 52.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.52,
                            ),
                          ),
                          // height: 7.51.h,
                          // width: 36.80.w,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                S().goodToSeeYouBack,
                                style: TextStyle(
                                  color: Color(0xFF202020),
                                  fontSize: 19.sp,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w300,
                                  height: 0.10,
                                ),
                              ),
                              // height: 4.31.h,
                              // width: 49.07.w,
                            ),
                            SizedBox(width: 5.w),
                            Image(
                              image: AssetImage('assets/images/heart.png'),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(59.r)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(59.r)),
                            fillColor: Color(0xffF8F8F8),
                            filled: true,
                            hintText: S().email,
                            hintStyle: TextStyle(
                              color: Color(0xFFD2D2D2),
                              fontSize: 13.83.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 17.h),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              obscureText: cubit.showPassword,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(59.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(59.r)),
                                fillColor: Color(0xffF8F8F8),
                                filled: true,
                                hintText: S().password,
                                suffixIcon: InkWell(
                                    onTap: () => cubit.togglePassword(),
                                    overlayColor: WidgetStateColor.transparent,
                                    child: cubit.showPassword
                                        ? Icon(Icons.visibility_off_outlined)
                                        : Icon(Icons.visibility_outlined)),
                                hintStyle: TextStyle(
                                  color: Color(0xFFD2D2D2),
                                  fontSize: 13.83.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 17.h),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 36.h),
                        InkWell(
                          onTap: () {},
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Text(
                              S().forgetPassword,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 15.sp,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    children: [
                      InkWell(
                        onTap: () => cubit.login(
                          password: passwordController.text,
                          email: emailController.text,
                        ),
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        child: Container(
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
                            S().login,
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
                        onTap: () {},
                        overlayColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Text(
                            S().createNewAccount,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 15.sp,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 67.h),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  logic(LoginState state) {
    if (state is LoginSuccessState) {
      Fluttertoast.showToast(msg: state.massage);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ));
    } else if (state is LoginFailureState) {
      Fluttertoast.showToast(msg: state.errorMassage);
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
