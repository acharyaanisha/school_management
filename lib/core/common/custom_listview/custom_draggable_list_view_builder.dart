// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:iconoir_flutter/iconoir_flutter.dart' as Iconoir;
// import 'package:school_management/constant/app_colors.dart';
// import 'package:school_management/constant/app_images.dart';
// import 'package:school_management/constant/res_string.dart';
// import 'package:school_management/core/common/custom_listview/custom_list_view_builder.dart';
// import 'package:school_management/core/localization/get_localization_string.dart';
// import 'package:school_management/core/typography/color_extension.dart';
// import 'package:school_management/core/typography/font_style_extension.dart';

// class CustomDraggableListViewBuilder extends StatefulWidget {
//   final List<ListData> data;
//   final Axis? scrollDirection;
//   final String? onNavigate;
//   final EdgeInsetsGeometry? listViewBodyPadding;
//   final Function()? onTap;
//   final double? borderRadius;
//   final double? cardHeight;
//   final Color? cardColor;
//   final Color? cardBoarderColor;
//   final int? networkID;

//   const CustomDraggableListViewBuilder({
//     super.key,
//     this.scrollDirection,
//     this.onNavigate,
//     this.listViewBodyPadding,
//     this.onTap,
//     this.borderRadius,
//     this.cardHeight,
//     this.cardColor,
//     this.cardBoarderColor,
//     required this.data,
//     this.networkID,
//   });

//   @override
//   State<CustomDraggableListViewBuilder> createState() =>
//       _CustomDraggableListViewBuilderState();
// }

// class _CustomDraggableListViewBuilderState
//     extends State<CustomDraggableListViewBuilder> {
//   // final _loadingOverlay = GetIt.instance.get<LoadingOverlay>();

//   @override
//   Widget build(BuildContext context) {
//     return widget.data.isNotEmpty
//         ? ReorderableListView(
//           onReorder: (int oldIndex, int newIndex) {
//             setState(() {
//               if (oldIndex < newIndex) {
//                 newIndex -= 1;
//               }
//               final ListData data = widget.data.removeAt(oldIndex);
//               widget.data.insert(newIndex, data);
//             });
//           },
//           buildDefaultDragHandles: false,
//           children: List<Widget>.generate(widget.data.length, (index) {
//             final data = widget.data[index];
//             return Row(
//               key: Key(index.toString()),
//               children: [
//                 Text(
//                   "${index + 1}",
//                   style:
//                       context
//                           .textStyle(palette: ColorPalette.detail, swatch: 700)
//                           .large
//                           .semiBold,
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: ReorderableDragStartListener(
//                     index: index,
//                     child: CustomCard(
//                       cardBoarderColor: widget.cardBoarderColor,
//                       cardColor: widget.cardColor,
//                       cardHeight: widget.cardHeight,
//                       borderRadius: widget.borderRadius,
//                       padding: widget.listViewBodyPadding,
//                       onTap: widget.onTap,
//                       child: Padding(
//                         padding:
//                             widget.listViewBodyPadding ??
//                             EdgeInsets.only(
//                               left: 8.w,
//                               right: 8.w,
//                               top: 12.h,
//                               bottom: 6.h,
//                             ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             Image.asset(
//                               AppImages.draggableIcon,
//                               width: 24,
//                               height: 24,
//                               color: context.applyAppColor(
//                                 palette: ColorPalette.detail,
//                                 swatch: 400,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Image.asset(
//                               AppImages.avatarImage,
//                               width: 40,
//                               height: 40,
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   left: 16.w,
//                                   right: 16.w,
//                                   top: 12.h,
//                                   bottom: 6.h,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       data.title ?? "",
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       style:
//                                           context
//                                               .textStyle(
//                                                 palette: ColorPalette.detail,
//                                                 swatch: 700,
//                                               )
//                                               .large
//                                               .semiBold,
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Text(
//                                       data.subtitle ?? "",
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       style:
//                                           context
//                                               .textStyle(
//                                                 palette: ColorPalette.detail,
//                                               )
//                                               .small
//                                               .regular,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   final ListData data = widget.data.removeAt(
//                                     index,
//                                   );
//                                   widget.data.insert(index + 1, data);
//                                 });
//                               },
//                               child: Iconoir.PriorityDown(
//                                 width: 24,
//                                 height: 24,
//                                 color: context.applyAppColor(
//                                   palette: ColorPalette.primary,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }),
//         )
//         : Center(
//           child: Text(
//             getLocalizedString(
//               context: context,
//               resString: ResString.noDataFound,
//             ),
//           ),
//         );
//   }
// }
