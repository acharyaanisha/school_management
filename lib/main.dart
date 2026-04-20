import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/core/common/custom_navigation_bar/cubit/bottom_nav_cubit.dart';
import 'package:school_management/core/splash/splash_screen.dart';
import 'package:school_management/core/utils/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.initializeSharedPreference();
  runApp(const SchoolManagement());
}

class SchoolManagement extends StatefulWidget {
  const SchoolManagement({super.key});

  @override
  State<SchoolManagement> createState() => _SchoolManagementState();
}

class _SchoolManagementState extends State<SchoolManagement> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavCubit>(
          create: (BuildContext context) => BottomNavCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const SplashScreen(),
            // home: const MainScreen(),
          );
        },
      ),
    );
  }
}
