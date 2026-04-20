import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/core/common/profile_template/profile_template.dart';
import 'package:school_management/feature/privacy_policy/privacy_policy_screen.dart';
import 'package:school_management/feature/profile/edit_profile_screen.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  late ProfileData profileData;

  @override
  void initState() {
    super.initState();
    profileData = ProfileData(
      name: 'Dr. Sarah Johnson',
      email: 'sarah.johnson@university.edu',
      id: 'TCH2024001',
      department: 'Computer Science',
      position: 'Associate Professor',
      experience: '8 Years',
      menuItems: [
        ProfileMenuItem(
          icon: Icons.class_outlined,
          title: "My Classes",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.people_outline,
          title: "Students",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.assignment_outlined,
          title: "Assignments",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.analytics_outlined,
          title: "Reports",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.calendar_today,
          title: "Schedule",
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
      dashboardCards: [_buildTeachingOverview()],
      quickActions: [
        QuickAction(
          icon: Icons.add_circle,
          label: 'New Assignment',
          onTap: () {},
        ),
        QuickAction(icon: Icons.grade, label: 'Grade Book', onTap: () {}),
        QuickAction(icon: Icons.message, label: 'Messages', onTap: () {}),
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
    return ProfileTemplate(
      profileData: profileData,
      userRole: UserRole.teacher,
    );
  }

  Widget _buildTeachingOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Teaching Overview',
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
              child: _buildTeachingCard(
                'Active Classes',
                '5',
                Icons.class_,
                Colors.blue,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildTeachingCard(
                'Total Students',
                '127',
                Icons.people,
                Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildTeachingCard(
                'Pending Grades',
                '23',
                Icons.grade,
                Colors.orange,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildTeachingCard(
                'Avg. Rating',
                '4.8',
                Icons.star,
                Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTeachingCard(
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
