import 'package:e_commerce/category_details/manager/category_cubit.dart';
import 'package:e_commerce/product/page/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.id = widget.id;
    cubit.getData();
  }

  final cubit = CategoryCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if(state is CategorySuccessState){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GridView.builder(
                  itemCount: cubit.categoryDetails['data']['data'].length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 9,
                      mainAxisSpacing: 6,
                      mainAxisExtent: 350,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => buildProducts(index),
                ),
              );
            }else{
              return Center(child: CircularProgressIndicator.adaptive(),);
            }

          },
        ),
      ),
    );
  }

  Widget buildProducts(index) {
    return Container(
      child: InkWell(
      onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) => ProductScreen(id: cubit.categoryDetails['data']['data'][index]['id'].toString()),)),
        child: Column(
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
                    image: NetworkImage(
                        cubit.categoryDetails['data']['data'][index]['image']),
                    fit: BoxFit.fill),
              ),
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
                          cubit.categoryDetails['data']['data'][index]['name'],
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
                            '\$${cubit
                                .categoryDetails['data']['data'][index]['price']
                                .toString()}',
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
                            onTap: () {},
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
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w800,
                letterSpacing: 0.17,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              width: 39,
              height: 18,
              alignment: Alignment.center,
              child: Text(
                '-${cubit.categoryDetails['data']['data'][index]['discount']}%',
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
}
