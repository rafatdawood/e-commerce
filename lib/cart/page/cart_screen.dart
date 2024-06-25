import 'package:e_commerce/add_addres/page/add_address_screen.dart';
import 'package:e_commerce/cart/manager/cart_cubit.dart';
import 'package:e_commerce/core/utils.dart';
import 'package:e_commerce/paying/page/paying_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getData();
  }

  final cubit = CartCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        'Cart',
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
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Shipping Address',
                              style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.14,
                              ),
                            ),
                            SizedBox(
                              width: 237,
                              height: 60,
                              child: Text(
                                cubit.addresses['data']['data'].isNotEmpty
                                    ? '${cubit.addresses['data']['data'][cubit.addressesIndex]['name']}\n${cubit.addresses['data']['data'][cubit.addressesIndex]['city']}-${cubit.addresses['data']['data'][cubit.addressesIndex]['region']}-${cubit.addresses['data']['data'][cubit.addressesIndex]['details']}\n${cubit.addresses['data']['data'][cubit.addressesIndex]['notes']}'
                                    : 'No Addresses',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 32,
                          child: InkWell(
                            onTap: () => navToAddresses(),
                            child: SvgPicture.asset(
                                'assets/icons/button_edit.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Payment Method',
                              style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.14,
                              ),
                            ),
                            SizedBox(
                              width: 237,
                              height: 30,
                              child: Text(
                                cubit.payment[cubit.paymentIndex]['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 32,
                          child: InkWell(
                            onTap: () => Utils.showSheet(context,
                                child: buildCustomPicker(), onClicked: () {
                              Navigator.pop(context);
                              print(cubit.paymentIndex);
                            }),
                            child: SvgPicture.asset(
                                'assets/icons/button_edit.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocListener<CartCubit, CartState>(
                    listener: (context, state) => deleteItems(state),
                    child: Expanded(
                      child: checkIsEmpty(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildCartItems(index) {
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
                        image: NetworkImage(cubit.cartsList['data']
                            ['cart_items'][index]['product']['image']),
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
                    onTap: () => cubit.deleteItem(
                        cubit.cartsList['data']['cart_items'][index]['id']
                            .toString(),
                        index),
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
                        cubit.cartsList['data']['cart_items'][index]['product']
                            ['name'],
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
                            '\$${cubit.cartsList['data']['cart_items'][index]['product']['price']}',
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
                          width: 109,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                overlayColor: WidgetStateColor.transparent,
                                onTap: () => cubit.decreaseQuantity(
                                    cubit.cartsList['data']['cart_items'][index]
                                            ['id']
                                        .toString(),
                                    cubit.cartsList['data']['cart_items'][index]
                                        ['quantity'],
                                    index),
                                child:
                                    SvgPicture.asset('assets/icons/less.svg'),
                              ),
                              Container(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  '${cubit.cartsList['data']['cart_items'][index]['quantity']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.16,
                                  ),
                                ),
                                width: 37,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xffE5EBFC)),
                              ),
                              InkWell(
                                onTap: () => cubit.increaseQuantity(
                                    cubit.cartsList['data']['cart_items'][index]
                                            ['id']
                                        .toString(),
                                    cubit.cartsList['data']['cart_items'][index]
                                        ['quantity'],
                                    index),
                                overlayColor: WidgetStateColor.transparent,
                                child:
                                    SvgPicture.asset('assets/icons/more.svg'),
                              ),
                            ],
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
    if (cubit.cartsList['data']['cart_items'].isEmpty) {
      return Image.asset('assets/images/empty_cart.png');
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cubit.cartsList['data']['cart_items'].length,
              itemBuilder: (context, index) => buildCartItems(index),
            ),
          ),
          Container(
            height: 100,
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 18,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.18,
                      ),
                    ),
                    Text(
                      '\$${cubit.cartsList['data']['total'].toInt()}',
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 18,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.18,
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () => cubit.buyNow(),
                  overlayColor: WidgetStateColor.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFF004CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    width: 128,
                    height: 40,
                    child: Text(
                      'Buy now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF3F3F3),
                        fontSize: 16,
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
      );
    }
  }

  deleteItems(CartState state) {
    if (state is CartDeleteSuccess) {
      Fluttertoast.showToast(msg: state.massage);
    } else if (state is CartCounter) {
      Fluttertoast.showToast(msg: state.message);
    }else if(state is CartAddOrderSuccess){
      Fluttertoast.showToast(msg: state.message);
    }
  }


  navToAddresses() async {
    if (cubit.addresses['data']['data'].isEmpty) {
      final res = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddAddressScreen(),
          ));
      cubit.edit(res);
    } else {}
  }

  Widget buildCustomPicker() {
    return SizedBox(
      height: 300,
      child: CupertinoPicker(
        children: Utils.modelBuilder(
          cubit.payment,
          (index, value) {
            final isSelected = cubit.paymentIndex == index;
            final color = isSelected ? Colors.pink : Colors.black;
            return Center(
              child: Text(
                value['name'],
                style: TextStyle(color: color, fontSize: 24),
              ),
            );
          },
        ),
        itemExtent: 64,
        onSelectedItemChanged: (index) => cubit.editAddressesIndex(index),
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
          background: Colors.pink.withOpacity(0.12),
        ),
        diameterRatio: 0.7,
        looping: true,
      ),
    );
  }
}
