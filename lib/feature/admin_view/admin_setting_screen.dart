import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_app_bar/custom_sliver_app_bar.dart';

class AdminSettingScreen extends StatefulWidget {
  const AdminSettingScreen({super.key});

  @override
  State<AdminSettingScreen> createState() => _AdminSettingScreenState();
}

class _AdminSettingScreenState extends State<AdminSettingScreen> {
  bool _autoApproveUsers = true;
  bool _maintenanceMode = false;
  bool _dailyReports = true;
  bool _emailNotifications = true;
  bool _smsAlerts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pageBodyColor,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: 'Admin Settings',
            expandedHeight: 160,
            expandedContent: FlexibleSpaceBar(
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
                          _buildStatusPill('Live', Colors.green),
                          SizedBox(width: 10.w),
                          _buildStatusPill('Admin mode', Colors.white70),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppPadding.basePagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Platform Controls'),
                  SizedBox(height: 14.h),
                  _buildSettingCard(
                    title: 'Auto approve new users',
                    subtitle:
                        'Allow staff and parents to sign up without manual approval.',
                    value: _autoApproveUsers,
                    onChanged:
                        (value) => setState(() => _autoApproveUsers = value),
                  ),
                  SizedBox(height: 14.h),
                  _buildSettingCard(
                    title: 'Maintenance mode',
                    subtitle:
                        'Temporarily disable access while you perform updates.',
                    value: _maintenanceMode,
                    onChanged:
                        (value) => setState(() => _maintenanceMode = value),
                  ),
                  SizedBox(height: 24.h),
                  _buildSectionHeader('Notifications'),
                  SizedBox(height: 14.h),
                  _buildSettingCard(
                    title: 'Daily reports',
                    subtitle: 'Send summary reports to admins every morning.',
                    value: _dailyReports,
                    onChanged: (value) => setState(() => _dailyReports = value),
                  ),
                  SizedBox(height: 14.h),
                  _buildSettingCard(
                    title: 'Email notifications',
                    subtitle:
                        'Receive notifications for user activity and critical alerts.',
                    value: _emailNotifications,
                    onChanged:
                        (value) => setState(() => _emailNotifications = value),
                  ),
                  SizedBox(height: 14.h),
                  _buildSettingCard(
                    title: 'SMS alerts',
                    subtitle: 'Enable urgent alert SMS for system events.',
                    value: _smsAlerts,
                    onChanged: (value) => setState(() => _smsAlerts = value),
                  ),
                  SizedBox(height: 24.h),
                  _buildSectionHeader('Security & Access'),
                  SizedBox(height: 14.h),
                  _buildActionTile(
                    title: 'Password policy',
                    subtitle: 'Require strong passwords and periodic resets.',
                    icon: Icons.lock_outline,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  _buildActionTile(
                    title: 'User roles',
                    subtitle:
                        'Manage permissions for admins, teachers, students and parents.',
                    icon: Icons.supervisor_account_outlined,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  _buildActionTile(
                    title: 'Audit logs',
                    subtitle: 'Review system activity and security events.',
                    icon: Icons.history_edu,
                    onTap: () {},
                  ),
                  SizedBox(height: 28.h),
                  _buildDangerZone(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusPill(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color == Colors.white70 ? Colors.white70 : color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: AppColor.primaryColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(18.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(18.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(icon, color: AppColor.primaryColor, size: 24.r),
              ),
              SizedBox(width: 14.w),
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
                    SizedBox(height: 6.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18.r,
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDangerZone() {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Colors.red.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Danger zone',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Reset system settings or revoke access for all users in case of a security incident.',
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.red.shade700.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: BorderSide(color: Colors.red.shade200),
                  ),
                  child: const Text('Reset settings'),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Revoke access'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
