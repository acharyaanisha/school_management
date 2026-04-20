import 'package:flutter/material.dart';

enum FieldType {
  password,
  confirmPassword,
  email,
  phone,
  text,
  datePicker,
  dateRangePicker,
  country,
  imageUpload,
  dropDown,
  overlayDropDown,
  checkBox,
  number,
  switchs,
  amount,
  multiLine,
  uploadMultiImage,
  selectCategory,
  customValueDropDown,
}

@immutable
class CustomFormFieldConfig {
  final String label;
  final bool? showLabel;
  final int? group;
  final String? groupTitle;
  final bool? enabled;
  final String? hintText;
  final Widget? prefixIcon;
  final FieldType fieldType;
  final TextEditingController? controller;
  final dynamic initialValue;
  final bool? isRequired;
  final VoidCallback? onTap;
  final bool? dropDownBottomButtonVisible;
  final Function(dynamic)? onFieldSubmitted;
  final bool? isObscure;
  final Function(String)? onChanged;
  final Future<List<Map<String, dynamic>>> Function(String?)?
      getDependentOptions;
  final Function(String?)? onSaved;
  final List? options;
  final String id;
  final String groupId;
  final dynamic rules;
  final Map? updateData;
  final bool? textCapitalization;
  final TextStyle? style;
  final String? maskedInputCountryCode;
  final bool? isLogIn;
  final Color? fieldColor;
  final Widget? suffixIcon;
  final bool? enableCaps;
  final int? maxLines;
  final double? height;
  final double? width;
  final double? radius;
  final bool? dynamicForm;
  final Function(BuildContext)? dropDownButtonOnTap;
  final String? dropDownButtonText;
  final IconData? dropDownButtonIcon;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? dateFormat;
  final String? dependsOn;
  final bool allowMultipleImages;
  final bool allowCamera;
  final bool allowGallery;

  const CustomFormFieldConfig({
    this.initialDate,
    this.firstDate,
    this.groupTitle = '',
    this.dependsOn,
    this.group = 1,
    this.lastDate,
    this.showLabel = true,
    this.dateFormat = 'yyyy-MM-dd',
    this.initialValue,
    this.dropDownButtonOnTap,
    this.dropDownButtonIcon,
    this.dropDownButtonText,
    this.dropDownBottomButtonVisible = false,
    this.dynamicForm,
    this.radius,
    this.groupId = '',
    this.maxLines,
    this.onTap,
    this.height,
    this.width,
    this.onFieldSubmitted,
    this.isObscure,
    this.onChanged,
    this.onSaved,
    this.options,
    required this.id,
    this.rules,
    this.textCapitalization,
    this.style,
    this.maskedInputCountryCode,
    this.isLogIn = true,
    this.fieldColor,
    this.suffixIcon,
    this.enableCaps = false,
    this.updateData,
    required this.label,
    this.enabled = true,
    this.hintText,
    this.prefixIcon,
    required this.fieldType,
    this.controller,
    this.isRequired = false,
    this.getDependentOptions,
    this.allowMultipleImages = false,
    this.allowCamera = true,
    this.allowGallery = true,
  });

  CustomFormFieldConfig copyWith({
    String? label,
    int? maxLine,
    int? group,
    String? dependsOn,
    double? height,
    double? width,
    bool? showLabel,
    bool? enabled,
    String? hintText,
    Widget? prefixIcon,
    FieldType? fieldType,
    TextEditingController? controller,
    dynamic initialValue,
    bool? isRequired,
    VoidCallback? onTap,
    Function(dynamic)? onFieldSubmitted,
    bool? isObscure,
    Function(String)? onChanged,
    Function(String?)? onSaved,
    List? options,
    String? id,
    dynamic rules,
    Map? updateData,
    bool? textCapitalization,
    TextStyle? style,
    String? maskedInputCountryCode,
    bool? isLoggedIn,
    Color? fieldColor,
    Widget? suffixIcon,
    bool? enableCaps,
    bool? dropDownBottomButtonVisible,
    final Function(BuildContext)? dropDownButtonOnTap,
    final String? dropDownButtonText,
    final IconData? dropDownButtonIcon,
    final DateTime? initialDate,
    final DateTime? firstDate,
    final DateTime? lastDate,
    final String? dateFormat,
    final String? groupTitle,
    Future<List<Map<String, dynamic>>> Function(String?)? getDependentOptions,
    bool? allowMultipleImages,
    bool? allowCamera,
    bool? allowGallery,
  }) {
    return CustomFormFieldConfig(
      groupTitle: groupTitle ?? this.groupTitle,
      getDependentOptions: getDependentOptions ?? this.getDependentOptions,
      dependsOn: dependsOn ?? this.dependsOn,
      initialValue: initialValue ?? this.initialValue,
      group: group ?? this.group,
      initialDate: initialValue ?? this.initialDate,
      firstDate: initialValue ?? this.firstDate,
      lastDate: initialValue ?? this.lastDate,
      showLabel: showLabel ?? this.showLabel,
      dateFormat: initialValue ?? this.dateFormat,
      dropDownButtonOnTap: initialValue ?? this.dropDownButtonOnTap,
      dropDownBottomButtonVisible:
          dropDownBottomButtonVisible ?? this.dropDownBottomButtonVisible,
      dropDownButtonText: dropDownButtonText ?? this.dropDownButtonText,
      dropDownButtonIcon: dropDownButtonIcon ?? this.dropDownButtonIcon,
      onTap: onTap ?? this.onTap,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      isObscure: isObscure ?? this.isObscure,
      onChanged: onChanged ?? this.onChanged,
      onSaved: onSaved ?? this.onSaved,
      options: options ?? this.options,
      id: id ?? this.id,
      rules: rules ?? this.rules,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      style: style ?? this.style,
      maskedInputCountryCode:
          maskedInputCountryCode ?? this.maskedInputCountryCode,
      isLogIn: isLogIn ?? isLogIn,
      fieldColor: fieldColor ?? this.fieldColor,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      enableCaps: enableCaps ?? this.enableCaps,
      updateData: updateData ?? this.updateData,
      label: label ?? this.label,
      maxLines: maxLine ?? maxLines,
      height: height ?? this.height,
      width: width ?? this.width,
      enabled: enabled ?? this.enabled,
      hintText: hintText ?? this.hintText,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      fieldType: fieldType ?? this.fieldType,
      controller: controller ?? this.controller,
      isRequired: isRequired ?? this.isRequired,
      allowMultipleImages: allowMultipleImages ?? this.allowMultipleImages,
      allowCamera: allowCamera ?? this.allowCamera,
      allowGallery: allowGallery ?? this.allowGallery,
    );
  }
}
