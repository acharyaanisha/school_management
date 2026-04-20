import 'package:flutter/material.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class CustomCheckBox extends StatefulWidget {
  final CustomFormFieldConfig config;
  final Function(dynamic)? onFieldSubmitted;

  const CustomCheckBox({
    super.key,
    required this.config,
    this.onFieldSubmitted,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  List allOptions = [];

  @override
  void initState() {
    allOptions = widget.config.options ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildCheckBoxForm();
  }

  buildCheckBoxForm() {
    List selectedValues = widget.config.controller?.text.split(', ') ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 8.0),
        //   child: Text(
        //     "${widget.config.label}${widget.config.isRequired == true ? " *" : ""}",
        //     style: context
        //         .textStyle(palette: ColorPalette.disabled, swatch: 700)
        //         .medium
        //         .semiBold,
        //   ),
        // ),
        ..._buildCheckboxRows(selectedValues),
      ],
    );
  }

  List<Widget> _buildCheckboxRows(List selectedValues) {
    List<Widget> rows = [];

    for (int i = 0; i < allOptions.length; i += 3) {
      final first = allOptions[i];
      final second = (i + 1 < allOptions.length) ? allOptions[i + 1] : null;
      final third = (i + 2 < allOptions.length) ? allOptions[i + 2] : null;

      rows.add(
        Row(
          children: [
            Expanded(child: _buildCheckboxTile(first, selectedValues)),
            if (second != null)
              Expanded(child: _buildCheckboxTile(second, selectedValues)),
            if (third != null)
              Expanded(child: _buildCheckboxTile(third, selectedValues)),
          ],
        ),
      );
    }

    return rows;
  }

  Widget _buildCheckboxTile(Map<String, dynamic> option, List selectedValues) {
    final label = option['label'];
    final value = option['value'];

    return CheckboxListTile(
      value: selectedValues.contains(value),
      // checkColor: context.applyAppColor(palette: ColorPalette.info, swatch: 600),
      activeColor: AppColor.primaryColor,
      checkColor: Colors.white,
      title: Text(
        label,
        style: context.textStyle(palette: ColorPalette.detail).xsmall,
      ),
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (selected) {
        setState(() {
          if (selected == true) {
            selectedValues.add(value);
          } else {
            selectedValues.remove(value);
          }
          widget.config.controller?.text = selectedValues.join(', ');
          if (widget.onFieldSubmitted != null) {
            widget.onFieldSubmitted!(selectedValues);
          } else if (widget.config.onFieldSubmitted != null) {
            widget.config.onFieldSubmitted!(selectedValues);
          }
        });
      },
    );
  }
}
