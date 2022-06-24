import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleLogo extends StatelessWidget {
  const TitleLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "B",
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "l",
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.lime,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "o",
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "g",
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "-",
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.white30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              " A",
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "p",
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "p",
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
