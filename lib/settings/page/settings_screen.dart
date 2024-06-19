import 'package:e_commerce/address/page/address_screen.dart';
import 'package:e_commerce/profile/page/profile_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                color: Color(0xFF202020),
                fontSize: 28,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.28,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Personal',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen(),)),
                    overlayColor: WidgetStateColor.transparent,
                    child: Container(
                      width: 334.92,
                      height: 42.50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => AddressScreen(),)),
                    overlayColor: WidgetStateColor.transparent,
                    child: Container(
                      width: 334.92,
                      height: 42.50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 40),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: (){},
                    overlayColor: WidgetStateColor.transparent,
                    child: Container(
                      width: 334.92,
                      height: 42.50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Language',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  'English',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: (){},
                    overlayColor: WidgetStateColor.transparent,
                    child: Container(
                      width: 334.92,
                      height: 42.50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: (){},
                    overlayColor: WidgetStateColor.transparent,
                    child: Container(
                      width: 334.92,
                      height: 42.50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'FAQs',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: (){},
                    overlayColor: WidgetStateColor.transparent,
                    child: Container(
                      width: 334.92,
                      height: 42.50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'About E-Commerce App',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'E-Commeerce',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Version 1.0 June, 2024',
                        style: TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
