import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.w),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildBalanceCard(),
                SizedBox(height: 25.h),
                _buildSectionHeader("Payment History"),
                SizedBox(height: 15.h),
                _buildHistoryList(),
              ],
            ),
          ),
        ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fees & Payments",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Manage school tuition and dues",
                style: TextStyle(color: Colors.white70, fontSize: 13.sp),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: const Icon(Icons.receipt_long, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: EdgeInsets.all(25.w),
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
      child: Column(
        children: [
          Text(
            "Total Outstanding",
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            "Rs. 1,250.00",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
              color: const Color(0xFF14524E),
            ),
          ),
          SizedBox(height: 20.h),
          Divider(color: Colors.grey.shade100),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMiniInfo("Due Date", "Oct 30, 2023"),
              _buildMiniInfo("Child", "Student Name"),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff27A59D),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 0,
              ),
              child: const Text(
                "PAY NOW",
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 11.sp)),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ],
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

  Widget _buildHistoryList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildPaymentCard(
          title: index == 0 ? "Quarterly Tuition" : "Library Fine",
          date: "15 Sep 2023",
          amount: index == 0 ? "Rs. 850.00" : "Rs. 15.00",
          status: index == 2 ? "Pending" : "Paid",
        );
      },
    );
  }

  Widget _buildPaymentCard({
    required String title,
    required String date,
    required String amount,
    required String status,
  }) {
    bool isPaid = status == "Paid";
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(18.w),
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
              color: (isPaid ? Colors.green : Colors.orange).withValues(
                alpha: 0.1,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPaid ? Icons.check_circle_outline : Icons.schedule,
              color: isPaid ? Colors.green : Colors.orange,
              size: 24.r,
            ),
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
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Text(
                status,
                style: TextStyle(
                  color: isPaid ? Colors.green : Colors.orange,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
