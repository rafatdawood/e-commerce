import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/login/manager/login_cubit.dart';
import 'package:e_commerce/welcom/page/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.33.w),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bubbles_login_screen.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            width: 100.w,
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xFF202020),
                            fontSize: 52,
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
                              'Good to see you back!',
                              style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 19,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300,
                                height: 0.10,
                              ),
                            ),
                            // height: 4.31.h,
                            // width: 49.07.w,
                          ),
                          SizedBox(width: 2),
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
                SizedBox(height: 2.46.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.33.w),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(59)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(59)),
                          fillColor: Color(0xffF8F8F8),
                          filled: true,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Color(0xFFD2D2D2),
                            fontSize: 13.83,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 1.85.h),
                        ),
                      ),
                      SizedBox(height: 0.99.h),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            obscureText: cubit.showPassword,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(59)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(59)),
                              fillColor: Color(0xffF8F8F8),
                              filled: true,
                              hintText: 'Password',
                              suffixIcon: InkWell(
                                  onTap: () => cubit.togglePassword(),
                                  overlayColor: WidgetStateColor.transparent,
                                  child: cubit.showPassword
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility_outlined)),
                              hintStyle: TextStyle(
                                color: Color(0xFFD2D2D2),
                                fontSize: 13.83,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 1.85.h),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 0.99.h),
                      InkWell(
                        onTap: () {},
                        overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                        child: Container(
                          alignment: Alignment.center,
                          height: 3.69.h,
                          width: 61.33.w,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Text(
                            "Forget Password ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 15,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.46.h),
                Column(
                  children: [
                    InkWell(
                      onTap: () =>
                          cubit.login(
                            password: passwordController.text,
                            email: emailController.text,
                          ),
                      overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent),
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
                        child: const Text(
                          "Login",
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
                    SizedBox(height: 2.46.h),
                    InkWell(
                      onTap: () {},
                      overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                      child: Container(
                        alignment: Alignment.center,
                        height: 3.69.h,
                        width: 61.33.w,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text(
                          "Create New account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF202020),
                            fontSize: 15,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.16.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  logic(LoginState state) {
    if (state is LoginSuccessState) {
      Fluttertoast.showToast(msg: state.massage);
      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
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
