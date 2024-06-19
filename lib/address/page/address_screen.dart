import 'package:e_commerce/add_addres/page/add_address_screen.dart';
import 'package:e_commerce/edit_addres/page/edit_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Map addressData = {
    "status": true,
    "message": null,
    "data": {
      "current_page": 1,
      "data": [
        {
          "id": 4326,
          "name": "Work",
          "city": "Giza",
          "region": "Haram",
          "details": "Tersa",
          "notes": "Work addres",
          "latitude": 30.061686300000001637044988456182181835174560546875,
          "longitude": 31.326008800000000320551407639868557453155517578125
        },
        {
          "id": 3821,
          "name": "home",
          "city": "cairo",
          "region": "nasr city",
          "details": "zaker hussein street",
          "notes": "notes",
          "latitude": 30.061686300000001637044988456182181835174560546875,
          "longitude": 31.326008800000000320551407639868557453155517578125
        }
      ],
      "first_page_url": "https://student.valuxapps.com/api/addresses?page=1",
      "from": 1,
      "last_page": 1,
      "last_page_url": "https://student.valuxapps.com/api/addresses?page=1",
      "next_page_url": null,
      "path": "https://student.valuxapps.com/api/addresses",
      "per_page": 35,
      "prev_page_url": null,
      "to": 2,
      "total": 2
    }
  };

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 18),
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        'Shipping Address',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.16,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(bottom: 18),
                      child: InkWell(
                        overlayColor: WidgetStateColor.transparent,
                        onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => AddAddressScreen(),)),
                        child: SvgPicture.asset('assets/icons/more.svg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: addressData['data']['data'].length,
                itemBuilder: (context, index) => buildAddress(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAddress(int index) {
    return Container(
      height: 250,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: Offset(0.2, 0.2),
            blurRadius: 3,
            spreadRadius: 3,
          )
        ],
        border: Border.all(
          color: Colors.white,
          width: 3,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Name: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${addressData['data']['data'][index]['name']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'City: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${addressData['data']['data'][index]['city']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Region: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${addressData['data']['data'][index]['region']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Details: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${addressData['data']['data'][index]['details']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Notes: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.16,
                ),
              ),
              Text(
                '${addressData['data']['data'][index]['notes']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                overlayColor: WidgetStateColor.transparent,
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 128,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF81140),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Text(
                    'Delete',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF3F3F3),
                      fontSize: 16,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w300,
                      height: 0.10,
                    ),
                  ),
                ),
              ),
              InkWell(
                overlayColor: WidgetStateColor.transparent,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAddressScreen(),
                    )),
                child: Container(
                  alignment: Alignment.center,
                  width: 128,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFF004CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Text(
                    'Edit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF3F3F3),
                      fontSize: 16,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w300,
                      height: 0.10,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
