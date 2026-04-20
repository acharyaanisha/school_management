import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  // Logic to switch colors based on status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'submitted':
        return Colors.blue;
      case 'graded':
        return Colors.green;
      case 'late':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: Column(
        children: [
          _buildModernHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildProgressSummary(),
                SizedBox(height: 25.h),
                _buildSectionTitle("Active Assignments"),
                SizedBox(height: 15.h),
                _buildAssignmentCard(
                  title: "Advanced Quantum Physics",
                  subject: "Science",
                  dueDate: "Tomorrow, 10:00 AM",
                  status: "Pending",
                  icon: Icons.science_outlined,
                ),
                _buildAssignmentCard(
                  title: "Modern World History",
                  subject: "Social Studies",
                  dueDate: "24 Oct 2023",
                  status: "Submitted",
                  icon: Icons.history_edu,
                ),
                _buildAssignmentCard(
                  title: "Calculus III - Integration",
                  subject: "Mathematics",
                  dueDate: "20 Oct 2023",
                  status: "Graded",
                  icon: Icons.functions,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernHeader() {
    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 25.w,
        right: 25.w,
        bottom: 25.h,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF14524E), Color(0xff27A59D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assignments",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Keep track of your tasks",
                style: TextStyle(color: Colors.white70, fontSize: 14.sp),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSummary() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 60.r,
                width: 60.r,
                child: CircularProgressIndicator(
                  value: 0.7,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xff27A59D),
                  ),
                ),
              ),
              Text(
                "70%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weekly Progress",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Text(
                "7/10 Assignments completed",
                style: TextStyle(color: Colors.grey, fontSize: 13.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildAssignmentCard({
    required String title,
    required String subject,
    required String dueDate,
    required String status,
    required IconData icon,
  }) {
    Color statusColor = _getStatusColor(status);

    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(icon, color: statusColor, size: 28.r),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  "$subject • Due $dueDate",
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
