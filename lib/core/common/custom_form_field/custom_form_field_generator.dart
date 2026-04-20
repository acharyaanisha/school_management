import 'package:flutter/material.dart';
import 'package:school_management/core/common/app_single_child_scroll_view/app_single_child_scroll_view.dart';
import 'package:school_management/core/common/custom_form_field/cuatom_form_field.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';

class CustomFormFieldGenerator extends StatefulWidget {
  final List<CustomFormFieldConfig>? formFields;
  final Map? updateData;
  final GlobalKey<FormState> formKey;
  final Function(dynamic)? onFieldSubmitted;

  const CustomFormFieldGenerator({
    super.key,
    required this.formFields,
    this.updateData,
    required this.formKey,
    this.onFieldSubmitted,
  });

  @override
  State<CustomFormFieldGenerator> createState() =>
      _CustomFormFieldGeneratorState();
}

class _CustomFormFieldGeneratorState extends State<CustomFormFieldGenerator> {
  final ScrollController _scrollController = ScrollController();
  Map<String, TextEditingController> _controllerMap = {};
  Map<String, dynamic> formValues = {};
  bool _isDisposed = false;

  void updateFieldValue(String fieldName, dynamic value) {
    if (_isDisposed || !mounted) return;

    formValues[fieldName] = value;

    for (var field in widget.formFields ?? []) {
      if (field.dependsOn == fieldName) {
        formValues[field.id] = null;
        if (_controllerMap.containsKey(field.id)) {
          _controllerMap[field.id]!.clear();
        }
      }
    }

    setState(() {});

    if (widget.onFieldSubmitted != null) {
      widget.onFieldSubmitted!(formValues);
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    // Dispose all controllers
    for (var controller in _controllerMap.values) {
      controller.dispose();
    }
    _controllerMap.clear();
    _scrollController.dispose();
    super.dispose();
  }

  String getControllerText(
    String key,
    FieldType fieldType,
    List<dynamic> options,
  ) {
    if (widget.updateData == null) {
      return '';
    } else if (widget.updateData!.containsKey(key)) {
      final value = widget.updateData![key];
      if (fieldType == FieldType.dropDown) {
        return getDropDownLabel(value, options);
      } else {
        return value.toString();
      }
    }
    return '';
  }

  String getInitialValue(String key) {
    if (widget.updateData == null) {
      return '';
    } else if (widget.updateData!.containsKey(key)) {
      final value = widget.updateData![key];
      return value.toString();
    }
    return '';
  }

  String getDropDownLabel(String value, List<dynamic> options) {
    for (var option in options) {
      if (option['value'] == value) {
        return option['label'].toString();
      }
    }
    return '';
  }

  TextEditingController _getOrCreateController(
    String fieldId,
    CustomFormFieldConfig field,
  ) {
    if (!_controllerMap.containsKey(fieldId)) {
      String controllerText = getControllerText(
        fieldId,
        field.fieldType,
        field.options ?? [],
      );
      _controllerMap[fieldId] = TextEditingController(text: controllerText);

      // Initialize form value
      String initialValue = getInitialValue(fieldId);
      formValues[fieldId] =
          initialValue.isNotEmpty ? initialValue : controllerText;
    }
    return _controllerMap[fieldId]!;
  }

  void initializeControllers() {
    if (_isDisposed) return;

    for (var field in widget.formFields ?? []) {
      _getOrCreateController(field.id, field);
    }
  }

  @override
  void initState() {
    super.initState();
    initializeControllers();
  }

  @override
  void didUpdateWidget(CustomFormFieldGenerator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.formFields != oldWidget.formFields && !_isDisposed) {
      initializeControllers();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isDisposed) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: buildFormField(widget.updateData, widget.formFields),
    );
  }

  Widget buildFormField(Map? updateData, List<CustomFormFieldConfig>? fields) {
    if (fields == null || fields.isEmpty) {
      return const SizedBox.shrink();
    }

    return AppSingleChildScrollView(
      controller: _scrollController,
      child: Form(
        key: widget.formKey,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: fields.length,
          itemBuilder: (BuildContext context, int index) {
            final field = fields[index];
            final fieldName = field.id;

            final controller = _getOrCreateController(fieldName, field);

            if (field.dependsOn != null && field.getDependentOptions != null) {
              return _buildDependentField(field, fieldName, controller);
            }

            return _buildRegularField(field, fieldName, controller);
          },
        ),
      ),
    );
  }

  Widget _buildDependentField(
    CustomFormFieldConfig field,
    String fieldName,
    TextEditingController controller,
  ) {
    bool hasParentValue =
        formValues[field.dependsOn] != null &&
        formValues[field.dependsOn].toString().isNotEmpty;

    if (hasParentValue) {
      return FutureBuilder<List<Map<String, dynamic>>>(
        key: ValueKey('${fieldName}_${formValues[field.dependsOn]}'),
        future: field.getDependentOptions!(formValues[field.dependsOn]),
        builder: (context, snapshot) {
          if (!mounted || _isDisposed) {
            return const SizedBox.shrink();
          }

          List<Map<String, dynamic>> options = [];
          bool isLoading = snapshot.connectionState == ConnectionState.waiting;
          bool hasError = snapshot.hasError;

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            options = snapshot.data!;
          }

          CustomFormFieldConfig config = field.copyWith(
            controller: controller,
            options: options,
            enabled:
                !isLoading &&
                !hasError &&
                (options.isNotEmpty || field.fieldType != FieldType.dropDown),
            onFieldSubmitted: (value) {
              if (mounted && !_isDisposed) {
                updateFieldValue(
                  fieldName,
                  value.isNotEmpty ? value : controller.text,
                );
              }
            },
          );

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading)
                  CustomFormField(
                    key: ValueKey('loading_$fieldName'),
                    onFieldSubmitted: (value) {
                      // Disabled during loading
                    },
                    config: field.copyWith(
                      controller: controller,
                      options: [],
                      enabled: false,
                      suffixIcon: const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  )
                else if (hasError)
                  CustomFormField(
                    key: ValueKey('error_$fieldName'),
                    onFieldSubmitted: (value) {
                      // Disabled during error
                    },
                    config: field.copyWith(
                      controller: controller,
                      options: [],
                      enabled: false,
                    ),
                  )
                else
                  CustomFormField(
                    key: ValueKey(
                      'field_${fieldName}_${formValues[field.dependsOn]}',
                    ),
                    onFieldSubmitted: (value) {
                      if (mounted && !_isDisposed) {
                        updateFieldValue(
                          fieldName,
                          value.toString().isNotEmpty ? value : controller.text,
                        );
                      }
                    },
                    config: config,
                  ),
              ],
            ),
          );
        },
      );
    } else {
      CustomFormFieldConfig config = field.copyWith(
        controller: controller,
        options: [],
        enabled: false,
        onFieldSubmitted: (value) {},
      );

      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFormField(
              key: ValueKey('disabled_$fieldName'),
              onFieldSubmitted: (value) {
                // Do nothing when disabled
              },
              config: config,
            ),
          ],
        ),
      );
    }
  }

  Widget _buildRegularField(
    CustomFormFieldConfig field,
    String fieldName,
    TextEditingController controller,
  ) {
    CustomFormFieldConfig config = field.copyWith(
      controller: controller,
      options: field.options ?? [],
      onFieldSubmitted: (value) {
        if (mounted && !_isDisposed) {
          updateFieldValue(
            fieldName,
            value.isNotEmpty ? value : controller.text,
          );
        }
      },
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFormField(
            onFieldSubmitted: (value) {
              if (mounted && !_isDisposed) {
                updateFieldValue(
                  fieldName,
                  value.toString().isNotEmpty ? value : controller.text,
                );
              }
            },
            config: config,
          ),
        ],
      ),
    );
  }
}
