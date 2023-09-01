import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'constants/texts/app_titles.dart';
import 'helpers/pager.dart';
import 'provider/task_hive_provider.dart';
import 'theme/theme_datas.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 786),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (context) => TaskHiveProvider(),
            child: MaterialApp(
              title: AppTitles.appTitle,
              debugShowCheckedModeBanner: false,
              theme: ThemeDatas.generalAppTheme,
              home: child,
            ),
          );
        },
        child: Pager.taskPage);
  }
}
