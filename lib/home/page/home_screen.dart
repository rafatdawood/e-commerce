import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/category_details/page/category_details_screen.dart';
import 'package:e_commerce/favorites/manager/favorites_cubit.dart';
import 'package:e_commerce/home/manager/home_cubit.dart';
import 'package:e_commerce/product/page/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = HomeCubit();
  late FavoritesCubit favoritesCubit;

  @override
  void initState() {
    super.initState();
    cubit.getAllData();
    favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Text(
                    'Shop',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 28,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.28,
                    ),
                  ),
                  SizedBox(width: 19),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(59)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(59)),
                        fillColor: Color(0xFFF8F8F8),
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Color(0xFFD2D2D2),
                          fontSize: 13.83,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                            height: 130,
                            viewportFraction: 1,
                            autoPlay: true,
                            onPageChanged: (index, reason) =>
                                cubit.showImages(index),
                          ),
                        ),
                        SizedBox(height: 10),
                        buildIndicator(),
                      ],
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 21,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.21,
                      ),
                    ),
                    GridView.builder(
                      itemCount: cubit.categories['data']['data'].length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 9,
                          mainAxisSpacing: 6,
                          mainAxisExtent: 192,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) =>
                          buildGridCategories(index),
                    ),
                    Text(
                      'Products',
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 21,
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
                            crossAxisSpacing: 9,
                            mainAxisSpacing: 6,
                            mainAxisExtent: 350,
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
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
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
            dotHeight: 10,
            dotWidth: 10,
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
              padding: EdgeInsets.symmetric(horizontal: 6),
              alignment: Alignment.centerLeft,
              height: 32,
              child: Text(
                cubit.categories['data']['data'][index]['name'],
                style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 17,
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
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            offset: const Offset(2.0, 2.0),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10),
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
                  height: 181,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      width: 5,
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
                  top: 15,
                )
              ],
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  alignment: Alignment.centerLeft,
                  height: 32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          cubit.productsAndBanners['data']['products'][index]
                              ['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
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
                              fontSize: 17,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              height: 0.07,
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
          Radius.circular(10),
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
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w800,
                letterSpacing: 0.17,
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox(
        height: 18,
      );
    }
  }

  Widget discountPercentage(index) {
    if (cubit.productsAndBanners['data']['products'][index]['discount'] > 0) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        width: 39,
        height: 18,
        alignment: Alignment.center,
        child: Text(
          '-${cubit.productsAndBanners['data']['products'][index]['discount']}%',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
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
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
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
