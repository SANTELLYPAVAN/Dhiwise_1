import '../dashboard_page/widgets/doctorlist_item_widget.dart';
import '../dashboard_page/widgets/thirtylist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:pavan_s_application1/core/app_export.dart';
import 'package:pavan_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:pavan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:pavan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:pavan_s_application1/widgets/custom_elevated_button.dart';
import 'package:pavan_s_application1/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 13.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.h),
                              child: CustomSearchView(
                                  controller: searchController,
                                  hintText:
                                      "Search doctor, drugs, articles...")),
                          SizedBox(height: 20.v),
                          _buildThirtyList(context),
                          SizedBox(height: 20.v),
                          _buildOfferBanner(context),
                          SizedBox(height: 42.v),
                          _buildTopDoctorSeeAll(context),
                          SizedBox(height: 10.v),
                          _buildDoctorList(context),
                          SizedBox(height: 31.v),
                          _buildHealthArticleSee(context),
                          SizedBox(height: 12.v),
                          _buildArticleRow(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 90.v,
        title: AppbarTitle(
            text: "Find your desire \nhealt solution",
            margin: EdgeInsets.only(left: 20.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(20.h, 14.v, 20.h, 31.v))
        ]);
  }

  /// Section Widget
  Widget _buildThirtyList(BuildContext context) {
    return SizedBox(
        height: 71.v,
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 17.h);
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return ThirtylistItemWidget(onTapBtnTicket: () {
                onTapBtnTicket(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildOfferBanner(BuildContext context) {
    return Container(
        width: 335.h,
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 12.v),
        decoration: AppDecoration.fillTeal
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.v),
              SizedBox(
                  width: 168.h,
                  child: Text("Early protection for\nyour family healt",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMedium18
                          .copyWith(height: 1.50))),
              SizedBox(height: 7.v),
              CustomElevatedButton(
                  height: 26.v,
                  width: 106.h,
                  text: "Learn More",
                  buttonStyle: CustomButtonStyles.fillCyan,
                  buttonTextStyle: CustomTextStyles.labelLargePrimarySemiBold)
            ]));
  }

  /// Section Widget
  Widget _buildTopDoctorSeeAll(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Top Doctor", style: theme.textTheme.titleMedium),
              GestureDetector(
                  onTap: () {
                    onTapTxtSeeAll(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 5.v),
                      child: Text("See all",
                          style: CustomTextStyles.labelLargeCyan300)))
            ]));
  }

  /// Section Widget
  Widget _buildDoctorList(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 173.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 20.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 14.h);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return DoctorlistItemWidget(onTapDoctor: () {
                    onTapDoctor(context);
                  });
                })));
  }

  /// Section Widget
  Widget _buildHealthArticleSee(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 23.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Healt article", style: theme.textTheme.titleMedium),
          GestureDetector(
              onTap: () {
                onTapTxtSeeAll1(context);
              },
              child: Padding(
                  padding: EdgeInsets.only(bottom: 3.v),
                  child: Text("See all",
                      style: CustomTextStyles.labelLargeCyan300)))
        ]));
  }

  /// Section Widget
  Widget _buildArticleRow(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.all(5.h),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgThumbnail,
                  height: 55.adaptSize,
                  width: 55.adaptSize,
                  radius: BorderRadius.circular(6.h)),
              Padding(
                  padding: EdgeInsets.only(left: 12.h, bottom: 5.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 179.h,
                            child: Text(
                                "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.labelMediumOnPrimary
                                    .copyWith(height: 1.50))),
                        SizedBox(height: 8.v),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jun 10, 2021 ",
                                  style: theme.textTheme.labelSmall),
                              Container(
                                  height: 2.adaptSize,
                                  width: 2.adaptSize,
                                  margin: EdgeInsets.only(
                                      left: 5.h, top: 3.v, bottom: 4.v),
                                  decoration: BoxDecoration(
                                      color: appTheme.gray500,
                                      borderRadius:
                                          BorderRadius.circular(1.h))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text("5min read",
                                      style: theme.textTheme.labelSmall))
                            ])
                      ]))
            ]));
  }

  /// Navigates to the drListScreen when the action is triggered.
  onTapTxtSeeAll(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.drListScreen);
  }

  /// Navigates to the articleScreen when the action is triggered.
  onTapTxtSeeAll1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.articleScreen);
  }

  /// Navigates to the drListScreen when the action is triggered.
  onTapBtnTicket(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.drListScreen);
  }

  /// Navigates to the drDetailsScreen when the action is triggered.
  onTapDoctor(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.drDetailsScreen);
  }
}
