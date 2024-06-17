import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List wishList = List.generate(
    5,
        (index) => {
      'id': index,
      'name': 'Lorem ipsum dolor sit amet consectetur.',
      'imageUrl': 'assets/images/welcome_1.jpg',
      'price': 17.00,
    },
  ).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Wishlist',
                  style: TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 28,
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
  }

  Widget buildWishItems(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        height: 109,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 129,
                  height: 109,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(wishList[index]['imageUrl']),
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
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/button_delete.svg',
                      width: 35,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 36,
                      child: Text(
                        maxLines: 2,
                        wishList[index]['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
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
                            '\$${wishList[index]['price']}',
                            style: TextStyle(
                              color: Color(0xFF202020),
                              fontSize: 18,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.18,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          child: InkWell(
                            onTap: (){},
                            child:
                            SvgPicture.asset('assets/icons/add_to_cart.svg'),
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
    if (wishList.isEmpty) {
      return Image.asset('assets/images/empty_wishlist.png');
    } else {
      return ListView.builder(
        itemCount: wishList.length,
        itemBuilder: (context, index) => buildWishItems(index),
      );
    }
  }
}
