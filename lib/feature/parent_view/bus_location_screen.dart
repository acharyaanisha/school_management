import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class BusLocationScreen extends StatefulWidget {
  const BusLocationScreen({super.key});

  @override
  State<BusLocationScreen> createState() => _BusLocationScreenState();
}

class _BusLocationScreenState extends State<BusLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: "Bus Tracking",
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
                                    hintText: "Search by bus number...",
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
              child: _buildBusTrackingContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusTrackingContent() {
    return Column(
      children: [
        // Active Buses
        _buildSectionHeader("Active Routes", "Refresh"),
        SizedBox(height: 12.h),
        _buildBusCard(
          "Route 101",
          "Bus #SB-1501",
          "In Transit",
          "7:45 AM",
          "10 mins away",
          Colors.green,
          "Driver: Mr. Kumar",
          "12/15 students on board",
        ),
        SizedBox(height: 12.h),
        _buildBusCard(
          "Route 205",
          "Bus #SB-2340",
          "Stopped",
          "8:15 AM",
          "Parked at Zone-C",
          Colors.orange,
          "Driver: Mr. Singh",
          "18/18 students on board",
        ),
        SizedBox(height: 12.h),
        _buildBusCard(
          "Route 312",
          "Bus #SB-3102",
          "In Transit",
          "8:30 AM",
          "5 mins away",
          Colors.blue,
          "Driver: Mr. Patel",
          "14/18 students on board",
        ),

        SizedBox(height: 24.h),

        // Children Status
        _buildSectionHeader("My Children", ""),
        SizedBox(height: 12.h),

        // Emma - Bus 1
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Emma Johnson",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Route 101 | Bus #SB-1501",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
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
                          "On Bus",
                          style: TextStyle(
                            fontSize: 11.sp,
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
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "📍 Current Location",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Updated 2 mins ago",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Main Street, Near Market Complex",
                      style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "ETA: 10 minutes | Distance: 2.5 km",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.map, size: 18.r),
                      label: Text("View Map"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_active, size: 18.r),
                      label: Text("Notify"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 12.h),

        // Michael - Bus 3
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Michael Johnson",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Route 312 | Bus #SB-3102",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
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
                    child: Row(
                      children: [
                        Icon(Icons.circle, color: Colors.blue, size: 8.r),
                        SizedBox(width: 4.w),
                        Text(
                          "On Bus",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "📍 Current Location",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Updated 1 min ago",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Broadway Avenue, Near School Gate",
                      style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "ETA: 5 minutes | Distance: 1.8 km",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.map, size: 18.r),
                      label: Text("View Map"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_active, size: 18.r),
                      label: Text("Notify"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Emergency Alert
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Icon(Icons.emergency, color: Colors.red, size: 28.r),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Emergency Contact",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Call Transport Manager: +1-XXX-XXX-XXXX",
                      style: TextStyle(fontSize: 12.sp, color: Colors.red[700]),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.call, color: Colors.red, size: 24.r),
              ),
            ],
          ),
        ),
      ],
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

  Widget _buildBusCard(
    String route,
    String busNumber,
    String status,
    String departureTime,
    String location,
    Color statusColor,
    String driverInfo,
    String studentCount,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    route,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    busNumber,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: statusColor.withValues(alpha: 0.3)),
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
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "🕐 Departure: $departureTime",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  driverInfo,
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey[700]),
                ),
                SizedBox(height: 4.h),
                Text(
                  studentCount,
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
