import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Map notifications = {
    "status": true,
    "message": null,
    "data": {
      "current_page": 1,
      "data": [
        {"id": 65, "title": "بسم الله الرحمن الرحيم", "message": "test"},
        {"id": 64, "title": "aa", "message": "a"},
        {"id": 63, "title": "a", "message": "a"},
        {"id": 62, "title": "ش", "message": "ش"},
        {
          "id": 61,
          "title": "بسم الله الرحمن الرحيم",
          "message": "بسم الله الرحمن الرحيم"
        },
        {"id": 49, "title": "test", "message": "test"},
        {
          "id": 42,
          "title": "The biggest discount starts soon..",
          "message":
              "Hurry up to get biggest discount starts now for 5 days only"
        },
        {"id": 41, "title": "promocode", "message": "Mahdi70"},
        {"id": 40, "title": "promocode", "message": "off50"},
        {
          "id": 16,
          "title": "Notification test",
          "message": "The biggest discount starts soon.."
        },
        {
          "id": 15,
          "title": "Notification test",
          "message": "discount 20% for any product"
        },
        {
          "id": 10,
          "title": "Notification 10",
          "message":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s"
        }
      ],
      "first_page_url":
          "https://student.valuxapps.com/api/notifications?page=1",
      "from": 1,
      "last_page": 1,
      "last_page_url": "https://student.valuxapps.com/api/notifications?page=1",
      "next_page_url": null,
      "path": "https://student.valuxapps.com/api/notifications",
      "per_page": 35,
      "prev_page_url": null,
      "to": 12,
      "total": 12
    }
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 50.w,
                width: 50.w,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  overlayColor: WidgetStateColor.transparent,
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 28.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.28,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 18.h),
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.16,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: notifications['data']['data'].length,
                  itemBuilder: (context, index) => buildNotifications(index),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotifications(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notifications['data']['data'][index]['title'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.sp,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                notifications['data']['data'][index]['message'],
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
