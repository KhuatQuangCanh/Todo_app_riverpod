
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/common/widgets/appstyle.dart';
import 'package:todo_app_reverpod/common/widgets/hieght_spacer.dart';
import 'package:todo_app_reverpod/common/widgets/reusable_text.dart';
import 'package:todo_app_reverpod/features/auth/controllers/auth_controller.dart';

class OtpPage extends ConsumerWidget{
  const OtpPage({super.key, required this.smsCodeId, required this.phone});

  final String smsCodeId;
  final String phone;

  void verifyOtpCode(
      BuildContext context, WidgetRef ref, String smsCode
      ) {
    ref.read(authControllerProvider).verifyOtpCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: true);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white70,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              HieghtSpacer(hieght: AppConst.kHeight*0.12),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Image.asset("assets/images/todo_page_one.png",
                    width: AppConst.kWidth*0.5,)
              ),

              const HieghtSpacer(hieght: 26),

              ReusableText(text: "Enter your otp code",
                  style: appstyle(18, AppConst.kLight, FontWeight.bold)),

              const HieghtSpacer(hieght: 26),


              Pinput(
                length: 6,
                showCursor: true,

                onCompleted: (value) {
                  if(value.length == 6){
                    return verifyOtpCode(context, ref, value);
                  }
                },
                onSubmitted: (value) {
                  if(value.length == 6){
                    return verifyOtpCode(context, ref, value);
                  }
                },
              )


            ],
          ),
        ),
      ),
    );
  }


}