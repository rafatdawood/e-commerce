import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../generated/l10n.dart';
import '../manager/product_cubit.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.id});

  final String id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final cubit = ProductCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.id = widget.id;
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductSuccessState) {
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 439.h,
                              width: 375.w,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CarouselSlider.builder(
                                    itemCount: cubit
                                        .productData['data']['images'].length,
                                    itemBuilder: (BuildContext context,
                                        int index, int realIndex) {
                                      final image = cubit.productData['data']
                                          ['images'][index];
                                      return buildImage(
                                        image,
                                        index,
                                      );
                                    },
                                    options: CarouselOptions(
                                      height: 439.h,
                                      viewportFraction: 1,
                                      autoPlay: true,
                                      enableInfiniteScroll: true,
                                      onPageChanged: (index, reason) =>
                                          cubit.showImages(index),
                                    ),
                                  ),
                                  Positioned(
                                    child: buildIndicator(),
                                    bottom: 10.h,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 50.h,
                              width: 50.h,
                              child: InkWell(
                                onTap: ()=>Navigator.pop(context,cubit.data),
                                overlayColor: WidgetStateColor.transparent,
                                child: Icon(Icons.arrow_back_ios_new_outlined),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  '\$${cubit.productData['data']['price']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26.sp,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.26,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                              ),
                              discount(),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15.h),
                                width: 335.w,
                                height: 62.h,
                                child: Text(
                                  cubit.productData['data']['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                S().description,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 26.sp,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.26,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                width: 375.w,
                                child: Text(
                                  cubit.productData['data']['description'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 2.5.h),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                    BlocListener<ProductCubit, ProductState>(
                      listener: (context, state) => logic(state),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        width: 375.w,
                        height: 84.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.removeOrAdd(
                                    cubit.productData['data']['id'].toString());
                              },
                              overlayColor: WidgetStateColor.transparent,
                              child: isLiked(),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () => cubit.addToCard(
                                        cubit.productData['data']['id']),
                                    overlayColor: WidgetStateColor.transparent,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF202020),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(11.r),
                                        ),
                                      ),
                                      width: 128.w,
                                      height: 40.h,
                                      child: Text(
                                        S().addToCart,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFF3F3F3),
                                          fontSize: 16.sp,
                                          fontFamily: 'Nunito Sans',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    overlayColor: WidgetStateColor.transparent,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF004CFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(11.r),
                                        ),
                                      ),
                                      width: 128.w,
                                      height: 40.h,
                                      child: Text(
                                        S().buyNow,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFF3F3F3),
                                          fontSize: 16.sp,
                                          fontFamily: 'Nunito Sans',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildImage(
    image,
    int index,
  ) =>
      Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Image(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
          ],
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: cubit.activeIndex,
        count: cubit.productData['data']['images'].length,
        effect: ExpandingDotsEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            dotColor: Color(0xFF707070),
            activeDotColor: Color(0xFF004BFF)),
      );

  Widget isLiked() {
    if (cubit.productData['data']['in_favorites']) {
      return SvgPicture.asset('assets/icons/like_true.svg');
    } else {
      return SvgPicture.asset('assets/icons/like_false.svg');
    }
  }

  Widget discount() {
    if (cubit.productData['data']['discount'] > 0) {
      return Row(
        children: [
          Text(
            '\$${cubit.productData['data']['old_price']}',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              decorationColor: Color(0xFFF1AEAE),
              color: Color(0xFFF1AEAE),
              fontSize: 14.sp,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w800,
              letterSpacing: 0.17,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            width: 39.w,
            height: 18.h,
            alignment: Alignment.center,
            child: Text(
              '-${cubit.productData['data']['discount']}%',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                height: 0.10,
                letterSpacing: -0.13,
              ),
            ),
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.00, 0.00),
                end: Alignment(1, 0),
                colors: [Color(0xFFFF5790), Color(0xFFF81140)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  topRight: Radius.circular(5.r),
                  bottomLeft: Radius.circular(5.r),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  logic(ProductState state) {
    if (state is ProductAddSuccess) {
      Fluttertoast.showToast(msg: state.massage);
    }
  }
}
