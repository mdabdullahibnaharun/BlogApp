import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconButton? button;
  const CustomAppBar({this.button, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      child: Row(
        mainAxisAlignment: button == null
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        children: [
          const BackButton(),
          SizedBox(
            width: button == null ? 60.w : 0,
          ),
          button == null
              ? Text(
                  title,
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : button!,
        ],
      ),
    );
  }
}
