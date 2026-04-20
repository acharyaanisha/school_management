import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/common/custom_navigation_bar/cubit/bottom_nav_cubit.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';
import 'package:school_management/feature/admin_view/admin_setting_screen.dart';
import 'package:school_management/feature/admin_view/analytics_screen.dart';
import 'package:school_management/feature/admin_view/users_screen.dart';
import 'package:school_management/feature/assignment/assignment_screen.dart';
import 'package:school_management/feature/dashboard/admin_dashboard_screen.dart';
import 'package:school_management/feature/parent_view/bus_location_screen.dart';
import 'package:school_management/feature/dashboard/parent_dashboard_screen.dart';
import 'package:school_management/feature/dashboard/student_dashboard_screen.dart';
import 'package:school_management/feature/dashboard/teacher_dashboard_screen.dart';
import 'package:school_management/feature/payment/payment_screen.dart';
import 'package:school_management/feature/presence/presence_screen.dart';
import 'package:school_management/feature/profile/admin_profile.dart';
import 'package:school_management/feature/profile/parent_profile.dart';
import 'package:school_management/feature/profile/student_profile.dart';
import 'package:school_management/feature/profile/teacher_profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String role = '';

  @override
  void initState() {
    super.initState();
    // role = SharedPref.getStringValue(KeyString.userRole.name).toUpperCase();
    role = "TEACHER";
  }

  List<Widget> _getScreensByRole() {
    switch (role) {
      case 'TEACHER':
        return const [
          TeacherDashboardScreen(),
          PresenceScreen(),
          AssignmentScreen(),
          PaymentScreen(),
          TeacherProfile(),
        ];
      case 'ADMIN':
        return const [
          AdminDashboardScreen(),
          UsersScreen(),
          AnalyticsScreen(),
          AdminSettingScreen(),
          AdminProfile(),
        ];
      case 'PARENT':
        return const [
          ParentDashboardScreen(),
          BusLocationScreen(),
          PresenceScreen(),
          PaymentScreen(),
          ParentProfile(),
        ];
      case 'STUDENT':
      default:
        return const [
          StudentDashboardScreen(),
          PresenceScreen(),
          AssignmentScreen(),
          PaymentScreen(),
          StudentProfile(),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        int currentIndex = 0;
        bool isVisible = true;

        if (state is BottomNavbarTapState) {
          currentIndex = state.currIndex;
          isVisible = state.isVisible;
        }

        final screens = _getScreensByRole();

        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar:
              isVisible
                  ? CustomButtomNavigationBar(
                    selectedIndex: currentIndex,
                    role: role,
                  )
                  : null,
        );
      },
    );
  }
}

class CustomButtomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final String role;
  const CustomButtomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.role,
  });

  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  late String role;
  late List<BottomNavigationBarItem> navigationItems;

  @override
  void initState() {
    super.initState();
    role = widget.role.isEmpty ? 'STUDENT' : widget.role.toUpperCase();
    _setRoleProperties();
  }

  void _setRoleProperties() {
    switch (role) {
      case 'TEACHER':
        navigationItems = _getTeacherNavItems();
        break;
      case 'ADMIN':
        navigationItems = _getAdminNavItems();
        break;
      case 'PARENT':
        navigationItems = _getParentNavItems();
        break;
      case 'STUDENT':
      default:
        navigationItems = _getStudentNavItems();
        break;
    }
  }

  List<BottomNavigationBarItem> _getStudentNavItems() {
    return [
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(10),
          decoration:
              widget.selectedIndex == 0
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 0 ? MdiIcons.home : MdiIcons.homeOutline,
            size: 24,
          ),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 1
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 1
                ? MdiIcons.calendarMonth
                : MdiIcons.calendarMonthOutline,
            size: 24,
          ),
        ),
        label: 'Presence',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 2
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 2
                ? MdiIcons.bookOpenPageVariant
                : MdiIcons.bookOpenPageVariantOutline,
            size: 24,
          ),
        ),
        label: 'Assignment',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 3
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 3 ? Icons.payment : Icons.payment_outlined,
            size: 25,
          ),
        ),
        label: 'Payment',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 4
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 4
                ? MdiIcons.account
                : MdiIcons.accountOutline,
            size: 24,
          ),
        ),
        label: 'Profile',
      ),
    ];
  }

  List<BottomNavigationBarItem> _getTeacherNavItems() {
    return [
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(10),
          decoration:
              widget.selectedIndex == 0
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 0 ? MdiIcons.home : MdiIcons.homeOutline,
            size: 24,
          ),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 1
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 1
                ? MdiIcons.calendarMonth
                : MdiIcons.calendarMonthOutline,
            size: 24,
          ),
        ),
        label: 'Schedule',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 2
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 2
                ? MdiIcons.bookOpenPageVariant
                : MdiIcons.bookOpenPageVariantOutline,
            size: 24,
          ),
        ),
        label: 'Classes',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 3
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 3 ? Icons.grade : Icons.grade_outlined,
            size: 25,
          ),
        ),
        label: 'Grades',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 4
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 4
                ? MdiIcons.account
                : MdiIcons.accountOutline,
            size: 24,
          ),
        ),
        label: 'Profile',
      ),
    ];
  }

  List<BottomNavigationBarItem> _getAdminNavItems() {
    return [
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(10),
          decoration:
              widget.selectedIndex == 0
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 0 ? MdiIcons.home : MdiIcons.homeOutline,
            size: 24,
          ),
        ),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 1
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 1
                ? Icons.manage_accounts
                : Icons.manage_accounts_outlined,
            size: 24,
          ),
        ),
        label: 'Users',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 2
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 2
                ? Icons.analytics
                : Icons.analytics_outlined,
            size: 24,
          ),
        ),
        label: 'Analytics',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 3
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 3
                ? Icons.settings
                : Icons.settings_outlined,
            size: 25,
          ),
        ),
        label: 'Settings',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 4
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 4
                ? MdiIcons.account
                : MdiIcons.accountOutline,
            size: 24,
          ),
        ),
        label: 'Profile',
      ),
    ];
  }

  List<BottomNavigationBarItem> _getParentNavItems() {
    return [
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(10),
          decoration:
              widget.selectedIndex == 0
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 0 ? MdiIcons.home : MdiIcons.homeOutline,
            size: 24,
          ),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 1
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 1
                ? Icons.directions_bus
                : Icons.directions_bus_outlined,
            size: 24,
          ),
        ),
        label: 'Bus',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 2
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 2
                ? MdiIcons.calendarMonth
                : MdiIcons.calendarMonthOutline,
            size: 24,
          ),
        ),
        label: 'Events',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 3
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 3 ? Icons.payment : Icons.payment_outlined,
            size: 25,
          ),
        ),
        label: 'Payment',
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              widget.selectedIndex == 4
                  ? BoxDecoration(
                    color: AppColor.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  )
                  : null,
          child: Icon(
            widget.selectedIndex == 4
                ? MdiIcons.account
                : MdiIcons.accountOutline,
            size: 24,
          ),
        ),
        label: 'Profile',
      ),
    ];
  }

  void onItemTapped(int index) {
    BlocProvider.of<BottomNavCubit>(context).setPageIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.whiteColor,
        showUnselectedLabels: true,
        elevation: 0,
        currentIndex: widget.selectedIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.greyColor,
        selectedLabelStyle: context
            .textStyle(palette: ColorPalette.primary)
            .small
            .copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: context
            .textStyle(palette: ColorPalette.detail)
            .small
            .copyWith(fontWeight: FontWeight.w400),
        onTap: onItemTapped,
        items: navigationItems,
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isSelected;
  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    this.isSelected = true,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.whiteColor,
      radius: 25,
      child: FloatingActionButton(
        onPressed: onPressed,
        isExtended: true,
        focusColor: AppColor.primaryColor,
        shape: CircleBorder(side: BorderSide(color: ColorPalette.white)),
        backgroundColor: AppColor.whiteColor,
        child: Image.asset(""),
      ),
    );
  }
}
