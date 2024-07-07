import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../login/page/login_screen.dart';
import '../manager/create_account_cubit.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final cubit = CreateAccountCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<CreateAccountCubit, CreateAccountState>(
        listener: (context, state) => logic(state),
        child:Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              height:  812.h,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 353.h,
                      child:
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  S().createAccount,
                                  style: TextStyle(
                                    color: Color(0xFF202020),
                                    fontSize: 50.sp,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                                height: 308.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/bubbles_create_account.jpg'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Container(
                                child: Positioned(
                                  bottom: 0.h,
                                  left: 30.w,
                                  child: InkWell(
                                    onTap: () {},
                                    overlayColor: WidgetStateColor.transparent,
                                    child: Container(
                                      width: 90.w,
                                      height: 90.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/upload_photo.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Form(
                      key: formKey,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        height: 204.h,
                        child: Column(
                          children: [
                            Container(
                              height: 45.h,
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(59.r)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(59.r)),
                                  fillColor: Color(0xffF8F8F8),
                                  filled: true,
                                  hintText: S().name,
                                  hintStyle: TextStyle(
                                    color: Color(0xFFD2D2D2),
                                    fontSize: 13.83.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              height: 45.h,
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(59.r)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
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
                                      horizontal: 20.w, vertical: 10.h),
                                ),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            BlocBuilder<CreateAccountCubit, CreateAccountState>(
                              builder: (context, state) {
                                return Container(
                                  height: 45.h,
                                  child: TextFormField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
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
                                          overlayColor: WidgetStateColor.transparent,
                                          onTap: () => cubit.togglePassword(),
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
                                          horizontal: 20.w, vertical: 10.h),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              height: 45.h,
                              child: IntlPhoneField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                disableLengthCheck: true,
                                dropdownIconPosition: IconPosition.trailing,
                                dropdownIcon: Icon(Icons.keyboard_arrow_down),
                                flagsButtonPadding: EdgeInsets.only(left: 20.w),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(59.r)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(59.r)),
                                  fillColor: Color(0xffF8F8F8),
                                  filled: true,
                                  hintText: S().yourNumber,
                                  hintStyle: TextStyle(
                                    color: Color(0xFFD2D2D2),
                                    fontSize: 13.83.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                ),
                                languageCode: "en",
                                onChanged: (phone) {
                                  print(phone.completeNumber);
                                },
                                onCountryChanged: (country) {
                                  print('Country changed to: ' + country.name);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => cubit.register(
                              email: emailController.text,
                              name: nameController.text,
                              password: passwordController.text,
                              phone: phoneController.text),
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          child: Container(
                            // margin: EdgeInsets.symmetric(vertical: 20.h),
                            alignment: Alignment.center,
                            height: 61.h,
                            width: 335.w,
                            decoration: BoxDecoration(
                              color: Color(0xff004CFF),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.r),
                              ),
                            ),
                            child: Text(
                            S().done,
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
                    SizedBox(height: 20.h),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          child: Container(
                            alignment: Alignment.center,

                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Text(
                              S().cancel,
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
                        SizedBox(height: 20.h),
                        // SizedBox(height: ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }

  logic(CreateAccountState state) {
    if (state is CreateAccountSuccessState) {
      Fluttertoast.showToast(msg: state.massage);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    } else if (state is CreateAccountFailureState) {
      Fluttertoast.showToast(msg: state.errorMassage);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }
}
