import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/core/common/profile_template/profile_template.dart';
import 'package:school_management/feature/privacy_policy/privacy_policy_screen.dart';
import 'package:school_management/feature/profile/edit_profile_screen.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  late ProfileData profileData;

  @override
  void initState() {
    super.initState();
    profileData = ProfileData(
      name: 'Mr. Robert Davis',
      email: 'robert.davis@school.edu',
      id: 'ADM2024001',
      department: 'Administration',
      position: 'School Principal',
      experience: '15 Years',
      menuItems: [
        ProfileMenuItem(
          icon: Icons.dashboard_outlined,
          title: "Dashboard",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.people_outline,
          title: "Staff Management",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.school_outlined,
          title: "Student Records",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.account_balance_wallet_outlined,
          title: "Finance",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.settings_outlined,
          title: "System Settings",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.analytics_outlined,
          title: "Reports & Analytics",
          onTap: () {},
        ),
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
      dashboardCards: [_buildAdminOverview()],
      quickActions: [
        QuickAction(icon: Icons.add_circle, label: 'Add Staff', onTap: () {}),
        QuickAction(
          icon: Icons.notifications,
          label: 'Announcements',
          onTap: () {},
        ),
        QuickAction(icon: Icons.calendar_today, label: 'Events', onTap: () {}),
        QuickAction(icon: Icons.backup, label: 'Backup', onTap: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileTemplate(profileData: profileData, userRole: UserRole.admin);
  }

  Widget _buildAdminOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Administrative Overview',
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
              child: _buildAdminCard(
                'Total Students',
                '1,247',
                Icons.people,
                Colors.blue,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildAdminCard(
                'Staff Members',
                '89',
                Icons.work,
                Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildAdminCard(
                'Active Classes',
                '67',
                Icons.class_,
                Colors.orange,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildAdminCard(
                'Revenue',
                '\$2.4M',
                Icons.attach_money,
                Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdminCard(
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
              fontSize: 20.sp,
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
}
