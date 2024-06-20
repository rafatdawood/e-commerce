import 'package:flutter/material.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  Map fAQsData = {
    "status": true,
    "message": null,
    "data": {
      "current_page": 1,
      "data": [
        {
          "id": 6,
          "question": "could I pay via cash on delivery ?",
          "answer": "Yes, you can pay on delivery."
        },
        {
          "id": 1,
          "question": "Question 1",
          "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "id": 2,
          "question": "Question 2",
          "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "id": 3,
          "question": "Question 3",
          "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "id": 4,
          "question": "Question 4",
          "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        },
        {
          "id": 5,
          "question": "Question 5",
          "answer": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        }
      ],
      "first_page_url": "https://student.valuxapps.com/api/faqs?page=1",
      "from": 1,
      "last_page": 1,
      "last_page_url": "https://student.valuxapps.com/api/faqs?page=1",
      "next_page_url": null,
      "path": "https://student.valuxapps.com/api/faqs",
      "per_page": 35,
      "prev_page_url": null,
      "to": 6,
      "total": 6
    }
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
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
                    'Notifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
                itemCount: fAQsData['data']['data'].length,
                itemBuilder: (context, index) => buildNotifications(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNotifications(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fAQsData['data']['data'][index]['question'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.17,
                ),
              ),
              Text(
                fAQsData['data']['data'][index]['answer'],
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
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
