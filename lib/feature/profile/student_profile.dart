import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/core/common/profile_template/profile_template.dart';
import 'package:school_management/feature/privacy_policy/privacy_policy_screen.dart';
import 'package:school_management/feature/profile/edit_profile_screen.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  late ProfileData profileData;

  @override
  void initState() {
    super.initState();
    profileData = ProfileData(
      name: 'John Doe',
      email: 'john.doe@university.edu',
      id: 'STU2024001',
      grade: 'Senior',
      major: 'Computer Science',
      menuItems: [
        ProfileMenuItem(
          icon: Icons.collections_bookmark_outlined,
          title: "My Courses",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.emoji_events_outlined,
          title: "Awards & Achievements",
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.notifications,
          title: "Notifications",
          onTap: () {},
        ),
        ProfileMenuItem(icon: Icons.settings, title: "Settings", onTap: () {}),
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
      dashboardCards: [_buildAcademicOverview()],
      quickActions: [
        QuickAction(icon: Icons.schedule, label: 'Schedule', onTap: () {}),
        QuickAction(icon: Icons.assignment, label: 'Assignments', onTap: () {}),
        QuickAction(icon: Icons.forum, label: 'Messages', onTap: () {}),
        QuickAction(icon: Icons.library_books, label: 'Library', onTap: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileTemplate(
      profileData: profileData,
      userRole: UserRole.student,
    );
  }

  Widget _buildAcademicOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Academic Overview',
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
              child: _buildAcademicCard(
                'Current GPA',
                '3.85',
                Icons.grade,
                Colors.orange,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildAcademicCard(
                'Credits Completed',
                '88/120',
                Icons.book,
                Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildAcademicCard(
                'Attendance Rate',
                '94%',
                Icons.calendar_today,
                Colors.green,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildAcademicCard(
                'Pending Tasks',
                '4',
                Icons.assignment,
                Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAcademicCard(
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
