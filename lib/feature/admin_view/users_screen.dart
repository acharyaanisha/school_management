import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final List<Map<String, String>> _users = [
    {
      'name': 'Amina Khan',
      'role': 'Teacher',
      'email': 'amina.khan@school.edu',
      'status': 'Active',
      'lastActive': '5 min ago',
    },
    {
      'name': 'Sunil Sharma',
      'role': 'Student',
      'email': 'sunil.sharma@school.edu',
      'status': 'Pending',
      'lastActive': '2h ago',
    },
    {
      'name': 'Priya Patel',
      'role': 'Parent',
      'email': 'priya.patel@family.com',
      'status': 'Active',
      'lastActive': '10 min ago',
    },
    {
      'name': 'Rohan Gupta',
      'role': 'Admin',
      'email': 'rohan.gupta@school.edu',
      'status': 'Suspended',
      'lastActive': '1 day ago',
    },
    {
      'name': 'Meera Joshi',
      'role': 'Teacher',
      'email': 'meera.joshi@school.edu',
      'status': 'Active',
      'lastActive': '20 min ago',
    },
  ];

  String _activeFilter = 'All';
  final List<String> _filters = [
    'All',
    'Students',
    'Teachers',
    'Parents',
    'Admins',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredUsers =
        _activeFilter == 'All'
            ? _users
            : _users
                .where(
                  (user) =>
                      user['role']!.toLowerCase() ==
                      _activeFilter.toLowerCase().replaceAll('s', ''),
                )
                .toList();

    return Scaffold(
      backgroundColor: AppColor.pageBodyColor,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: 'User Management',
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
                                        .textStyle(palette: ColorPalette.detail)
                                        .small
                                        .regular,
                                decoration: InputDecoration(
                                  hintText: "Search users, roles...",
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
          SliverToBoxAdapter(
            child: Padding(
              padding: AppPadding.basePagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryCards(),
                  SizedBox(height: 20.h),
                  _buildFilterChips(),
                  SizedBox(height: 20.h),
                  Text(
                    'Users',
                    style:
                        context
                            .textStyle(palette: ColorPalette.primary)
                            .header5,
                  ),
                  SizedBox(height: 12.h),
                  ...filteredUsers.map((user) => _buildUserCard(user)).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard('Total Users', '1,247', Colors.purple),
        ),
        SizedBox(width: 12.w),
        Expanded(child: _buildSummaryCard('Active', '1,102', Colors.green)),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value, Color accentColor) {
    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              color: accentColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.group, color: accentColor, size: 24.r),
          ),
          SizedBox(height: 16.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            _filters.map((filter) {
              final selected = _activeFilter == filter;
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: ChoiceChip(
                  label: Text(filter),
                  selected: selected,
                  selectedColor: AppColor.primaryColor,
                  onSelected: (_) {
                    setState(() {
                      _activeFilter = filter;
                    });
                  },
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : Colors.black87,
                    fontSize: 14.sp,
                  ),
                  checkmarkColor: Colors.white,
                  backgroundColor: Colors.grey.shade200,
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildUserCard(Map<String, String> user) {
    final status = user['status'] ?? '';
    final statusColor =
        status == 'Active'
            ? Colors.green
            : status == 'Pending'
            ? Colors.orange
            : Colors.red;

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundColor: Colors.blue.shade50,
                child: Text(
                  user['name']!.split(' ').map((e) => e[0]).take(2).join(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user['name'] ?? '',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${user['role']} • ${user['email']}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last active: ${user['lastActive']}',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 20.r,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      size: 20.r,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
