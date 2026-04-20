import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class ParentDashboardScreen extends StatefulWidget {
  const ParentDashboardScreen({super.key});

  @override
  State<ParentDashboardScreen> createState() => _ParentDashboardScreenState();
}

class _ParentDashboardScreenState extends State<ParentDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: "Family Dashboard",
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
                                    hintText: "Search children, activities...",
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
              child: _buildParentDashboard(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParentDashboard() {
    return Column(
      children: [
        // Children Overview
        _buildSectionHeader("My Children", ""),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _buildChildCard(
                "Emma Johnson",
                "Grade 10A",
                "85% Avg",
                Colors.blue,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildChildCard(
                "Michael Johnson",
                "Grade 7B",
                "92% Avg",
                Colors.green,
              ),
            ),
          ],
        ),

        SizedBox(height: 20.h),

        // Today's Schedule
        _buildSectionHeader("Today's Schedule", "View All"),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "Emma - Mathematics",
          "9:00 AM - 10:30 AM",
          "Room 201",
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "Michael - Science",
          "10:45 AM - 11:30 AM",
          "Lab 2",
          Colors.green,
        ),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "Emma - English",
          "11:45 AM - 12:30 PM",
          "Room 105",
          Colors.orange,
        ),

        SizedBox(height: 20.h),

        // Recent Activities
        _buildSectionHeader("Recent Activities", "View All"),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "Assignment Submitted",
          "Emma completed Mathematics homework",
          "2 hours ago",
          Icons.assignment_turned_in,
          Colors.green,
        ),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "Grade Posted",
          "Michael received A+ in Science quiz",
          "4 hours ago",
          Icons.grade,
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "Attendance Marked",
          "Emma present for all morning classes",
          "6 hours ago",
          Icons.check_circle,
          Colors.orange,
        ),

        SizedBox(height: 20.h),

        // Performance Overview
        _buildSectionHeader("Academic Performance", "View Details"),
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
                    "Emma Johnson - Grade 10A",
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
                      color: Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "85% Overall",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.blue,
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
                      "Mathematics",
                      "88%",
                      Colors.blue,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildPerformanceMetric(
                      "Science",
                      "82%",
                      Colors.green,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildPerformanceMetric(
                      "English",
                      "86%",
                      Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 12.h),

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
                    "Michael Johnson - Grade 7B",
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
                      "92% Overall",
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
                      "Mathematics",
                      "95%",
                      Colors.blue,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildPerformanceMetric(
                      "Science",
                      "90%",
                      Colors.green,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildPerformanceMetric(
                      "English",
                      "91%",
                      Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        // Communication
        _buildSectionHeader("Messages & Notices", "View All"),
        SizedBox(height: 8.h),
        _buildMessageCard(
          "Teacher Conference Reminder",
          "Emma's parent-teacher conference is scheduled for March 15th at 3:00 PM",
          "2 days ago",
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildMessageCard(
          "School Event Notice",
          "Annual Science Fair registration is now open. Register by March 20th",
          "1 week ago",
          Colors.green,
        ),

        SizedBox(height: 20.h),

        // Upcoming Events
        _buildSectionHeader("Upcoming Events", "View All"),
        SizedBox(height: 8.h),
        _buildEventCard(
          "Parent-Teacher Conference",
          "March 15, 2024",
          "Emma's Classroom",
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildEventCard(
          "Science Fair",
          "March 22, 2024",
          "School Auditorium",
          Colors.green,
        ),
        SizedBox(height: 8.h),
        _buildEventCard(
          "School Play - Romeo & Juliet",
          "April 5, 2024",
          "Main Theater",
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildChildCard(
    String name,
    String grade,
    String average,
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
          CircleAvatar(
            radius: 24.r,
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(Icons.person, color: color, size: 24.r),
          ),
          SizedBox(height: 8.h),
          Text(
            name,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            grade,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 4.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              average,
              style: TextStyle(
                fontSize: 10.sp,
                color: color,
                fontWeight: FontWeight.w600,
              ),
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
        if (actionText.isNotEmpty)
          TextButton(
            onPressed: () {},
            child: Text(
              actionText,
              style: TextStyle(
                color: Colors.orange,
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

  Widget _buildMessageCard(
    String title,
    String message,
    String time,
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
            child: Icon(Icons.message, color: color, size: 24.r),
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
                  message,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
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
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16.r),
        ],
      ),
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
