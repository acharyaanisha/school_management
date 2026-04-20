// ignore_for_file: prefer_final_fields

import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_images.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:school_management/constant/res_string.dart';
import 'package:school_management/core/common/custom_form_field/custom_form_field_config.dart';
import 'package:school_management/core/common/custom_listview/custom_list_tile.dart';
import 'package:school_management/core/helpers/bottom_dialogs.dart';
import 'package:school_management/core/localization/get_localization_string.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';

class CustomImagePickerFormField extends StatefulWidget {
  final CustomFormFieldConfig config;
  const CustomImagePickerFormField({super.key, required this.config});

  @override
  State<CustomImagePickerFormField> createState() =>
      _CustomImagePickerFormFieldState();
}

class _CustomImagePickerFormFieldState
    extends State<CustomImagePickerFormField> {
  final ImagePicker _picker = ImagePicker();

  double width = 500;
  double height = 200;

  final List<dynamic> _images = [];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.config.initialValue;
    if (initial is String && initial.isNotEmpty) {
      _images.add(initial);
    } else if (initial is List) {
      _images.addAll(initial);
    }
  }

  Future<void> _pickFromGalleryMultiple() async {
    setState(() => _isLoading = true);
    try {
      final pics = await _picker.pickMultiImage();
      if (pics.isNotEmpty) {
        _images.addAll(pics.map((x) => File(x.path)));
        _notifyParent();
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _takePhoto() async {
    final photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _images.add(File(photo.path));
      });
      _notifyParent();
    }
  }

  void _removeAt(int index) {
    setState(() {
      _images.removeAt(index);
    });
    _notifyParent();
  }

  void _notifyParent() {
    try {
      final paths = <String>[];
      for (var image in _images) {
        if (image is File) {
          paths.add(image.path);
        } else if (image is String) {
          paths.add(image);
        }
      }
      final jsonPaths = jsonEncode(paths);
      widget.config.onChanged?.call(jsonPaths);
      debugPrint('[ImagePicker] onChanged -> $jsonPaths');
    } catch (e) {
      debugPrint('Error in _notifyParent: $e');
    }
  }

  void _openPickerSheet() {
    BottomDialog.showBottomDialog(
      title: "Attachment",
      context: context,
      child: Container(
        padding: AppPadding.contentPadding,
        height: MediaQuery.of(context).size.height * 1 / 5,
        child: ListView(
          children: [
            /// 🖼 Gallery
            if (widget.config.allowGallery)
              Card(
                child: CustomListTile(
                  onPress: () async {
                    await _pickFromGalleryMultiple();
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.pop(context);
                    });
                  },
                  title: Text(
                    getLocalizedString(
                      context: context,
                      resString: ResString.selectPhoto,
                    ),
                  ),
                  leading: Image.asset(AppImages.gallery),
                ),
              ),

            /// 📷 Camera
            if (widget.config.allowCamera)
              Card(
                child: CustomListTile(
                  onPress: () async {
                    await _takePhoto();
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.pop(context);
                    });
                  },
                  title: Text(
                    getLocalizedString(
                      context: context,
                      resString: ResString.takePhoto,
                    ),
                  ),
                  leading: Image.asset(AppImages.camera),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    if (widget.config.isLogIn == false && _isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_images.isEmpty) {
      final empty =
          widget.config.isLogIn == true
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload_file, size: 50),
                  const SizedBox(height: 6),
                  Text(widget.config.label),
                ],
              )
              : Image.asset(AppImages.errorImage);

      return Center(child: empty);
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (_, i) {
        final item = _images[i];
        Widget imageWidget;

        if (item is File) {
          imageWidget = Image.file(item, fit: BoxFit.cover);
        } else if (item is String) {
          imageWidget = FadeInImage.assetNetwork(
            image: item,
            fit: BoxFit.cover,
            placeholder: AppImages.errorImage,
            imageErrorBuilder:
                (_, __, ___) => const Icon(Icons.error, color: Colors.grey),
          );
        } else {
          imageWidget = const Icon(Icons.error, color: Colors.grey);
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageWidget,
            ),
            Positioned(
              top: 4,
              right: 4,
              child: InkWell(
                onTap: () => _removeAt(i),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: const Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _openPickerSheet,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.greyColor),
            ),
            height: height,
            width: width,
            child: _buildGrid(),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _openPickerSheet,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColor.greyColor,
                style: BorderStyle.solid,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upload a File or take a photo*",
                    style:
                        context.textStyle(palette: ColorPalette.detail).xsmall,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
