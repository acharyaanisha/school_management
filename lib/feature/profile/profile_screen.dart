import 'package:flutter/material.dart';
import 'package:school_management/feature/profile/admin_profile.dart';
import 'package:school_management/feature/profile/parent_profile.dart';
import 'package:school_management/feature/profile/student_profile.dart';
import 'package:school_management/feature/profile/teacher_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String role = " ";
  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    // role = SharedPref.getStringValue(KeyString.userRole.name).toUpperCase();
    role = "PARENT";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                if (role == "STUDENT") StudentProfile(),
                if (role == "TEACHER") TeacherProfile(),
                if (role == "PARENT") ParentProfile(),
                if (role == "ADMIN") AdminProfile(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
