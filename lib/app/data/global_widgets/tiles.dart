import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;
  const Tile(
      {required this.function,
      required this.title,
      required this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: GestureDetector(
        onTap: () => function(),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            height: 60.h,
            width: 330.w,
            child: Row(
              children: [
                SizedBox(
                  width: 25.w,
                ),
                Icon(
                  icon,
                  size: 25.sp,
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
