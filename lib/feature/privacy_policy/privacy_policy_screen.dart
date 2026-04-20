import 'package:flutter/material.dart';
import 'package:school_management/core/common/custom_app_bar/custom_app_bar.dart';
import 'package:school_management/feature/privacy_policy/widget/privacy_policy_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: CustomAppBar(
        title: const Text("Privacy Policy"),
        showBackButton: true,
      ),
      body: const PrivacyPolicyWidget(),
    );
  }
}
