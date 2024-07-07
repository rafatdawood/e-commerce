import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../product/page/product_screen.dart';
import '../manager/favorites_cubit.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final cubit = FavoritesCubit();

  @override
  void initState() {
    super.initState();
    cubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return BlocListener<FavoritesCubit, FavoritesState>(
              listener: (context, state) => logic(state),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Container(
                        child: Text(
                            S().wishList,
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
                    Expanded(
                      child: checkIsEmpty(),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildWishItems(index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.w),
      child: Container(
        height: 109.h,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 129.w,
                  height: 109.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(cubit.wishList['data']['data']
                            [index]['product']['image']),
                        fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0.2,
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer,
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(9.r),
                    border: Border.all(
                      color: Colors.white,
                      width: 3.w,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.r,
                  left: 10.w,
                  child: InkWell(
                    onTap: () => cubit.delete(
                        cubit.wishList['data']['data'][index]['id'].toString(),
                        index),
                    child: SvgPicture.asset(
                      'assets/icons/button_delete.svg',
                      width: 35.w,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 36.h,
                      child: Text(
                        maxLines: 2,
                        cubit.wishList['data']['data'][index]['product']
                            ['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Text(
                            '\$${cubit.wishList['data']['data'][index]['product']['price']}',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 18.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.18,
                            ),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          child: InkWell(
                            onTap: () => cubit.addToCart(cubit.wishList['data']
                                    ['data'][index]['product']['id']
                                .toString()),
                            overlayColor: WidgetStateColor.transparent,
                            child: SvgPicture.asset(
                                'assets/icons/add_to_cart.svg'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkIsEmpty() {
    if (cubit.wishList['data']['data'].isEmpty) {
      return Image.asset('assets/images/empty_wishlist.png');
    } else {
      return ListView.builder(
        itemCount: cubit.wishList['data']['data'].length,
        itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                      id: cubit.wishList['data']['data'][index]['product']
                          ['id'].toString()),
                )),
            overlayColor: WidgetStateColor.transparent,
            child: buildWishItems(index)),
      );
    }
  }

  logic(FavoritesState state) {
    if (state is FavoritesDelete) {
      Fluttertoast.showToast(msg: state.message);
    } else if (state is FavoritesAddSuccess) {
      Fluttertoast.showToast(msg: state.message);
    }
  }
}
