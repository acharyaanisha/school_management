import 'package:flutter/material.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/constant/key_string.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_generator.dart';
import 'package:school_management/core/common/custom_navigation_bar/bottom_navigation_bar.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';
import 'package:school_management/core/utils/shared_pref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, dynamic> formData = {};
  final _formKey = GlobalKey<FormState>();
  List<CustomFormFieldConfig> formFields = [];

  @override
  void initState() {
    super.initState();
    getInitialData();
  }

  void getInitialData() {
    formFields = [
      CustomFormFieldConfig(
        fieldType: FieldType.text,
        label: "Email or Phone Number",
        isRequired: true,
        id: 'emailOrPhone',
      ),
      CustomFormFieldConfig(
        fieldType: FieldType.password,
        label: "Password",
        isRequired: true,
        id: 'password',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.school,
                  size: 80,
                  color: context.applyAppColor(palette: ColorPalette.primary),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Login to manage your school profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 40),

                Padding(
                  padding: AppPadding.formFieldLabelPadding,
                  child: CustomFormFieldGenerator(
                    onFieldSubmitted: (data) {
                      formData = data;

                      if (_formKey.currentState!.validate()) {}
                    },
                    formKey: _formKey,
                    formFields: formFields,
                  ),
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    // }
                    SharedPref.setBoolValue(KeyString.isLoginUser.name, true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: context.applyAppColor(
                      palette: ColorPalette.primary,
                    ),
                  ),
                  child: Text(
                    "LOGIN",
                    style:
                        context
                            .textStyle(palette: ColorPalette.white)
                            .small
                            .bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
