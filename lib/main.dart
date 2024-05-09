import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_reverpod/common/models/user_model.dart';
import 'package:todo_app_reverpod/common/routes/routes.dart';
import 'package:todo_app_reverpod/common/utils/constants.dart';
import 'package:todo_app_reverpod/features/auth/controllers/user_controller.dart';
import 'package:todo_app_reverpod/features/onboarding/pages/onboarding.dart';
import 'package:todo_app_reverpod/features/todo/pages/homepage.dart';
import 'package:todo_app_reverpod/features/todo/pages/veiw_not.dart';
import 'package:todo_app_reverpod/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme =
  ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkColorScheme =
  ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).refresh();
    List<UserModel> users = ref.watch(userProvider);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,

      builder: (context, child){
        return DynamicColorBuilder(
          builder: (lightColorScheme, darkColorSceme) {
            return MaterialApp(
              title: 'Dbestech',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor:AppConst.kBkDrark,
                colorScheme: lightColorScheme ?? defaultLightColorScheme,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorSceme ?? defaultDarkColorScheme,
                scaffoldBackgroundColor:AppConst.kBkDrark,
                useMaterial3: true,
              ),
              themeMode: ThemeMode.dark,
              home: users.isEmpty? const OnBoarding(): const HomePage(),
              onGenerateRoute: Routes.onGenerateRoute,

            );
          }
        );
      }
    );

  }
}
