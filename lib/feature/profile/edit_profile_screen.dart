import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_icons.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/core/common/custom_button/custom_button.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_generator.dart';
import 'package:school_management/core/typography/color_extension.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
        label: "Full Name",
        isRequired: true,
        id: 'fullName',
      ),
      CustomFormFieldConfig(
        fieldType: FieldType.email,
        label: "Email Address",
        isRequired: true,
        id: 'email',
      ),
      CustomFormFieldConfig(
        fieldType: FieldType.number,
        label: "Phone Number",
        isRequired: true,
        id: 'phoneNumber',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDynamicHeader(),

            const SizedBox(height: 30),

            Padding(
              padding: AppPadding.basePagePadding,
              child: Column(
                children: [
                  Padding(
                    padding: AppPadding.formFieldLabelPadding,
                    child: CustomFormFieldGenerator(
                      onFieldSubmitted: (data) {
                        formData = data;

                        if (_formKey.currentState!.validate()) {}
                      },
                      updateData: {
                        'fullName': "Name Placeholder",
                        'email': "useremail@gmail.com",
                        'address': "123 Main St, City, Country",
                        'phoneNumber': "123-456-7890",
                      },
                      formKey: _formKey,
                      formFields: formFields,
                    ),
                  ),

                  CustomBorderButton(
                    height: 30,
                    label: "Save Changes",
                    // getLocalizedString(
                    //   context: context,
                    //   resString: ResString.logout,
                    // ),
                    onPressed: () {},
                  ),
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
            context.applyAppColor(palette: ColorPalette.primary),
            context
                .applyAppColor(palette: ColorPalette.primary)
                .withValues(alpha: 0.8),
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
            color: context
                .applyAppColor(palette: ColorPalette.primary)
                .withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 15.h,
            bottom: 20.h,
            left: 25.w,
            right: 25.w,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: AppIcons.arrowBack,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
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
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundColor: Colors.white,
                      backgroundImage: const NetworkImage(
                        "https://ui-avatars.com/api/?name=User+Name&background=random",
                      ),
                    ),
                  ),
                  Positioned(
                    right: 3,
                    bottom: 3,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 20.r,
                        color: context.applyAppColor(
                          palette: ColorPalette.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
