import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/common/widgets/appstyle.dart';
import 'package:todo_app_reverpod/common/widgets/custom_otn_btn.dart';
import 'package:todo_app_reverpod/common/widgets/hieght_spacer.dart';
import 'package:todo_app_reverpod/common/widgets/reusable_text.dart';
import 'package:todo_app_reverpod/features/auth/pages/login_page.dart';

class PageTwo extends StatelessWidget{
  const PageTwo({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Image.asset("assets/images/todo_1.png"),

          ),

          const HieghtSpacer(hieght: 50),

          CustomOtnBtn(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
              width: AppConst.kWidth*0.85,
              height: AppConst.kHeight*0.06,
              color: AppConst.kLight,
              text: "Login with a phone number")



        ],
      ),

    );
  }

}