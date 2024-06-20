import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 400,
              width: 100.w,
              child: Image.asset('assets/images/start_logo.jpg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'About Shoppe',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 28,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.28,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Text(
                    'Shoppe - Shopping UI kit" is likely a user interface (UI) kit designed to facilitate the development of e-commerce or shopping-related applications. UI kits are collections of pre-designed elements, components, and templates that developers and designers can use to create consistent and visually appealing user interfaces.',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 16,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Text(
                    'If you need help or you have any questions, feel free to contact me by email.',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 16,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Text(
                    'hello@mydomain.com',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 17,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.17,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
