import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whiskey_with_bloc/bloc/introduction/introduction_bloc.dart';
import 'package:whiskey_with_bloc/untils/widget/common_shimmer.dart';

import '../../untils/Utiks.dart';
import '../../untils/color_code.dart';
import '../../untils/local/SharedPrefs.dart';
import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import 'intio_screen.dart';

class IntroductionPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PreferenceManger().getTheme() == true
          ? Colors.black
          : appColor.withOpacity(0.2),
      body: BlocConsumer<IntroductionBloc, IntroductionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return BlocBuilder<IntroductionBloc, IntroductionState>(
            builder: (context, state) {
              return Container(
                width: ScreenUtils.width(context),
                height: ScreenUtils.height(context),
                decoration:
                    PreferenceManger().getTheme() == true ? blackd : whited,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: ScreenUtils.width(context),
                      height: ScreenUtils.height(context),
                      color: Colors.white,
                    ),
                    Image.asset(
                      PreferenceManger().getTheme() == true
                          ? 'assets/images/darkthemeimage/xcxcx.png'
                          : 'assets/images/backimagenew.png',
                      fit: BoxFit.fill,
                      width: ScreenUtils.width(context),
                      height: ScreenUtils.height(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 30.0,
                          top: ScreenUtils.height(context) * 0.2 - 10),
                      child: state is IntroductionSuccess
                          ? GestureDetector(
                              onHorizontalDragUpdate: (details) {
                                if (context
                                        .read<IntroductionBloc>()
                                        .setCurrentPageValue ==
                                    state.introductinPojo.data) {
                                  int sensitivity = 8;
                                  if (details.delta.dx > sensitivity) {
                                    print(
                                        "GO FOR BACK PAGE=======================");

                                    context
                                        .read<IntroductionBloc>()
                                        .controllerPager
                                        .animateToPage(
                                          context
                                              .read<IntroductionBloc>()
                                              .setCurrentPageValue = -1,
                                          duration:
                                              const Duration(milliseconds: 450),
                                          curve: Curves.easeIn,
                                        );
                                    context
                                        .read<IntroductionBloc>()
                                        .setCurrentPageValue = context
                                            .read<IntroductionBloc>()
                                            .setCurrentPageValue -
                                        1;
                                  } else if (details.delta.dx < -sensitivity) {
                                    // Left Swipe
                                  }
                                } else {
                                  print(
                                      "GO FOR BACK PAGE=======================");

                                  context
                                      .read<IntroductionBloc>()
                                      .controllerPager
                                      .animateToPage(
                                        context
                                            .read<IntroductionBloc>()
                                            .setCurrentPageValue = -1,
                                        duration:
                                            const Duration(milliseconds: 450),
                                        curve: Curves.easeIn,
                                      );
                                  context
                                      .read<IntroductionBloc>()
                                      .setCurrentPageValue = context
                                          .read<IntroductionBloc>()
                                          .setCurrentPageValue -
                                      1;
                                }
                              },
                              onPanUpdate: (details) {
                                // Swiping in right direction.
                                if (details.delta.dx > 0) {
                                  print("RIGHT RIGHT RIGHT");
                                }

                                // Swiping in left direction.
                                if (details.delta.dx < 0) {
                                  print("LEFT LEFT LEFT LEFT");
                                }
                              },
                              child: PageView.builder(
                                dragStartBehavior: DragStartBehavior.start,
                                reverse: false,
                                physics: const AlwaysScrollableScrollPhysics(),
                                controller: context
                                    .read<IntroductionBloc>()
                                    .controllerPager,
                                onPageChanged: (int page) {
                                  //print("PAGEW NO    $page");
                                  context
                                      .read<IntroductionBloc>()
                                      .setCurrentPageValue = page;
                                  print(
                                      "PAGEW NO    ${context.read<IntroductionBloc>().setCurrentPageValue}");
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return IntroScreen(
                                    title: state
                                        .introductinPojo.data?[index].title,
                                    subtititle:
                                        state.introductinPojo.data?[index].desc,
                                    imag: state
                                        .introductinPojo.data?[index].media,
                                  );
                                },
                                itemCount:
                                    state.introductinPojo.data?.length ?? 0,
                              ),
                            )
                          : CommonShimmer(
                              baseColor: Colors.grey,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 8.0),
                                width: ScreenUtils.width(context),
                                color: Colors.blue,
                                height: ScreenUtils.height(context) * 0.5,
                              )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: ScreenUtils.height(context) * 0.1,
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            state is IntroductionSuccess
                                ? Container(
                                    child: Center(
                                      child: SmoothPageIndicator(
                                          controller: context
                                              .read<IntroductionBloc>()
                                              .controllerPager,
                                          count: state.introductinPojo.data
                                                  ?.length ??
                                              0,
                                          effect: ExpandingDotsEffect(
                                            activeDotColor: Color(
                                                Utils.hexStringToHexInt(
                                                    '#DBB874')),
                                            offset: 8.0,
                                            dotWidth: 6,
                                            dotHeight: 6,
                                            dotColor: appColor.withOpacity(0.3),
                                          ),
                                          onDotClicked: (index) {
                                            //contorllerr.setCurrentIntext = index;
                                          }),
                                    ),
                                  )
                                : CommonShimmer(
                                    baseColor: Colors.red,
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      child: Center(),
                                    ),
                                  ),
                            InkWell(
                              onTap: () {
                                context
                                    .read<IntroductionBloc>()
                                    .controllerPager
                                    .animateToPage(
                                      context
                                          .read<IntroductionBloc>()
                                          .setCurrentPageValue = context
                                              .read<IntroductionBloc>()
                                              .setCurrentPageValue +
                                          1,
                                      duration:
                                          const Duration(milliseconds: 450),
                                      curve: Curves.easeIn,
                                    );

                                if (context
                                        .read<IntroductionBloc>()
                                        .setCurrentPageValue ==
                                    3) {
                                  print("C C C C ");
                                  SharedPrefs.setBool("iscompleteIntro", true);
                                  //Get.to(WelcomePage());
                                }
                                context
                                    .read<IntroductionBloc>()
                                    .setCurrentPageValue = context
                                        .read<IntroductionBloc>()
                                        .setCurrentPageValue -
                                    1;
                              },
                              child: Container(
                                width: ScreenUtils.width(context) * 0.1 + 5,
                                height: ScreenUtils.height(context) * 0.06,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/buttonbackground/intronext.png',
                                  ),
                                  fit: BoxFit.fill,
                                )),
                                child: const Center(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/leftarrow.png'),
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        width: ScreenUtils.width(context) * 0.2,
                        height: ScreenUtils.height(context) * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  PreferenceManger().getTheme() == true
                                      ? 'assets/images/darkthemeimage/introdarklogo.png'
                                      : 'assets/images/lightthemeimage/lightlogo.png',
                                ),
                                fit: BoxFit.contain,
                                opacity: 1.0)),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  BoxDecoration blackd = BoxDecoration(
    color: Colors.black,
    image: DecorationImage(
        image: AssetImage(
          PreferenceManger().getTheme() == true
              ? 'assets/images/darkthemeimage/xcxcx.png'
              : 'assets/images/backImage.png',
        ),
        fit: BoxFit.cover,
        opacity: PreferenceManger().getTheme() == true ? 0.5 : 0.0),
  );

  BoxDecoration whited = BoxDecoration(
    color: Colors.white,
    image: DecorationImage(
      image: AssetImage(
        PreferenceManger().getTheme() == true
            ? 'assets/images/darkthemeimage/xcxcx.png'
            : 'assets/images/backImage.png',
      ),
      fit: BoxFit.cover,
    ),
  );
}
