import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/common/widgets/appstyle.dart';
import 'package:todo_app_reverpod/common/widgets/custom_otn_btn.dart';
import 'package:todo_app_reverpod/common/widgets/custome_text.dart';
import 'package:todo_app_reverpod/common/widgets/hieght_spacer.dart';
import 'package:todo_app_reverpod/common/widgets/reusable_text.dart';
import 'package:todo_app_reverpod/common/widgets/showDialogue.dart';
import 'package:todo_app_reverpod/features/auth/controllers/auth_controller.dart';
import 'package:todo_app_reverpod/features/auth/controllers/code_provider.dart';
import 'package:todo_app_reverpod/features/auth/pages/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();

  Country country = Country(
      phoneCode: "84",
      countryCode: "VN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Vietnam",
      example: "Vietnam",
      displayName: "Vietnam",
      displayNameNoCountryCode: "Vietnam",
      e164Key: "");

  sendCodeToUser() {
    if (phone.text.isEmpty) {
      return showAlerDialog(
          context: context, message: "Please enter your phone number");
    } else if (phone.text.length < 8) {
      return showAlerDialog(
          context: context, message: "Your number is too short");
    } else {
      print('${country.phoneCode}${phone.text}');
      ref.read(authControllerProvider).sendSms(
          context: context,
          phone: '+${country.phoneCode}${phone.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  "assets/images/todo_page_one.png",
                  width: 300,
                ),
              ),
              const HieghtSpacer(hieght: 20),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                    text: "Please enter your phone number",
                    style: appstyle(17, AppConst.kLight, FontWeight.w500)),
              ),
              const HieghtSpacer(hieght: 20),
              Center(
                child: CustomeTextField(
                  controller: phone,
                  prefixIcon: Container(
                    padding: EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                                backgroundColor: AppConst.kGreyLight,
                                bottomSheetHeight: AppConst.kHeight * 0.6,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(AppConst.kRadius),
                                    topRight:
                                        Radius.circular(AppConst.kRadius))),
                            onSelect: (code) {
                              setState(() {
                                country = code;
                              });
                              // ref
                              //     .read(codeStateProvider.notifier)
                              //     .setStart(code.phoneCode);
                              // print(ref.read(codeStateProvider));
                            });

                      },
                      child: ReusableText(
                        text: "${country.flagEmoji} + ${country.phoneCode} ",
                        style: appstyle(16, AppConst.kBkDrark, FontWeight.w600),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: "Enter phone number",
                  hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),
                ),
              ),
              const HieghtSpacer(hieght: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomOtnBtn(
                    onTap: () {
                      sendCodeToUser();
                    },
                    width: AppConst.kWidth * 0.9,
                    height: AppConst.kHeight * 0.075,
                    color: AppConst.kBkDrark,
                    color2: AppConst.kLight,
                    text: "Send Code"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
