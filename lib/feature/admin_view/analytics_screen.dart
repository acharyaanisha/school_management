import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_app_bar/custom_sliver_app_bar.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final List<Map<String, String>> _keyMetrics = [
    {
      'label': 'User Growth',
      'value': '+24%',
      'subtext': 'Last 30 days',
      'color': '0xFF2196F3',
    },
    {
      'label': 'Attendance',
      'value': '88%',
      'subtext': 'Today',
      'color': '0xFF4CAF50',
    },
    {
      'label': 'Active Sessions',
      'value': '1,152',
      'subtext': 'Live now',
      'color': '0xFFFFC107',
    },
    {
      'label': 'Reports',
      'value': '32',
      'subtext': 'Pending review',
      'color': '0xFF9C27B0',
    },
  ];

  final List<Map<String, dynamic>> _insightCards = [
    {
      'title': 'Student Engagement',
      'description': 'Average daily activity rate across classes.',
      'percentage': '76%',
      'trend': 'up',
    },
    {
      'title': 'Teacher Response',
      'description': 'Average response time to student queries.',
      'percentage': '92%',
      'trend': 'up',
    },
  ];

  String _selectedPeriod = 'Monthly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pageBodyColor,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: 'Analytics',
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
                          _buildChip('Weekly'),
                          SizedBox(width: 10.w),
                          _buildChip('Monthly'),
                          SizedBox(width: 10.w),
                          _buildChip('Yearly'),
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
                  _buildMetricGrid(),
                  SizedBox(height: 24.h),
                  _buildSectionHeader('Engagement Trends'),
                  SizedBox(height: 14.h),
                  _buildTrendChartPlaceholder(),
                  SizedBox(height: 24.h),
                  _buildSectionHeader('Actionable Insights'),
                  SizedBox(height: 14.h),
                  ..._insightCards
                      .map((item) => _buildInsightCard(item))
                      .toList(),
                  SizedBox(height: 24.h),
                  _buildSectionHeader('Top Departments'),
                  SizedBox(height: 14.h),
                  _buildDepartmentTable(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    final selected = _selectedPeriod == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPeriod = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? AppColor.whiteColor : Colors.white24,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selected ? AppColor.primaryColor : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppColor.primaryColor : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildMetricGrid() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _keyMetrics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14.h,
        crossAxisSpacing: 14.w,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final item = _keyMetrics[index];
        return Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: Color(int.parse(item['color']!)).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.insert_chart_outlined,
                  color: Color(int.parse(item['color']!)),
                  size: 22.r,
                ),
              ),
              Spacer(),
              Text(
                item['value']!,
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6.h),
              Text(
                item['label']!,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
              ),
              SizedBox(height: 4.h),
              Text(
                item['subtext']!,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
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
            'View all',
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrendChartPlaceholder() {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.all(18.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Monthly engagement trend',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                '+12.4%',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          Expanded(
            child: Center(
              child: Text(
                'Chart placeholder',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade400),
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTrendDot(label: 'Jan', active: false),
              _buildTrendDot(label: 'Feb', active: true),
              _buildTrendDot(label: 'Mar', active: false),
              _buildTrendDot(label: 'Apr', active: false),
              _buildTrendDot(label: 'May', active: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrendDot({required String label, bool active = false}) {
    return Column(
      children: [
        Container(
          width: 10.r,
          height: 10.r,
          decoration: BoxDecoration(
            color: active ? AppColor.primaryColor : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildInsightCard(Map<String, dynamic> item) {
    final isUp = item['trend'] == 'up';
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              isUp ? Icons.trending_up : Icons.trending_down,
              color: AppColor.primaryColor,
              size: 26.r,
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  item['description'],
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            item['percentage'],
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: isUp ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentTable() {
    final rows = [
      {'department': 'Mathematics', 'score': '92%', 'status': 'Strong'},
      {'department': 'Science', 'score': '87%', 'status': 'Good'},
      {'department': 'Languages', 'score': '81%', 'status': 'Improving'},
    ];

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Department',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Text(
                'Score',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              SizedBox(width: 24.w),
              Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          ...rows.map(
            (row) => Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      row['department']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    row['score']!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      row['status']!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
