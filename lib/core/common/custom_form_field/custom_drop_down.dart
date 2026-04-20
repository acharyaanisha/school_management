import 'package:flutter/material.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/res_string.dart';
import 'package:school_management/core/common/custom_form_field/cuatom_form_field.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';
import 'package:school_management/core/common/custom_listview/custom_list_tile.dart';
import 'package:school_management/core/common/custom_listview/custom_list_view_builder.dart';
import 'package:school_management/core/localization/get_localization_string.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';
import 'package:school_management/core/utils/form_field_decoration.dart';
import 'package:school_management/core/utils/validatin.dart';
import 'package:iconoir_flutter/regular/search.dart' as iconoir;

class CustomDropDownFormField extends StatefulWidget {
  final CustomFormFieldConfig config;
  final Function(dynamic)? onFieldSubmitted;

  const CustomDropDownFormField({
    super.key,
    required this.config,
    this.onFieldSubmitted,
  });

  @override
  State<CustomDropDownFormField> createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  TextEditingController searchController = TextEditingController();
  List allOptions = [];

  @override
  void initState() {
    allOptions = widget.config.options ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildDropDownForm();
  }

  buildDropDownForm() {
    return TextFormField(
      style:
          context
              .textStyle(palette: ColorPalette.detail, swatch: 700)
              .small
              .regular,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (value) {
        if (widget.config.onFieldSubmitted != null) {
          widget.config.onFieldSubmitted!(value);
        }
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
      },
      readOnly: true,
      enabled: widget.config.enabled,
      validator: ((value) {
        return FormValidator.checkValidation(
          context: context,
          isLogIn: widget.config.isLogIn ?? false,
          isRequired: widget.config.isRequired ?? false,
          value: value ?? "",
          fieldType: widget.config.fieldType,
          label: widget.config.label,
        );
      }),
      controller: widget.config.controller,
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
        suffixIcon:
            widget.config.controller!.text.isEmpty
                ? const Icon(Icons.arrow_drop_down)
                : widget.config.enabled == true
                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.config.controller?.clear();
                      if (widget.config.onFieldSubmitted != null) {
                        widget.config.onFieldSubmitted!("");
                      }
                      if (widget.onFieldSubmitted != null) {
                        widget.onFieldSubmitted!("");
                      }
                    });
                  },
                  child: const Icon(Icons.close, size: 18),
                )
                : null,
        hintText: widget.config.hintText,
      ),
      onTap: () {
        onTabFunction();
      },
    );
  }

  onTabFunction() {
    setState(() {
      allOptions = widget.config.options ?? [];
      searchController.clear();
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (context) => StatefulBuilder(
            builder: (context, setModalState) {
              return SizedBox(
                height:
                    widget.config.options!.length > 5
                        ? MediaQuery.of(context).size.height * 0.80
                        : MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: widget.config.options!.length > 10,
                            child: Expanded(
                              child: CustomFormField(
                                config: CustomFormFieldConfig(
                                  fieldType: FieldType.text,
                                  controller: searchController,
                                  id: "search",
                                  label: getLocalizedString(
                                    context: context,
                                    resString: ResString.search,
                                  ),
                                  onChanged: (val) {
                                    setModalState(() {
                                      if (val.isEmpty) {
                                        allOptions =
                                            widget.config.options ?? [];
                                      } else {
                                        final normalizedQuery =
                                            val
                                                .replaceAll(' ', '')
                                                .toLowerCase();
                                        allOptions =
                                            widget.config.options!.where((e) {
                                              final title = e["label"] ?? '';
                                              final normalizedTitle =
                                                  title
                                                      .replaceAll(' ', '')
                                                      .toLowerCase();
                                              return normalizedTitle.contains(
                                                normalizedQuery,
                                              );
                                            }).toList();
                                      }
                                    });
                                  },
                                  isRequired: false,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 16,
                                      left: 16,
                                    ),
                                    child: iconoir.Search(
                                      color: context.applyAppColor(
                                        palette: ColorPalette.primary,
                                        swatch: 700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              getLocalizedString(
                                context: context,
                                resString: ResString.cancel,
                              ),
                              style:
                                  context
                                      .textStyle(
                                        palette: ColorPalette.detail,
                                        swatch: 700,
                                      )
                                      .medium
                                      .semiBold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child:
                            allOptions.isNotEmpty
                                ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: allOptions.length,
                                  itemBuilder: (context, index) {
                                    return CustomCard(
                                      cardHeight: 50,
                                      child: CustomListTile(
                                        onPress: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            widget.config.controller!.text =
                                                allOptions[index]["label"];
                                            if (widget
                                                    .config
                                                    .onFieldSubmitted !=
                                                null) {
                                              widget.config.onFieldSubmitted!
                                                  .call(
                                                    allOptions[index]["value"],
                                                  );
                                            }
                                            if (widget.onFieldSubmitted !=
                                                null) {
                                              widget.onFieldSubmitted!.call(
                                                allOptions[index]["value"],
                                              );
                                            }
                                          });
                                        },
                                        title: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${allOptions[index]['label']}",
                                            style:
                                                context
                                                    .textStyle(
                                                      palette:
                                                          ColorPalette.detail,
                                                      swatch: 700,
                                                    )
                                                    .small
                                                    .semiBold,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                                : Center(
                                  child: Text(
                                    getLocalizedString(
                                      context: context,
                                      resString: ResString.noDataFound,
                                    ),
                                    style:
                                        context
                                            .textStyle(
                                              palette: ColorPalette.detail,
                                              swatch: 700,
                                            )
                                            .large
                                            .semiBold,
                                  ),
                                ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}
