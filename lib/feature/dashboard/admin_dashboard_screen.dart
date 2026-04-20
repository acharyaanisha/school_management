import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: "Admin Control Center",
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
                                    hintText:
                                        "Search users, reports, settings...",
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
              child: _buildAdminDashboard(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminDashboard() {
    return Column(
      children: [
        // System Overview Stats
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                "Total Users",
                "1,247",
                Icons.people,
                Colors.purple,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                "Active Sessions",
                "892",
                Icons.online_prediction,
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
                "System Load",
                "67%",
                Icons.memory,
                Colors.blue,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildStatCard(
                "Reports Today",
                "23",
                Icons.report,
                Colors.orange,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),

        // Quick Actions
        _buildSectionHeader("Quick Actions", ""),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                "User Management",
                Icons.manage_accounts,
                Colors.purple,
                () {},
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildActionCard(
                "System Settings",
                Icons.settings,
                Colors.blue,
                () {},
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                "Reports & Analytics",
                Icons.analytics,
                Colors.green,
                () {},
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildActionCard(
                "Backup & Security",
                Icons.security,
                Colors.orange,
                () {},
              ),
            ),
          ],
        ),

        SizedBox(height: 20.h),

        // Recent Activities
        _buildSectionHeader("Recent Activities", "View All"),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "New User Registration",
          "John Smith (Student) registered",
          "5 minutes ago",
          Icons.person_add,
          Colors.green,
        ),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "System Backup Completed",
          "Daily backup finished successfully",
          "2 hours ago",
          Icons.backup,
          Colors.blue,
        ),
        SizedBox(height: 8.h),
        _buildActivityCard(
          "Security Alert",
          "Multiple failed login attempts detected",
          "4 hours ago",
          Icons.warning,
          Colors.red,
        ),

        SizedBox(height: 20.h),

        // System Health
        _buildSectionHeader("System Health", "View Details"),
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
                    "Server Status",
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
                    child: Row(
                      children: [
                        Icon(Icons.circle, color: Colors.green, size: 8.r),
                        SizedBox(width: 4.w),
                        Text(
                          "All Systems Operational",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: _buildHealthMetric("CPU Usage", "45%", Colors.blue),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildHealthMetric("Memory", "62%", Colors.orange),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildHealthMetric("Storage", "78%", Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        // Pending Tasks
        _buildSectionHeader("Pending Tasks", "View All"),
        SizedBox(height: 8.h),
        _buildTaskCard(
          "Review Teacher Applications",
          "3 new applications pending approval",
          "High Priority",
          Colors.red,
        ),
        SizedBox(height: 8.h),
        _buildTaskCard(
          "Update System Policies",
          "Annual policy review due",
          "Medium Priority",
          Colors.orange,
        ),
        SizedBox(height: 8.h),
        _buildTaskCard(
          "Database Optimization",
          "Performance improvements needed",
          "Low Priority",
          Colors.blue,
        ),

        SizedBox(height: 20.h),

        // Upcoming Events
        _buildSectionHeader("Upcoming Events", "View All"),
        SizedBox(height: 8.h),
        _buildEventCard(
          "Board Meeting",
          "March 18, 2024",
          "Conference Room A",
          Colors.purple,
        ),
        SizedBox(height: 8.h),
        _buildEventCard(
          "System Maintenance",
          "March 25, 2024",
          "Scheduled 2:00 AM - 4:00 AM",
          Colors.blue,
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

  Widget _buildActionCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: color, size: 24.r),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
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
                color: Colors.purple,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
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

  Widget _buildHealthMetric(String label, String value, Color color) {
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

  Widget _buildTaskCard(
    String title,
    String subtitle,
    String priority,
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              priority,
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
