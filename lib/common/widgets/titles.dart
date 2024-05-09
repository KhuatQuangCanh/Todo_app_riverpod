import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/common/widgets/appstyle.dart';
import 'package:todo_app_reverpod/common/widgets/hieght_spacer.dart';
import 'package:todo_app_reverpod/common/widgets/reusable_text.dart';
import 'package:todo_app_reverpod/common/widgets/width_spacer.dart';
import 'package:todo_app_reverpod/features/todo/controllers/todo/todo_provider.dart';

class BottomTitle extends StatelessWidget{
  const BottomTitle({super.key, required this.text, required this.text2,  this.clr});

  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
                builder: (context, ref, child) {
                  var color = ref.read(todoStateProvider.notifier).getRandomColor();
                  return Container(
                    height: 80,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                        color: color,
                    ),
                  );
                }),
            const WidthSpacer(wydth: 15),
            
            Padding(padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                    text: text,
                    style: appstyle(24, AppConst.kLight, FontWeight.bold)),
                const HieghtSpacer(hieght: 10),
                ReusableText(
                    text: text2,
                    style: appstyle(12, AppConst.kLight, FontWeight.normal)),

              ],
            ),
            ),

          ],
        ),
      ),
    );
  }

}