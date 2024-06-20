import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String language = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: Color(0xFF202020),
                      fontSize: 28,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.28,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 18),
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    'Language',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.16,
                    ),
                  ),
                ),
                customRadio('English', 'en'),
                SizedBox(height: 6),
                customRadio('Arabic', 'ar'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customRadio(String text, String value) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () {
        setState(() {
          language = value;
          print(language);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 50,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: language == value ? Color(0xFFE5EBFC) : Color(0xFFF8F8F8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(language == value
                ? 'assets/icons/check.svg'
                : 'assets/icons/check_empty.svg')
          ],
        ),
      ),
    );
  }
}
