import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/common/custom_form_field/custom_check_box.dart';
import 'package:school_management/core/common/custom_form_field/custom_drop_down.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';
import 'package:school_management/core/common/custom_form_field/custom_image_picker.dart';
import 'package:school_management/core/common/custom_form_field/custom_multi_line_form_field.dart';
import 'package:school_management/core/common/custom_form_field/custom_switch.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';
import 'package:school_management/core/utils/form_field_decoration.dart';
import 'package:school_management/core/utils/input_formatter.dart';
import 'package:school_management/core/utils/keyboard_selector.dart';
import 'package:school_management/core/utils/validatin.dart';

class CustomFormField extends StatefulWidget {
  final Function(dynamic)? onFieldSubmitted;
  final CustomFormFieldConfig config;
  const CustomFormField({
    super.key,
    required this.config,
    this.onFieldSubmitted,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isHidden = true;

  @override
  void initState() {
    isHidden = widget.config.isObscure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.config.fieldType) {
      case FieldType.text:
        return textFieldWidget();
      case FieldType.multiLine:
        return CustomMultiLineFormField(config: widget.config);
      case FieldType.password:
        return textFieldWidget();
      case FieldType.confirmPassword:
        return textFieldWidget();
      case FieldType.switchs:
        return CustomSwitchFormField(config: widget.config);
      case FieldType.dropDown:
        if (widget.config.options == null) {
          return textFieldWidget();
        } else {
          return CustomDropDownFormField(
            onFieldSubmitted: widget.onFieldSubmitted,
            config: widget.config,
          );
        }
      case FieldType.checkBox:
        if (widget.config.options == null) {
          return textFieldWidget();
        } else {
          return CustomCheckBox(
            onFieldSubmitted: widget.onFieldSubmitted,
            config: widget.config,
          );
        }
      case FieldType.imageUpload:
        return CustomImagePickerFormField(config: widget.config);
      case FieldType.number:
        return textFieldWidget();

      case FieldType.datePicker:
        return dateFieldWidget();

      default:
        return textFieldWidget();
    }
  }

  Widget textFieldWidget() {
    int maxLength = 50;
    if (widget.config.id == 'memberCode') maxLength = 10;
    if (widget.config.fieldType == FieldType.phone) maxLength = 10;

    return TextFormField(
      style:
          context
              .textStyle(palette: ColorPalette.detail, swatch: 700)
              .small
              .regular,
      textCapitalization:
          widget.config.enableCaps == true
              ? TextCapitalization.characters
              : TextCapitalization.none,
      maxLength: maxLength,
      enabled: widget.config.enabled,
      onChanged: widget.config.onChanged ?? widget.config.onFieldSubmitted,
      onFieldSubmitted: (value) {
        widget.onFieldSubmitted?.call(value);
        widget.config.onFieldSubmitted?.call(value);
      },
      onSaved: widget.config.onSaved ?? widget.config.onFieldSubmitted,
      validator: (value) {
        return FormValidator.checkValidation(
          context: context,
          isLogIn: widget.config.isLogIn ?? false,
          isRequired: widget.config.isRequired ?? false,
          value: value ?? "",
          fieldType: widget.config.fieldType,
          label: widget.config.label,
        );
      },
      inputFormatters: InputFormatter.formFieldInputFormatters(
        widget.config.fieldType,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.config.controller!,
      obscureText:
          (widget.config.fieldType == FieldType.password ||
                  widget.config.fieldType == FieldType.confirmPassword)
              ? !isHidden
              : false,
      keyboardType: KeyboardSelector.keyboardType(widget.config.fieldType),
      readOnly: widget.config.fieldType == FieldType.country ? true : false,
      decoration: InputDecoration(
        counterText: "",
        suffixIcon:
            (widget.config.fieldType == FieldType.password ||
                    widget.config.fieldType == FieldType.confirmPassword)
                ? IconButton(
                  color: context.applyAppColor(
                    palette: ColorPalette.detail,
                    swatch: 400,
                  ),
                  icon: Icon(
                    isHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () => setState(() => isHidden = !isHidden),
                )
                : widget.config.suffixIcon,
        errorBorder: FormFieldDecoration.getErrorBorder(context),
        focusedBorder: FormFieldDecoration.getFocusedBorder(context),
        border: FormFieldDecoration.getEnabledBorder(context),
        enabledBorder: FormFieldDecoration.getEnabledBorder(context),
        fillColor: context.applyAppColor(palette: ColorPalette.white),
        filled: true,
        focusColor: widget.config.style == null ? null : Colors.white,
        prefixIcon: widget.config.prefixIcon,
        hintText: widget.config.hintText,
        labelText:
            "${widget.config.label}${(widget.config.isRequired ?? false) ? " * " : ""}",
        labelStyle:
            context
                .textStyle(palette: ColorPalette.detail, swatch: 700)
                .small
                .semiBold,
      ),
    );
  }

  Widget dateFieldWidget() {
    final controller = widget.config.controller!;
    final enabled = widget.config.enabled ?? true;

    String effectiveFormat = (widget.config.dateFormat ?? '').trim();
    if (effectiveFormat.isEmpty) effectiveFormat = 'yyyy-MM-dd';

    Future<void> pick() async {
      final now = DateTime.now();
      final initial = widget.config.initialDate ?? now;
      final first = widget.config.firstDate ?? DateTime(1500);
      final last =
          widget.config.lastDate ??
          DateTime.now().add(const Duration(days: 60));

      final picked = await showDatePicker(
        context: context,
        initialDate:
            initial.isBefore(first)
                ? first
                : (initial.isAfter(last) ? last : initial),
        firstDate: first,
        lastDate: last,
      );

      if (picked != null) {
        final formatted = DateFormat(effectiveFormat).format(picked);
        controller.text = formatted;

        // notify both callbacks like your text field does
        widget.onFieldSubmitted?.call(formatted);
        widget.config.onFieldSubmitted?.call(formatted);

        setState(() {});
      }
    }

    return TextFormField(
      controller: controller,
      readOnly: true,
      enabled: enabled,
      style:
          context
              .textStyle(palette: ColorPalette.detail, swatch: 700)
              .small
              .regular,
      validator: (value) {
        return FormValidator.checkValidation(
          context: context,
          isLogIn: widget.config.isLogIn ?? false,
          isRequired: widget.config.isRequired ?? false,
          value: value ?? "",
          fieldType: widget.config.fieldType,
          label: widget.config.label,
        );
      },
      onTap: enabled ? pick : null,
      onFieldSubmitted: (value) {
        widget.onFieldSubmitted?.call(value);
        widget.config.onFieldSubmitted?.call(value);
      },
      onSaved: widget.config.onSaved ?? widget.config.onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        counterText: "",
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: enabled ? pick : null,
        ),
        errorBorder: FormFieldDecoration.getErrorBorder(context),
        focusedBorder: FormFieldDecoration.getFocusedBorder(context),
        border: FormFieldDecoration.getEnabledBorder(context),
        enabledBorder: FormFieldDecoration.getEnabledBorder(context),
        fillColor: context.applyAppColor(palette: ColorPalette.white),
        filled: true,
        prefixIcon: widget.config.prefixIcon,
        hintText: effectiveFormat,
        labelText:
            "${widget.config.label}${(widget.config.isRequired ?? false) ? " * " : ""}",
        labelStyle:
            context
                .textStyle(palette: ColorPalette.detail, swatch: 700)
                .small
                .semiBold,
      ),
    );
  }
}
