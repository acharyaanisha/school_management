import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_icons.dart';
import 'package:school_management/constant/res_string.dart';
import 'package:school_management/core/common/base_page/base_page.dart';
import 'package:school_management/core/common/custom_form_field/cuatom_form_field.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';
import 'package:school_management/core/common/custom_listview/custom_list_tile.dart';
import 'package:school_management/core/common/custom_listview/custom_list_view_builder.dart';
import 'package:school_management/core/localization/get_localization_string.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class CustomSearchListView extends StatefulWidget {
  final String title;
  final List options;
  final bool? showSearch;
  final void Function(Map)? onSelect;
  const CustomSearchListView({
    super.key,
    required this.options,
    required this.title,
    this.showSearch,
    this.onSelect,
  });

  @override
  State<CustomSearchListView> createState() => _CustomSearchListViewState();
}

class _CustomSearchListViewState extends State<CustomSearchListView> {
  TextEditingController searchController = TextEditingController();

  List allOptions = [];
  @override
  void initState() {
    allOptions = widget.options;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomFormFieldConfig config = CustomFormFieldConfig(
      id: "search",
      onChanged: (val) {
        log(val.toString());
        filterSearchResults(val.toLowerCase());
      },
      label: getLocalizedString(context: context, resString: ResString.search),
      hintText: getLocalizedString(
        context: context,
        resString: ResString.search,
      ),
      fieldType: FieldType.text,
      controller: searchController,
      prefixIcon: AppIcons.search,
    );
    return BasePage(
      showBottomNav: false,
      showBackButton: true,
      title: Text(
        "${getLocalizedString(context: context, resString: ResString.select)} ${widget.title}",
        style:
            context
                .textStyle(palette: ColorPalette.detail, swatch: 700)
                .large
                .semiBold,
      ),
      trailing: const [],
      body: Column(
        children: [
          if (widget.showSearch == true) CustomFormField(config: config),
          const SizedBox(height: 8),
          Expanded(
            child:
                allOptions.isNotEmpty
                    ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: allOptions.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          child: CustomListTile(
                            onPress: () {
                              Navigator.pop(context, {
                                'label': allOptions[index]['label'],
                                'value': allOptions[index]['value'],
                              });
                              log(allOptions[index]['label']);

                              if (widget.onSelect != null) {
                                widget.onSelect!({
                                  'label': allOptions[index]['label'],
                                  'value': allOptions[index]['value'],
                                });
                              }
                            },
                            title: Text("${allOptions[index]['label']}"),
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
    );
  }

  void filterSearchResults(String query) {
    setState(() {
      allOptions =
          widget.options
              .where(
                (e) => e["label"]
                    .toLowerCase()
                    .replaceAll(' ', '')
                    .contains(query),
              )
              .toList();
    });
  }
}
