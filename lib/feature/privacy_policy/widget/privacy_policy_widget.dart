import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget>
    with TickerProviderStateMixin {
  late List<bool> _expandedSections;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _expandedSections = List.filled(7, false);
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeController,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPolicySectionCard(
                    index: 0,
                    icon: Icons.info_outline,
                    title: "Information We Collect",
                    preview: "Personal, academic, and contact information...",
                    details: [
                      "• Names and contact details",
                      "• Student academic records and performance",
                      "• Attendance and behavioral records",
                      "• Parent/Guardian information",
                      "• Device information and usage data",
                    ],
                    color: Colors.blue,
                  ),
                  SizedBox(height: 12.h),
                  _buildPolicySectionCard(
                    index: 1,
                    icon: Icons.check_circle_outline,
                    title: "How We Use Your Data",
                    preview: "Data is used for educational purposes...",
                    details: [
                      "• Managing academic records and grades",
                      "• Tracking attendance and performance",
                      "• Processing payments and fees",
                      "• Sending school announcements",
                      "• Improving system functionality",
                    ],
                    color: Colors.green,
                  ),
                  SizedBox(height: 12.h),
                  _buildPolicySectionCard(
                    index: 2,
                    icon: Icons.child_care,
                    title: "Child Privacy Protection",
                    preview: "Special protections for student data...",
                    details: [
                      "• Extra security for student information",
                      "• Parental consent required for accounts",
                      "• Limited data collection practices",
                      "• No data sharing with advertisers",
                      "• Regular security audits",
                    ],
                    color: Colors.purple,
                  ),
                  SizedBox(height: 12.h),
                  _buildPolicySectionCard(
                    index: 3,
                    icon: Icons.lock_outline,
                    title: "Data Security",
                    preview: "Industry-standard encryption and protection...",
                    details: [
                      "• AES-256 encryption for data at rest",
                      "• HTTPS/TLS for data in transit",
                      "• Regular security audits and penetration testing",
                      "• Secure backup and disaster recovery",
                      "• Limited employee access to sensitive data",
                    ],
                    color: Colors.red,
                  ),
                  SizedBox(height: 12.h),
                  _buildPolicySectionCard(
                    index: 4,
                    icon: Icons.share_outlined,
                    title: "Data Sharing",
                    preview: "How we handle third-party access...",
                    details: [
                      "• No sharing with unauthorized third parties",
                      "• Limited sharing with verified vendors only",
                      "• All vendors bound by data protection agreements",
                      "• Parents can request data deletion",
                      "• Transparent about all data transfers",
                    ],
                    color: Colors.orange,
                  ),
                  SizedBox(height: 12.h),
                  _buildPolicySectionCard(
                    index: 5,
                    icon: Icons.privacy_tip_outlined,
                    title: "Your Privacy Rights",
                    preview: "Your control over your personal data...",
                    details: [
                      "• Right to access your personal data",
                      "• Right to request data correction",
                      "• Right to request data deletion",
                      "• Right to data portability",
                      "• Right to opt-out of non-essential communications",
                    ],
                    color: Colors.teal,
                  ),
                  SizedBox(height: 12.h),
                  _buildPolicySectionCard(
                    index: 6,
                    icon: Icons.contact_support_outlined,
                    title: "Contact & Support",
                    preview: "Questions about privacy? We're here to help...",
                    details: [
                      "• Privacy Officer: privacy@school.edu",
                      "• Support Team: support@school.edu",
                      "• Response time: Within 48 hours",
                      "• Data access requests: Submit via dashboard",
                      "• Emergency contact available 24/7",
                    ],
                    color: Colors.indigo,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            _buildAcceptanceFooter(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColor.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.shield,
              size: 32.r,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Your Privacy Matters",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "We're committed to protecting your personal information and transparency about how we handle your data.",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicySectionCard({
    required int index,
    required IconData icon,
    required String title,
    required String preview,
    required List<String> details,
    required Color color,
  }) {
    final isExpanded = _expandedSections[index];

    return AnimatedBuilder(
      animation: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _fadeController, curve: Interval(0.1 * index, 0.3 + 0.1 * index)),
      ),
      builder: (context, child) => Transform.translate(
        offset: Offset(0, 20 * (1 - _fadeController.value)),
        child: Opacity(
          opacity: _fadeController.value,
          child: child,
        ),
      ),
      child: Container(
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
            InkWell(
              onTap: () {
                setState(() {
                  _expandedSections[index] = !_expandedSections[index];
                });
              },
              child: Padding(
                padding: EdgeInsets.all(16.r),
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
                    SizedBox(width: 16.w),
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
                            preview,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.expand_more,
                        color: color,
                        size: 24.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: isExpanded
                  ? Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.r),
                          bottomRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: color.withValues(alpha: 0.2), height: 0),
                          SizedBox(height: 12.h),
                          ...details
                              .map((detail) => Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: Text(
                                      detail,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.black.withValues(alpha: 0.7),
                                        height: 1.6,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAcceptanceFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.primaryColor.withValues(alpha: 0.08),
              AppColor.primaryColor.withValues(alpha: 0.04),
            ],
          ),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColor.primaryColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Latest Update",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Last modified: January 2024",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "By using this application, you acknowledge that you have read and understood this privacy policy.",
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black.withValues(alpha: 0.7),
                height: 1.6,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      side: BorderSide(color: AppColor.primaryColor.withValues(alpha: 0.3)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      "Go Back",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primaryColor,
                          AppColor.primaryColor.withValues(alpha: 0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Privacy policy accepted"),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(16.r),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        "I Agree",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}