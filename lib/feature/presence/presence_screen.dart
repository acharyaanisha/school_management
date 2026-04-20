import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class PresenceScreen extends StatefulWidget {
  const PresenceScreen({super.key});

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

  final Map<DateTime, String> _attendanceData = {
    DateTime(2026, 3, 1): "present",
    DateTime(2026, 3, 2): "present",
    DateTime(2026, 3, 6): "absent",
    DateTime(2026, 3, 8): "leave",
    DateTime(2026, 3, 10): "present",
    DateTime(2026, 3, 22): "absent",
  };

  final int totalWorkingDays = 27;
  final int presentDays = 18;
  final int absentDays = 6;

  Color _getStatusColor(DateTime day) {
    DateTime date = DateTime(day.year, day.month, day.day);
    String? status = _attendanceData[date];

    switch (status) {
      case "present":
        return Colors.blue;
      case "absent":
        return Colors.red;
      case "leave":
        return Colors.orange;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: AppPadding.basePagePadding,
              child: Column(
                children: [
                  _buildCalendarCard(),
                  SizedBox(height: 20.h),
                  _buildLegend(),
                  SizedBox(height: 20.h),
                  _buildAttendanceSummary(presentDays / totalWorkingDays),
                  SizedBox(height: 20.h),
                  _buildSectionHeader("Recent Activity"),
                  SizedBox(height: 15.h),
                  _buildAttendanceList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
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
                    "Attendance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Academic Year 2023-24",
                    style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: () {}, child: const Text("View All")),
      ],
    );
  }

  Widget _buildAttendanceList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildAttendanceCard(
          date: "${20 - index} Oct 2023",
          day: "Weekday",
          status: index == 1 ? "Absent" : "Present",
        );
      },
    );
  }

  Widget _buildAttendanceCard({
    required String date,
    required String day,
    required String status,
  }) {
    bool isPresent = status == "Present";
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color:
                  isPresent
                      ? Colors.green.withValues(alpha: 0.1)
                      : Colors.red.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPresent ? Icons.calendar_today : Icons.event_busy,
              color: isPresent ? Colors.green : Colors.red,
              size: 20.r,
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  day,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Text(
            status,
            style: TextStyle(
              color: isPresent ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Container(
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
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
          leftChevronIcon: const Icon(
            Icons.chevron_left,
            color: Color(0xff27A59D),
          ),
          rightChevronIcon: const Icon(
            Icons.chevron_right,
            color: Color(0xff27A59D),
          ),
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            Color statusColor = _getStatusColor(day);
            return Container(
              margin: const EdgeInsets.all(6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                '${day.day}',
                style: TextStyle(
                  color:
                      statusColor == Colors.transparent
                          ? Colors.black87
                          : statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          todayBuilder: (context, day, focusedDay) {
            return Container(
              margin: const EdgeInsets.all(6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xff27A59D),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                '${day.day}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _legendItem(Colors.blue, "Present"),
        SizedBox(width: 15.w),
        _legendItem(Colors.orange, "Leave"),
        SizedBox(width: 15.w),
        _legendItem(Colors.red, "Absent"),
      ],
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        SizedBox(width: 6.w),
        Text(label, style: TextStyle(fontSize: 12.sp, color: Colors.black54)),
      ],
    );
  }

  Widget _buildAttendanceSummary(double percentage) {
    return Card(
      color: context.applyAppColor(palette: ColorPalette.primary, swatch: 100),
      child: Padding(
        padding: AppPadding.contentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${(percentage * 100).toInt()}% Attendance",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(height: 10.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: percentage,
                minHeight: 12.h,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(
                  context.applyAppColor(palette: ColorPalette.primary),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(
                  "Working Days",
                  totalWorkingDays.toString(),
                  Colors.black,
                ),
                _buildStatCard("Present", presentDays.toString(), Colors.blue),
                _buildStatCard("Absent", absentDays.toString(), Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 11.sp)),
          SizedBox(height: 5.h),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
