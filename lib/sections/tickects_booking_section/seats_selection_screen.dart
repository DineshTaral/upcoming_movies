import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upcoming_movies/constant/common_constants.dart';
import 'package:upcoming_movies/gen/assets.gen.dart';
import 'package:upcoming_movies/themes/app_colors.dart';
import 'package:upcoming_movies/themes/app_text_styles.dart';
import 'package:upcoming_movies/themes/dimensions.dart';

class SeatsSelectionScreen extends StatefulWidget {
  SeatsSelectionScreen({super.key});

  @override
  State<SeatsSelectionScreen> createState() => _SeatsSelectionScreenState();
}

class _SeatsSelectionScreenState extends State<SeatsSelectionScreen> {
  final List<int> _blackListIndexCol1 = [0, 1, 2, 5, 10, 15];
  final List<int> _bookedIndexCol1 = [6, 7, 10, 15, 22, 28];

  final List<int> _blackListIndexCol3 = [2, 3, 4, 9, 14];
  final List<int> _bookedIndexCol3 = [6, 7, 12, 15, 20, 35, 36, 37];

  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: whiteColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: lightBlackColor,
              size: 16.px,
            ),
            onPressed: () => popScreen(),
          ),
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                map['title'],
                style: poppingLBlackStyle16,
              ),
              SizedBox(
                height: paddingExtraSmall,
              ),
              Text(
                'March 5, 2021 | 12:30 Hall 1',
                style: poppingWhiteStyle14.copyWith(color: skyBlueColor),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: lightWhiteColor,
        width: deviceWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Transform.scale(
                    scale: _scale,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: deviceWidth * .2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: deviceWidth,
                          height: 50.0,
                          margin:
                              EdgeInsets.symmetric(horizontal: paddingMedium),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(Assets.images.screen.path))),
                          child: Text(
                            "SCREEN",
                            style: poppingDGreyStyle14,
                          ),
                        ),
                        mediumVertSpace,
                        SizedBox(
                          height: deviceWidth * .5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: paddingMedium),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      // Number of columns
                                      crossAxisSpacing: 1.0,
                                      // Spacing between columns
                                      mainAxisSpacing:
                                          1.0, // Spacing between rows
                                    ),
                                    itemCount: 50, // Total number of items
                                    itemBuilder: (context, index) {
                                      return _blackListIndexCol1.contains(index)
                                          ? SizedBox()
                                          : getSeatIcon(
                                              color: _bookedIndexCol1
                                                      .contains(index)
                                                  ? skyBlueColor
                                                  : darkGreyColor);
                                    },
                                  ),
                                ),
                                mediumHorizontalSpace,
                                Expanded(
                                    flex: 3,
                                    child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 15,
                                        // Number of columns
                                        crossAxisSpacing: 1.0,
                                        // Spacing between columns
                                        mainAxisSpacing:
                                            1.0, // Spacing between rows
                                      ),
                                      itemCount: 150, // Total number of items
                                      itemBuilder: (context, index) {
                                        return getSeatIcon(
                                            color: index % 8 == 0
                                                ? skyBlueColor
                                                : darkGreyColor);
                                      },
                                    )),
                                mediumHorizontalSpace,
                                Expanded(
                                  flex: 1,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      // Number of columns
                                      crossAxisSpacing: 1.0,
                                      // Spacing between columns
                                      mainAxisSpacing:
                                          1.0, // Spacing between rows
                                    ),
                                    itemCount: 50, // Total number of items
                                    itemBuilder: (context, index) {
                                      return _blackListIndexCol3.contains(index)
                                          ? SizedBox()
                                          : getSeatIcon(
                                              color: _bookedIndexCol3
                                                      .contains(index)
                                                  ? skyBlueColor
                                                  : darkGreyColor);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _scale += 0.1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(paddingSmall),
                            decoration: BoxDecoration(
                                color: whiteColor, shape: BoxShape.circle),
                            child: Icon(Icons.add),
                          ),
                        ),
                        smallHorizontalSpace,
                        InkWell(
                          onTap: () {
                            setState(() {
                              _scale =
                                  (_scale - 0.1).clamp(1.0, double.infinity);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(paddingSmall),
                            decoration: BoxDecoration(
                                color: whiteColor, shape: BoxShape.circle),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        smallHorizontalSpace
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(paddingMedium),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: availabilityItemWidget(
                                    color: yellowColor, title: "Selected")),
                            Expanded(
                                flex: 1,
                                child: availabilityItemWidget(
                                    color: lightGreyColor,
                                    title: "Not Available"))
                          ],
                        ),
                        smallVertSpace,
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: availabilityItemWidget(
                                    color: darkBlueColor,
                                    title: "VIP (150\$)")),
                            Expanded(
                                flex: 1,
                                child: availabilityItemWidget(
                                    color: skyBlueColor,
                                    title: "Regular (50\$)"))
                          ],
                        ),
                        mediumVertSpace,
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: paddingMedium,
                              vertical: paddingSmall),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: darkGreyColor.withOpacity(.1)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: '4 / ',
                                      style: poppingLBlackStyle16),
                                  TextSpan(
                                      text: '3 row',
                                      style: poppingLGreyStyle14),
                                ]),
                              ),
                              mediumVertSpace,
                              Icon(
                                Icons.close,
                                color: lightBlackColor,
                                size: 15.px,
                              )
                            ],
                          ),
                        ),
                        mediumVertSpace,
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: paddingMedium),
                              height: 50.px,
                              decoration: BoxDecoration(
                                  color: darkGreyColor.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: poppingWhiteStyle12.copyWith(
                                        color: lightBlackColor),
                                  ),
                                  Text(
                                    "\$ 50",
                                    style: poppingLBlackStyle16
                                      ..copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            mediumHorizontalSpace,
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.px,
                                decoration: BoxDecoration(
                                    color: skyBlueColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Select Seats",
                                  style: poppingWhiteStyle18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget getSeatIcon({required Color color}) {
    return Column(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(2)),
        ),
        SizedBox(
          height: 1,
        ),
        Container(
          height: 1.3,
          width: 7,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(2)),
        ),
      ],
    );
  }

  Widget availabilityItemWidget({required Color color, required String title}) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(2)),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              height: 3,
              width: 15,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(2)),
            ),
          ],
        ),
        smallHorizontalSpace,
        Text(
          title,
          style: poppingDGreyStyle14,
        )
      ],
    );
  }
}
