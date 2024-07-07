import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../generated/l10n.dart';
import '../../category_details/page/category_details_screen.dart';
import '../../product/page/product_screen.dart';
import '../manager/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = HomeCubit();

  @override
  void initState() {
    super.initState();
    cubit.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => cubit,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccessState) {
                return body();
              } else {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Column(
        children: [
          // Padding(
            // padding: const EdgeInsets.all(8.0),
            // child:
      Container(
              child: Row(
                children: [
                  Text(
                    S().shop,
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 28.sp,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.28,
                    ),
                  ),
                  SizedBox(width: 19.w),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(59.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(59.r)),
                        fillColor: Color(0xFFF8F8F8),
                        filled: true,
                        hintText: S().search,
                        hintStyle: TextStyle(
                          color: Color(0xFFD2D2D2),
                          fontSize: 13.83.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: cubit
                              .productsAndBanners['data']['banners'].length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            final image = cubit.productsAndBanners['data']
                                ['banners'][index]['image'];
                            return buildBanners(
                              image,
                              index,
                            );
                          },
                          options: CarouselOptions(
                            height: 130.h,
                            viewportFraction: 1,
                            autoPlay: true,
                            onPageChanged: (index, reason) =>
                                cubit.showImages(index),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        buildIndicator(),
                      ],
                    ),
                    Text(
                      S().categories,
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 21.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.21,
                      ),
                    ),
                    GridView.builder(
                      itemCount: cubit.categories['data']['data'].length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10.r),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 9.w,
                          mainAxisSpacing: 6.h,
                          mainAxisExtent: 192.h,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) =>
                          buildGridCategories(index),
                    ),
                    Text(
                      S().products,
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 21.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.21,
                      ),
                    ),
                    BlocListener<HomeCubit, HomeState>(
                      listener: (context, state) => logic(state),
                      child: GridView.builder(
                        itemCount:
                            cubit.productsAndBanners['data']['products'].length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 9.w,
                            mainAxisSpacing: 6.h,
                            mainAxisExtent: 350.h,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) => buildProducts(index),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBanners(image, int index) => Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        ),
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.fill,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: cubit.activeIndex,
        count: cubit.productsAndBanners['data']['banners'].length,
        effect: JumpingDotEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            dotColor: Color(0xFFC7D6FB),
            activeDotColor: Color(0xFF004CFF)),
      );

  Widget buildGridCategories(int index) {
    return Container(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => navToCategories(index),
        overlayColor: WidgetStateColor.transparent,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          cubit.categories['data']['data'][index]['image']),
                      fit: BoxFit.fitWidth),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              alignment: Alignment.centerLeft,
              height: 32.h,
              child: Text(
                cubit.categories['data']['data'][index]['name'],
                style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 17.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.17,
                ),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.2,
            blurRadius: 10.r,
            blurStyle: BlurStyle.outer,
            offset: const Offset(2.0, 2.0),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
    );
  }

  Widget buildProducts(index) {
    return Container(
      child: InkWell(
        onTap: () => navToProductScreen(index),
        overlayColor: WidgetStateColor.transparent,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 181.h,
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    border: Border.all(
                      width: 5.w,
                      style: BorderStyle.solid,
                      color: Color(0xFFF4F4F4),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(cubit.productsAndBanners['data']
                            ['products'][index]['image']),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  child: discountPercentage(index),
                  right: 0,
                  top: 15.w,
                )
              ],
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                  alignment: Alignment.centerLeft,
                  height: 32.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          cubit.productsAndBanners['data']['products'][index]
                              ['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            '\$${cubit.productsAndBanners['data']['products'][index]['price'].toString()}',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 17.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.17,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              cubit.removeOrAdd(
                                  cubit.productsAndBanners['data']['products']
                                          [index]['id']
                                      .toString(),
                                  index);
                            },
                            overlayColor: WidgetStateColor.transparent,
                            child: isLiked(index),
                          ),
                        ],
                      ),
                      discount(index),
                    ],
                  )),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
    );
  }

  Widget isLiked(index) {
    if (cubit.productsAndBanners['data']['products'][index]['in_favorites']) {
      return SvgPicture.asset('assets/icons/like_true.svg');
    } else {
      return SvgPicture.asset('assets/icons/like_false.svg');
    }
  }

  Widget discount(index) {
    if (cubit.productsAndBanners['data']['products'][index]['discount'] > 0) {
      return SizedBox(
        child: Row(
          children: [
            Text(
              '\$${cubit.productsAndBanners['data']['products'][index]['old_price']}',
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
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 18.h,
      );
    }
  }

  Widget discountPercentage(index) {
    if (cubit.productsAndBanners['data']['products'][index]['discount'] > 0) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        width: 39.w,
        height: 18.h,
        alignment: Alignment.center,
        child: Text(
          '-${cubit.productsAndBanners['data']['products'][index]['discount']}%',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
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
      );
    } else {
      return SizedBox();
    }
  }

  logic(HomeState state) {
    if (state is HomeAddOrRemove) {
      Fluttertoast.showToast(msg: state.massage);
    }
  }

  Future<void> navToProductScreen(index) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
            id: cubit.productsAndBanners['data']['products'][index]['id']
                .toString()),
      ),
    );
    cubit.edit(res);
  }

  Future<void> navToCategories(index) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetailsScreen(
          id: cubit.categories['data']['data'][index]['id'].toString(),
        ),
      ),
    );
    cubit.edit(res);
  }
}
