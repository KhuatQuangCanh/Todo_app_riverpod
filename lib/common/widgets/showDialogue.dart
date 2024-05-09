import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/common/widgets/appstyle.dart';
import 'package:todo_app_reverpod/common/widgets/reusable_text.dart';

showAlerDialog({
required BuildContext context,
required String message,
String? btnText,
}) {
  return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: ReusableText(
              text: message,
              style: appstyle(18, AppConst.kLight, FontWeight.w600)),
          contentPadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
          actions: [
            TextButton(onPressed: ()=> Navigator.pop(context),
                child: Text(btnText?? "OK",
                style: appstyle(18, AppConst.kGreyLight, FontWeight.w600),))
          ],
        );
        
      });
}