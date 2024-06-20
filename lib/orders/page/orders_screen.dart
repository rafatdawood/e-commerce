import 'package:e_commerce/order_details/page/order_details_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Map ordersData = {
    "status": true,
    "message": null,
    "data": {
      "current_page": 1,
      "data": [
        {"id": 44114, "total": 0, "date": "20 / 06 / 2024", "status": "New"},
        {"id": 3871, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3870, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3869, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3868, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3867, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3866, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3865, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3864, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3863, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3862, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3861, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3860, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3859, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3858, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3857, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3856, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3855, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3854, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3853, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3852, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3851, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3850, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3849, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3848, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3847, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3846, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3845, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3844, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3843, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3842, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3841, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3840, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3839, "total": 0, "date": "19 / 12 / 2023", "status": "New"},
        {"id": 3838, "total": 0, "date": "19 / 12 / 2023", "status": "New"}
      ],
      "first_page_url": "https://student.valuxapps.com/api/orders?page=1",
      "from": 1,
      "last_page": 2,
      "last_page_url": "https://student.valuxapps.com/api/orders?page=2",
      "next_page_url": "https://student.valuxapps.com/api/orders?page=2",
      "path": "https://student.valuxapps.com/api/orders",
      "per_page": 35,
      "prev_page_url": null,
      "to": 35,
      "total": 62
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
            Container(
              child: Text(
                'Orders',
                style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 28,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.28,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ordersData['data']['data'].length,
                itemBuilder: (context, index) => InkWell(
                  onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) => OrderDetailsScreen(),)),
                  overlayColor: WidgetStateColor.transparent,
                  child: buildOrders(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrders(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Container(
        height: 150,
        width: 356,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.16,
                  ),
                ),
                Text(
                  '\$${ordersData['data']['data'][index]['total']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Date: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.16,
                  ),
                ),
                Text(
                  '${ordersData['data']['data'][index]['date']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.16,
                  ),
                ),
                Text(
                  '${ordersData['data']['data'][index]['status']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
