import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';
import 'package:school_management/core/utils/form_field_decoration.dart';
import 'package:school_management/core/utils/validatin.dart';

class CustomMultiLineFormField extends StatefulWidget {
  final Function(dynamic)? onFieldSubmitted;
  final CustomFormFieldConfig config;

  const CustomMultiLineFormField({
    super.key,
    required this.config,
    this.onFieldSubmitted,
  });

  @override
  State<CustomMultiLineFormField> createState() =>
      _CustomMultiLineFormFieldState();
}

class _CustomMultiLineFormFieldState extends State<CustomMultiLineFormField> {
  late TextEditingController _controller;
  int _characterCount = 0;
  static const int maxLength = 200;

  @override
  void initState() {
    super.initState();
    _controller = widget.config.controller ?? TextEditingController();
    _controller.addListener(_updateCharacterCount);
  }

  // void dispose() {
  //   if (widget.config.controller == null) {
  //     _controller.dispose();
  //   }
  //   super.dispose();
  // }

  void _updateCharacterCount() {
    setState(() {
      _characterCount = _controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.config.width ?? double.infinity,
      height: widget.config.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style:
                context
                    .textStyle(palette: ColorPalette.detail, swatch: 700)
                    .small
                    .regular,
            controller: _controller,
            maxLines: widget.config.maxLines,
            maxLength: maxLength,

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
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: TextInputType.text,

            decoration: InputDecoration(
              errorBorder: FormFieldDecoration.getErrorBorder(context),
              focusedBorder: FormFieldDecoration.getFocusedBorder(context),
              border: FormFieldDecoration.getEnabledBorder(context),
              enabledBorder: FormFieldDecoration.getEnabledBorder(context),
              fillColor: context.applyAppColor(palette: ColorPalette.white),
              filled: true,
              labelText:
                  "${widget.config.label}${widget.config.isRequired ?? false ? " * " : ""}",
              labelStyle:
                  context
                      .textStyle(palette: ColorPalette.detail, swatch: 700)
                      .small
                      .semiBold,
              hintText: widget.config.hintText ?? '',
              hintStyle:
                  context
                      .textStyle(palette: ColorPalette.detail, swatch: 400)
                      .xsmall
                      .regular,
              contentPadding: const EdgeInsets.all(16),
              focusColor: AppColor.whiteColor,
              counterText: '',
            ),
            onFieldSubmitted: (value) {
              if (widget.onFieldSubmitted != null) {
                widget.onFieldSubmitted!(value);
              }
              if (widget.config.onFieldSubmitted != null) {
                widget.config.onFieldSubmitted!(value);
              }
            },
            onChanged: (value) {
              if (widget.onFieldSubmitted != null) {
                widget.onFieldSubmitted!(value);
              }
              if (widget.config.onFieldSubmitted != null) {
                widget.config.onFieldSubmitted!(value);
              }
            },
          ),
          const SizedBox(height: 4),
          Text(
            '$_characterCount/$maxLength',
            style: TextStyle(
              color:
                  _characterCount >= maxLength ? Colors.red : Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
