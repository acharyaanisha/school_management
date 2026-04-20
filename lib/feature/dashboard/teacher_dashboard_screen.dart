import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({super.key});

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: "Welcome Back, Teacher!",
            expandedHeight: 160,
            expandedContent: Center(
              child: FlexibleSpaceBar(
                background: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 70),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: TextField(
                                  style:
                                      context
                                          .textStyle(
                                            palette: ColorPalette.detail,
                                          )
                                          .small
                                          .regular,
                                  decoration: InputDecoration(
                                    hintText: "Search students, assignments...",
                                    hintStyle:
                                        context
                                            .textStyle(
                                              palette: ColorPalette.detail,
                                            )
                                            .xsmall
                                            .regular,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: context.applyAppColor(
                                        palette: ColorPalette.detail,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: AppPadding.basePagePadding,
              child: _buildTeacherDashboard(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherDashboard() {
    return Column(
      children: [
        // Quick Stats Row
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                "Active Classes",
                "5",
                Icons.class_,
                Colors.green,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                "Total Students",
                "127",
                Icons.people,
                Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                "Pending Grades",
                "23",
                Icons.grade,
                Colors.orange,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                "Avg. Rating",
                "4.8",
                Icons.star,
                Colors.purple,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),

        // Today's Schedule
        _buildSectionHeader("Today's Classes", "View All"),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "Mathematics - Grade 10A",
          "9:00 AM - 10:30 AM",
          "Room 201",
          Colors.green,
        ),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "Computer Science - Grade 11B",
          "11:00 AM - 12:30 PM",
          "Lab 1",
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "Mathematics - Grade 9C",
          "2:00 PM - 3:30 PM",
          "Room 201",
          Colors.orange,
        ),

        SizedBox(height: 20.h),

        // Recent Activities
        _buildSectionHeader("Recent Activities", "View All"),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "Assignment Graded",
          "Mathematics Quiz - Grade 10A",
          "2 hours ago",
          Icons.assignment_turned_in,
          Colors.green,
        ),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "New Assignment Posted",
          "Computer Science Project",
          "4 hours ago",
          Icons.assignment,
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "Attendance Marked",
          "Mathematics - Grade 9C",
          "6 hours ago",
          Icons.check_circle,
          Colors.orange,
        ),

        SizedBox(height: 20.h),

        // Student Performance Overview
        _buildSectionHeader("Class Performance", "View Details"),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grade 10A - Mathematics",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "85% Avg",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: _buildPerformanceMetric(
                      "Assignments",
                      "92%",
                      Colors.blue,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildPerformanceMetric(
                      "Attendance",
                      "88%",
                      Colors.green,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildPerformanceMetric(
                      "Participation",
                      "78%",
                      Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        // Upcoming Events
        _buildSectionHeader("Upcoming Events", "View All"),
        SizedBox(height: 8.h),
        _buildEventCard(
          "Parent-Teacher Conference",
          "March 15, 2024",
          "Staff Meeting Room",
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildEventCard(
          "Faculty Development Workshop",
          "March 20, 2024",
          "Auditorium",
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
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

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            actionText,
            style: TextStyle(
              color: Colors.green,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleCard(
    String subject,
    String time,
    String location,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  time,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            location,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(
    String title,
    String subtitle,
    String time,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: color, size: 24.r),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildEventCard(
    String title,
    String date,
    String location,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.event, color: color, size: 24.r),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  date,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16.r),
        ],
      ),
    );
  }
}
