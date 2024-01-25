import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upcoming_movies/constant/common_constants.dart';
import 'package:upcoming_movies/constant/screen_name_constants.dart';
import 'package:upcoming_movies/gen/assets.gen.dart';
import 'package:upcoming_movies/themes/app_colors.dart';
import 'package:upcoming_movies/themes/app_text_styles.dart';
import 'package:upcoming_movies/themes/dimensions.dart';

class TicketsBookingScreen extends StatelessWidget {
  const TicketsBookingScreen({super.key});

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
                map['date'],
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
            SizedBox(
              height: deviceWidth * .2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: paddingMedium),
              child: Text(
                "Date",
                style: poppingLBlackStyle16,
              ),
            ),
            smallVertSpace,
            SizedBox(
              height: 30.px,
              width: deviceWidth,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: paddingMedium),
                itemBuilder: (ctx, idx) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: idx == 0
                          ? skyBlueColor
                          : lightGreyColor.withOpacity(.1),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: paddingMedium),
                    child: Text(
                      "${idx + 4} Jan",
                      style: poppingWhiteStyle14.copyWith(
                          color: idx == 0 ? whiteColor : lightBlackColor),
                    ),
                  );
                },
                separatorBuilder: (ctx, idx) => smallHorizontalSpace,
                itemCount: 10,
              ),
            ),
            mediumVertSpace,
            SizedBox(
              height: deviceWidth,
              width: deviceWidth,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: paddingMedium),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, idx) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "12:30",
                              style: poppingWhiteStyle14.copyWith(
                                  color: lightBlackColor)),
                          TextSpan(
                              text: "  Cinetech + hall 1",
                              style: poppingDGreyStyle14),
                        ]),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth * .1,
                            vertical: deviceWidth * .05),
                        margin: EdgeInsets.symmetric(vertical: paddingSmall),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: idx == 0
                                  ? skyBlueColor
                                  : darkGreyColor.withOpacity(.1)),
                        ),
                        child:
                            Assets.images.seats.image(width: deviceWidth * .6),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(text: "From ", style: poppingDGreyStyle14),
                          TextSpan(
                              text: "50\$",
                              style: poppingWhiteStyle14.copyWith(
                                  color: lightBlackColor,
                                  fontWeight: FontWeight.w700)),
                          TextSpan(text: " To ", style: poppingDGreyStyle14),
                          TextSpan(
                              text: "2500 bonus",
                              style: poppingWhiteStyle14.copyWith(
                                  color: lightBlackColor,
                                  fontWeight: FontWeight.w700)),
                        ]),
                      ),
                    ],
                  );
                },
                separatorBuilder: (ctx, idx) => mediumHorizontalSpace,
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => push(
                    routeName: seatsSelectionScreen,
                    arguments: {'title': map['title']}),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(paddingMedium),
                  height: 50.px,
                  width: deviceWidth,
                  decoration: BoxDecoration(
                      color: skyBlueColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Select Seats",
                    style: poppingWhiteStyle18,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
