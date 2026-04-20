import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_button/custom_button.dart';
import 'package:school_management/feature/authentication/logout/logout_popup.dart';

enum UserRole { student, teacher, admin, parent }

class ProfileData {
  final String name;
  final String email;
  final String? id;
  final String? role;
  final String? department;
  final String? grade;
  final String? major;
  final String? position;
  final String? experience;
  final List<ProfileMenuItem> menuItems;
  final List<Widget> dashboardCards;
  final List<QuickAction> quickActions;

  const ProfileData({
    required this.name,
    required this.email,
    this.id,
    this.role,
    this.department,
    this.grade,
    this.major,
    this.position,
    this.experience,
    required this.menuItems,
    required this.dashboardCards,
    required this.quickActions,
  });
}

class ProfileMenuItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool isLast;

  const ProfileMenuItem({
    required this.icon,
    required this.title,
    this.onTap,
    this.isLast = false,
  });
}

class QuickAction {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

class ProfileTemplate extends StatefulWidget {
  final ProfileData profileData;
  final UserRole userRole;

  const ProfileTemplate({
    super.key,
    required this.profileData,
    required this.userRole,
  });

  @override
  State<ProfileTemplate> createState() => _ProfileTemplateState();
}

class _ProfileTemplateState extends State<ProfileTemplate>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildDynamicHeader(),
            SizedBox(height: 24.h),
            Padding(
              padding: AppPadding.basePagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserInfoCard(),
                  SizedBox(height: 24.h),
                  ...widget.profileData.dashboardCards,
                  if (widget.profileData.quickActions.isNotEmpty) ...[
                    SizedBox(height: 24.h),
                    _buildQuickActions(),
                  ],
                  SizedBox(height: 24.h),
                  _buildMenuSection(),
                  SizedBox(height: 32.h),
                  _buildLogoutSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColor.withValues(alpha: 0.8),
            AppColor.successColor.withValues(alpha: 0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 25.w),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.4),
                        width: 5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 65.r,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        "https://ui-avatars.com/api/?name=${widget.profileData.name.replaceAll(' ', '+')}&background=219189&color=fff&size=256",
                      ),
                      child: Icon(
                        _getRoleIcon(),
                        size: 70.r,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Icon(
                        Icons.verified,
                        size: 20.r,
                        color: AppColor.successColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                widget.profileData.name,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                  shadows: [const Shadow(color: Colors.black26, blurRadius: 5)],
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                widget.profileData.email,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  _getRoleDisplayText(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getRoleIcon() {
    switch (widget.userRole) {
      case UserRole.student:
        return Icons.school;
      case UserRole.teacher:
        return Icons.person;
      case UserRole.admin:
        return Icons.admin_panel_settings;
      case UserRole.parent:
        return Icons.family_restroom;
    }
  }

  String _getRoleDisplayText() {
    switch (widget.userRole) {
      case UserRole.student:
        return '${widget.profileData.grade} • ${widget.profileData.major}';
      case UserRole.teacher:
        return '${widget.profileData.position} • ${widget.profileData.department}';
      case UserRole.admin:
        return widget.profileData.role ?? 'Administrator';
      case UserRole.parent:
        return 'Parent';
    }
  }

  Widget _buildUserInfoCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(_getRoleIcon(), color: AppColor.primaryColor, size: 24.r),
              SizedBox(width: 12.w),
              Text(
                '${_getRoleTitle()} Information',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          if (widget.profileData.id != null)
            _buildInfoRow('ID', widget.profileData.id!),
          if (widget.profileData.role != null)
            _buildInfoRow('Role', widget.profileData.role!),
          if (widget.profileData.department != null)
            _buildInfoRow('Department', widget.profileData.department!),
          if (widget.profileData.position != null)
            _buildInfoRow('Position', widget.profileData.position!),
          if (widget.profileData.experience != null)
            _buildInfoRow('Experience', widget.profileData.experience!),
          _buildInfoRow('Join Date', 'Fall 2022'),
          _buildInfoRow('Status', 'Active'),
        ],
      ),
    );
  }

  String _getRoleTitle() {
    switch (widget.userRole) {
      case UserRole.student:
        return 'Student';
      case UserRole.teacher:
        return 'Teacher';
      case UserRole.admin:
        return 'Admin';
      case UserRole.parent:
        return 'Parent';
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
              widget.profileData.quickActions.map((action) {
                return _buildQuickActionButton(
                  action.icon,
                  action.label,
                  action.onTap,
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuickActionButton(
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColor.primaryColor.withValues(alpha: 0.2),
              ),
            ),
            child: Icon(icon, color: AppColor.primaryColor, size: 24.r),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Settings',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
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
            children:
                widget.profileData.menuItems.map((item) {
                  return _buildMenuItem(
                    item.icon,
                    item.title,
                    item.onTap,
                    isLast: item.isLast,
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback? onTap, {
    bool isLast = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: AppColor.primaryColor, size: 22.r),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14.r,
          color: Colors.grey[400],
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
        shape:
            isLast
                ? null
                : Border(bottom: BorderSide(color: Colors.grey[100]!)),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
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
          CustomBorderButton(
            height: 50.h,
            label: "Logout",
            onPressed: () {
              LogoutPopup.show(context);
            },
          ),
          SizedBox(height: 12.h),
          Text(
            'Version 1.0.0',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
