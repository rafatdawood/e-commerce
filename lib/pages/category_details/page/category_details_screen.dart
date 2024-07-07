import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../product/page/product_screen.dart';
import '../manager/category_cubit.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  final cubit = CategoryCubit();

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
        child: BlocListener<CategoryCubit, CategoryState>(
          listener: (context, state) => logic(state),
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategorySuccessState) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 50.w,
                        height: 50.w,
                        child: InkWell(
                            onTap: () => Navigator.pop(context, cubit.data),
                            overlayColor: WidgetStateColor.transparent,
                            child: Icon(Icons.arrow_back_ios_new_outlined)),
                      ),
                      Expanded(
                        child: Container(
                          child: GridView.builder(
                            itemCount:
                                cubit.categoryDetails['data']['data'].length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 9,
                                    mainAxisSpacing: 6,
                                    mainAxisExtent: 350,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) =>
                                buildProducts(index),
                          ),
                        ),
                      ),
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
      ),
    );
  }

  Widget buildProducts(index) {
    return Container(
      child: InkWell(
        onTap: () => navToProductScreen(index),
        child: Column(
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
                    image: NetworkImage(
                        cubit.categoryDetails['data']['data'][index]['image']),
                    fit: BoxFit.fill),
              ),
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
                          cubit.categoryDetails['data']['data'][index]['name'],
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
                            '\$${cubit.categoryDetails['data']['data'][index]['price'].toString()}',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 17.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0.07,
                              letterSpacing: -0.17,
                            ),
                          ),
                          BlocBuilder<CategoryCubit, CategoryState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  cubit.removeOrAdd(
                                      cubit.categoryDetails['data']['data']
                                              [index]['id']
                                          .toString(),
                                      index);
                                },
                                overlayColor: WidgetStateColor.transparent,
                                child: isLiked(index),
                              );
                            },
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
    if (cubit.categoryDetails['data']['data'][index]['in_favorites']) {
      return SvgPicture.asset('assets/icons/like_true.svg');
    } else {
      return SvgPicture.asset('assets/icons/like_false.svg');
    }
  }

  Widget discount(index) {
    if (cubit.categoryDetails['data']['data'][index]['discount'] > 0) {
      return SizedBox(
        child: Row(
          children: [
            Text(
              '\$${cubit.categoryDetails['data']['data'][index]['old_price']}',
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
                '-${cubit.categoryDetails['data']['data'][index]['discount']}%',
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
        ),
      );
    } else {
      return SizedBox(
        height: 18.h,
      );
    }
  }

  logic(CategoryState state) {
    if (state is CategoryAddOrRemove) {
      Fluttertoast.showToast(msg: state.massage);
    }
  }

  Future<void>navToProductScreen(index) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
            id: cubit.categoryDetails['data']['data'][index]['id']
                .toString()),
      ),
    );
    cubit.edit(res);
  }
}
