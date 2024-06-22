import 'package:e_commerce/create_account/manager/create_account_cubit.dart';
import 'package:e_commerce/login/page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40.h,
                  child: Stack(
                    // clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Create \nAccount',
                          style: TextStyle(
                            color: Color(0xFF202020),
                            fontSize: 50,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.50,
                          ),
                        ),
                        height: 39.78.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/bubbles_create_account.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        child: Positioned(
                          top: 30.h,
                          left: 9.w,
                          child: InkWell(
                            onTap: () {},
                            overlayColor: WidgetStateColor.transparent,
                            child: Container(
                              width: 11.8.h,
                              height: 11.8.h,
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
              ),
              SizedBox(height: 3.94.h),
              Form(
                key: formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.33.w),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(59)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(59)),
                          fillColor: Color(0xffF8F8F8),
                          filled: true,
                          hintText: 'Name',
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
                      SizedBox(height: 8),
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
                      BlocBuilder<CreateAccountCubit, CreateAccountState>(
                        builder: (context, state) {
                          return TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: cubit.showPassword,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(59)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(59)),
                              fillColor: Color(0xffF8F8F8),
                              filled: true,
                              hintText: 'Password',
                              suffixIcon: InkWell(
                                  overlayColor: WidgetStateColor.transparent,
                                  onTap: () => cubit.togglePassword(),
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
                      IntlPhoneField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        disableLengthCheck: true,
                        dropdownIconPosition: IconPosition.trailing,
                        dropdownIcon: Icon(Icons.keyboard_arrow_down),
                        flagsButtonPadding: EdgeInsets.only(left: 5.33.w),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(59)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(59)),
                          fillColor: Color(0xffF8F8F8),
                          filled: true,
                          hintText: 'Your number',
                          hintStyle: TextStyle(
                            color: Color(0xFFD2D2D2),
                            fontSize: 13.83,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 1.85.h),
                        ),
                        languageCode: "en",
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6.40.h),
              Column(
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
                        "Done",
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    child: Container(
                      alignment: Alignment.center,
                      height: 3.20.h,
                      width: 12.w,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Text(
                        "Cancel",
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
              // SizedBox(height: 67),
            ],
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
