import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: "Welcome Back, Student!",
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
                                    hintText: "Search courses, assignments...",
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
              child: _buildStudentDashboard(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentDashboard() {
    return Column(
      children: [
        // Quick Stats Row
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                "Attendance",
                "85%",
                Icons.calendar_today,
                Colors.blue,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                "Assignments",
                "12",
                Icons.assignment,
                Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                "Grade Average",
                "A-",
                Icons.grade,
                Colors.orange,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                "Credits Earned",
                "45",
                Icons.school,
                Colors.purple,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),

        // Today's Schedule
        _buildSectionHeader("Today's Schedule", "View All"),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "Mathematics",
          "9:00 AM - 10:30 AM",
          "Room 201",
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "Computer Science",
          "11:00 AM - 12:30 PM",
          "Lab 1",
          Colors.green,
        ),
        SizedBox(height: 8.h),
        _buildScheduleCard(
          "English Literature",
          "2:00 PM - 3:30 PM",
          "Room 105",
          Colors.orange,
        ),

        SizedBox(height: 20.h),

        // Recent Assignments
        _buildSectionHeader("Recent Assignments", "View All"),
        SizedBox(height: 8.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            final subjects = ["Math", "Science", "English", "History"];
            final colors = [
              Colors.blue,
              Colors.green,
              Colors.orange,
              Colors.purple,
            ];
            final assignments = [
              "Algebra Quiz",
              "Lab Report",
              "Essay",
              "Presentation",
            ];

            return _buildAssignmentCard(
              subjects[index],
              assignments[index],
              "Due: Tomorrow",
              colors[index],
            );
          },
        ),

        SizedBox(height: 20.h),

        // Upcoming Events
        _buildSectionHeader("Upcoming Events", "View All"),
        SizedBox(height: 8.h),
        _buildEventCard(
          "Parent-Teacher Conference",
          "March 15, 2024",
          "2:00 PM - 4:00 PM",
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildEventCard(
          "Science Fair",
          "March 20, 2024",
          "9:00 AM - 3:00 PM",
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
              color: Colors.blue,
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

  Widget _buildAssignmentCard(
    String subject,
    String assignment,
    String dueDate,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(12.r),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              subject,
              style: TextStyle(
                fontSize: 10.sp,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            assignment,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            dueDate,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.red[400],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, String date, String time, Color color) {
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
                  time,
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
