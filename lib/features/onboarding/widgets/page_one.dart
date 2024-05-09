import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/common/widgets/appstyle.dart';
import 'package:todo_app_reverpod/common/widgets/hieght_spacer.dart';
import 'package:todo_app_reverpod/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget{
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBkDrark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/images/todo_page_one.png"),

          ),

          const HieghtSpacer(hieght: 30),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              ReusableText(
                text: "ToDo with Riverpod",
                style: appstyle(30, AppConst.kLight, FontWeight.w600),
              ),

              const HieghtSpacer(hieght: 10),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text("Wellcome!! Do you want to creat a task fast and with ease",
                  textAlign: TextAlign.center,
                  style: appstyle(16, AppConst.kGreyLight, FontWeight.normal),
                ),
              )

            ],
          )

        ],
      ),

    );
  }

}