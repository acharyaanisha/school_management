import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:school_management/constant/app_colors.dart';
import 'package:school_management/constant/app_images.dart';
import 'package:school_management/constant/key_string.dart';
import 'package:school_management/core/common/custom_button/custom_button.dart';
import 'package:school_management/core/typography/color_extension.dart';
import 'package:school_management/core/typography/font_style_extension.dart';
import 'package:school_management/core/utils/shared_pref.dart';
import 'package:school_management/feature/authentication/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  int propertyTypeIndex = 0;
  final _carouselController = CarouselSliderController();

  final List<String> schoolRoles = [
    'Students',
    'Teachers',
    'Parents',
    'Admins',
  ];
  int roleIndex = 0;
  Timer? _roleTimer;

  @override
  void initState() {
    super.initState();
    _startRoleToggle();
  }

  @override
  void dispose() {
    _roleTimer?.cancel();
    super.dispose();
  }

  void _startRoleToggle() {
    _roleTimer?.cancel();
    _roleTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted && currentIndex == 0) {
        setState(() {
          roleIndex = (roleIndex + 1) % schoolRoles.length;
        });
      }
    });
  }

  void _stopRoleToggle() {
    _roleTimer?.cancel();
  }

  List<Map<String, dynamic>> get onboardingData => [
    {
      "img": Image.asset(AppImages.logo, fit: BoxFit.cover),
      "title": _buildAnimatedRoleTitle(),
      "description":
          "A unified platform designed to streamline academics, attendance, and school administration in one place.",
    },
    {
      "img": Image.asset(AppImages.logo, fit: BoxFit.cover),
      "title": _buildStaticTitle("Track Progress & \nStay Connected"),
      "description":
          "Real-time updates on grades, attendance, and school announcements for parents and students alike.",
    },
  ];

  Widget _buildAnimatedRoleTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(color: ColorPalette.black).header2.bold,
        children: <InlineSpan>[
          const TextSpan(text: 'Empowering \n'),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Text(
                schoolRoles[roleIndex],
                key: ValueKey(roleIndex),
                style: TextStyle(color: ColorPalette.primary).header2.bold,
              ),
            ),
          ),
          const TextSpan(text: ' for Excellence'),
        ],
      ),
    );
  }

  Widget _buildStaticTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: ColorPalette.black).header2.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              items: onboardingData.map((e) => e['img'] as Widget).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: false,
                aspectRatio: 1,
                height: MediaQuery.of(context).size.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                    if (index == 0) {
                      propertyTypeIndex = 0;
                      _startRoleToggle();
                    } else {
                      _stopRoleToggle();
                    }
                  });
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        height: 8.h,
                        width: currentIndex == index ? 20.w : 8.w,
                        decoration: BoxDecoration(
                          color:
                              currentIndex == index
                                  ? context.applyAppColor(
                                    palette: ColorPalette.white,
                                  )
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 30.h,
                        left: 30,
                        right: 30,
                        bottom: 30,
                      ),
                      child: Column(
                        children: [
                          Container(
                            child:
                                onboardingData[currentIndex]['title'] as Widget,
                          ),
                          SizedBox(height: 22.h),
                          Text(
                            onboardingData[currentIndex]['description']
                                as String,
                            textAlign: TextAlign.center,
                            style: context.textBlackStyle().small.regular,
                          ),
                          SizedBox(height: 30.h),
                          CustomButton(
                            height: 55,
                            onPressed: () {
                              SharedPref.setBoolValue(
                                KeyString.onboardUser.name,
                                true,
                              );
                              setState(() {
                                if (currentIndex < onboardingData.length - 1) {
                                  currentIndex += 1;
                                  _carouselController.nextPage();
                                } else {
                                  SharedPref.setBoolValue(
                                    KeyString.onboardUser.name,
                                    true,
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                }
                              });
                            },
                            labelStyle:
                                context
                                    .textStyle(palette: ColorPalette.white)
                                    .xlarge,
                            color: const Color(0xff42D3A9),
                            buttonPadding: EdgeInsets.zero,
                            label:
                                currentIndex == onboardingData.length - 1
                                    ? "Get Started"
                                    : "Next",
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
