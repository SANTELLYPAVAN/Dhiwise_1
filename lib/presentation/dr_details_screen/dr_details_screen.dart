import '../dr_details_screen/widgets/timeslots_item_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:pavan_s_application1/core/app_export.dart';
import 'package:pavan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:pavan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:pavan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:pavan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:pavan_s_application1/widgets/custom_elevated_button.dart';
import 'package:pavan_s_application1/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';

// ignore_for_file: must_be_immutable
class DrDetailsScreen extends StatelessWidget {
  DrDetailsScreen({Key? key}) : super(key: key);

  DateTime selectedDatesFromCalendar1 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.v),
                child: Column(children: [
                  _buildDoctorDetails(context),
                  SizedBox(height: 28.v),
                  _buildAbout(context),
                  SizedBox(height: 37.v),
                  _buildDates(context),
                  SizedBox(height: 38.v),
                  Divider(indent: 20.h, endIndent: 20.h),
                  SizedBox(height: 38.v),
                  _buildTimeslots(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildBookAppointment(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 10.v, bottom: 10.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "Doctor Details"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Section Widget
  Widget _buildDoctorDetails(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 6.v),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          CustomImageView(
              imagePath: ImageConstant.imgProfilePic,
              height: 111.adaptSize,
              width: 111.adaptSize,
              radius: BorderRadius.circular(12.h)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, top: 7.v, bottom: 4.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Marcus Horizon",
                        style: CustomTextStyles.titleMedium18),
                    SizedBox(height: 7.v),
                    Text("Chardiologist", style: theme.textTheme.labelLarge),
                    SizedBox(height: 13.v),
                    Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Row(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgSignal,
                              height: 13.adaptSize,
                              width: 13.adaptSize,
                              margin: EdgeInsets.only(bottom: 1.v)),
                          Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text("4.7",
                                  style: CustomTextStyles.labelLargeCyan300))
                        ])),
                    SizedBox(height: 10.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLinkedin,
                          height: 13.adaptSize,
                          width: 13.adaptSize,
                          margin: EdgeInsets.only(bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text("800m away",
                              style: theme.textTheme.labelLarge))
                    ])
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildAbout(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 20.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("About", style: theme.textTheme.titleMedium),
              SizedBox(height: 7.v),
              SizedBox(
                  width: 313.h,
                  child: ReadMoreText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam... ",
                      trimLines: 3,
                      colorClickableText: appTheme.cyan300,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Read more",
                      moreStyle:
                          theme.textTheme.labelLarge!.copyWith(height: 1.50),
                      lessStyle:
                          theme.textTheme.labelLarge!.copyWith(height: 1.50)))
            ])));
  }

  /// Section Widget
  Widget _buildDates(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.h),
            child: IntrinsicWidth(
                child: SizedBox(
                    height: 64.v,
                    width: 355.h,
                    child: EasyDateTimeLine(
                        initialDate: selectedDatesFromCalendar1,
                        locale: 'en_US',
                        headerProps: EasyHeaderProps(
                            selectedDateFormat: SelectedDateFormat.fullDateDMY,
                            monthPickerType: MonthPickerType.switcher,
                            showHeader: false),
                        dayProps: EasyDayProps(width: 46.h, height: 64.v),
                        onDateChange: (selectedDate) {},
                        itemBuilder: (context, dayNumber, dayName, monthName,
                            fullDate, isSelected) {
                          return isSelected
                              ? Container(
                                  width: 46.h,
                                  padding: EdgeInsets.all(11.h),
                                  decoration: BoxDecoration(
                                      color: appTheme.cyan300,
                                      borderRadius:
                                          BorderRadius.circular(10.h)),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 2.v),
                                            child: Text(dayName.toString(),
                                                style: CustomTextStyles
                                                    .bodySmallPrimary
                                                    .copyWith(
                                                        color: theme.colorScheme
                                                            .primary))),
                                        Padding(
                                            padding: EdgeInsets.only(top: 3.v),
                                            child: Text(dayNumber.toString(),
                                                style: CustomTextStyles
                                                    .titleMediumPrimary
                                                    .copyWith(
                                                        color: theme.colorScheme
                                                            .primary)))
                                      ]))
                              : Container(
                                  width: 46.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.h, vertical: 13.v),
                                  decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(10.h),
                                      border: Border.all(
                                          color: appTheme.teal50, width: 1.h)),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 3.h),
                                            child: Text(dayName.toString(),
                                                style: CustomTextStyles
                                                    .bodySmall10
                                                    .copyWith(
                                                        color:
                                                            appTheme.gray500))),
                                        Padding(
                                            padding: EdgeInsets.only(top: 2.v),
                                            child: Text(dayNumber.toString(),
                                                style: CustomTextStyles
                                                    .titleMedium18
                                                    .copyWith(
                                                        color: theme.colorScheme
                                                            .onPrimary)))
                                      ]));
                        })))));
  }

  /// Section Widget
  Widget _buildTimeslots(BuildContext context) {
    return Wrap(
        runSpacing: 13.v,
        spacing: 13.h,
        children: List<Widget>.generate(9, (index) => TimeslotsItemWidget()));
  }

  /// Section Widget
  Widget _buildBookAppointment(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 28.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: IconButtonStyleHelper.fillGray,
              onTap: () {
                onTapBtnUser(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgUserCyan300)),
          Expanded(
              child: CustomElevatedButton(
                  text: "Book Appointment",
                  margin: EdgeInsets.only(left: 19.h),
                  onPressed: () {
                    onTapBookAppointment(context);
                  }))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the chatScreen when the action is triggered.
  onTapBtnUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatScreen);
  }

  /// Navigates to the bookAnAppointmentScreen when the action is triggered.
  onTapBookAppointment(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookAnAppointmentScreen);
  }
}
