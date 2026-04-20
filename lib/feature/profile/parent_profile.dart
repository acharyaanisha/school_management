import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/common/profile_template/profile_template.dart';
import 'package:school_management/feature/privacy_policy/privacy_policy_screen.dart';
import 'package:school_management/feature/profile/edit_profile_screen.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({super.key});

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  late ProfileData profileData;

  @override
  void initState() {
    super.initState();
    profileData = ProfileData(
      name: 'Michael Rodriguez',
      email: 'michael.rodriguez@email.com',
      id: 'PAR2024001',
      role: 'Parent',
      menuItems: [
        ProfileMenuItem(
          icon: Icons.child_care,
          title: "Children Profiles",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.payment_outlined,
          title: "Fee History",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.calendar_today,
          title: "School Events",
          onTap: () {},
        ),
        ProfileMenuItem(icon: Icons.message, title: "Messages", onTap: () {}),
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: "Edit Profile",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()),
            );
          },
        ),
        ProfileMenuItem(
          icon: Icons.security,
          title: "Privacy Policy",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
            );
          },
          isLast: true,
        ),
      ],
      dashboardCards: [
        _buildFamilyOverview(),
        SizedBox(height: 24.h),
        _buildChildrenPerformance(),
      ],
      quickActions: [
        QuickAction(icon: Icons.payment, label: 'Pay Fees', onTap: () {}),
        QuickAction(
          icon: Icons.calendar_view_month,
          label: 'Schedule',
          onTap: () {},
        ),
        QuickAction(icon: Icons.forum, label: 'Contact Teacher', onTap: () {}),
        QuickAction(
          icon: Icons.library_books,
          label: 'Resources',
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileTemplate(profileData: profileData, userRole: UserRole.parent);
  }

  Widget _buildFamilyOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Family Overview',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildFamilyCard(
                'Children Enrolled',
                '2',
                Icons.child_care,
                Colors.blue,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildFamilyCard(
                'Next Fee Due',
                '\$350.00',
                Icons.payment,
                Colors.orange,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildFamilyCard(
                'Attendance Rate',
                '96%',
                Icons.calendar_today,
                Colors.green,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildFamilyCard(
                'Messages',
                '3 Unread',
                Icons.message,
                Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFamilyCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28.r),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildrenPerformance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Children Performance',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16.h),
        _buildChildCard('Alex Rodriguez', 'Grade 10', '3.8 GPA', Colors.blue),
        SizedBox(height: 12.h),
        _buildChildCard('Emma Rodriguez', 'Grade 8', '3.9 GPA', Colors.purple),
      ],
    );
  }

  Widget _buildChildCard(
    String name,
    String grade,
    String performance,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.person, color: color, size: 24.r),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  grade,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColor.successColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              performance,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColor.successColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
