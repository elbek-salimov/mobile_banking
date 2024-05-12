import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:size_util/size_util.dart';

import '../../../../utils/styles/app_text_styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: AppTextStyle.interSemiBold
              .copyWith(color: Colors.green, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promotional message',
                  style: AppTextStyle.interSemiBold.copyWith(fontSize: 16),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Colors.green,
                    value: isOn,
                    onChanged: (value) {
                      setState(() {
                        isOn = !isOn;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              width: width / 1.4,
              child: Text(
                'If allowed, you will be sent push notifications '
                'about exclusive offers, VIP gifts and new products.',
                style: AppTextStyle.interRegular
                    .copyWith(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
