import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_reverpod/common/helpers/notifications_helper.dart';
import 'package:todo_app_reverpod/common/models/task_model.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/common/widgets/appstyle.dart';
import 'package:todo_app_reverpod/common/widgets/custom_otn_btn.dart';
import 'package:todo_app_reverpod/common/widgets/custome_text.dart';
import 'package:todo_app_reverpod/common/widgets/hieght_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:todo_app_reverpod/common/widgets/showDialogue.dart';
import 'package:todo_app_reverpod/features/todo/controllers/dates/dates_provider.dart';
import 'package:todo_app_reverpod/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_app_reverpod/features/todo/pages/homepage.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();

  List<int> notification = [];

  late NotificationsHelper notifierHelper;
  late NotificationsHelper controller;

  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    notifierHelper = NotificationsHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0), () {
      controller = NotificationsHelper(ref: ref);
    });
    notifierHelper.initializeNotification();
    notifierHelper.requestIOSPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(finishTimeStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HieghtSpacer(hieght: 20),
            CustomeTextField(
              hintText: "Add title",
              controller: title,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            const HieghtSpacer(hieght: 20),
            CustomeTextField(
              hintText: "Add description",
              controller: desc,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            const HieghtSpacer(hieght: 20),
            CustomOtnBtn(
                onTap: () {
                  picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2024, 1, 1),
                      maxTime: DateTime(2029, 12, 31),
                      theme: const picker.DatePickerTheme(
                          doneStyle:
                              TextStyle(color: AppConst.kGreen, fontSize: 16)),
                      onConfirm: (date) {
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  }, currentTime: DateTime.now(), locale: picker.LocaleType.vi);
                },
                width: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kBlueLight,
                text: scheduleDate == ""
                    ? "Set Date"
                    : scheduleDate.substring(0, 10)),
            const HieghtSpacer(hieght: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtnBtn(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        notification = ref
                            .read(startTimeStateProvider.notifier)
                            .dates(date);
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.vi);
                    },
                    width: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kBlueLight,
                    text: start == "" ? "Start Time" : start.substring(10, 16)),
                CustomOtnBtn(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.vi);
                    },
                    width: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kBlueLight,
                    text: finish == "" ? "End Time" : finish.substring(10, 16)),
              ],
            ),
            const HieghtSpacer(hieght: 20),
            CustomOtnBtn(
                onTap: () {
                  if (title.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      scheduleDate.isNotEmpty &&
                      start.isNotEmpty &&
                      finish.isNotEmpty) {
                    Task task = Task(
                        title: title.text,
                        desc: desc.text,
                        isCompleted: 0,
                        date: scheduleDate,
                        startTime: start.substring(10, 16),
                        endTime: finish.substring(10, 16),
                        remind: 0,
                        repeat: "yes");
                    notifierHelper.scheduledNotification(
                        notification[0],
                        notification[1],
                        notification[2],
                        notification[3],
                        task);
                    ref.read(todoStateProvider.notifier).addItem(task);
                    ref.read(finishTimeStateProvider.notifier).setStart('');
                    ref.read(startTimeStateProvider.notifier).setStart('');
                    ref.read(dateStateProvider.notifier).setDate('');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else {
                    showAlerDialog(
                        context: context, message: 'failed to add task');
                  }
                },
                width: AppConst.kWidth * 0.4,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kGreen,
                text: "Submit"),
          ],
        ),
      ),
    );
  }
}
