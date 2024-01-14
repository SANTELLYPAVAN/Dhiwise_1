import '../cart_screen/widgets/drugslist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:pavan_s_application1/core/app_export.dart';
import 'package:pavan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:pavan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:pavan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:pavan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:pavan_s_application1/widgets/custom_elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDrugsList(context),
                      SizedBox(height: 27.v),
                      Text("Payment Detail",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 12.v),
                      _buildAdminFee(context,
                          adminFeeText: "Consultation", priceText: "60.00"),
                      SizedBox(height: 11.v),
                      _buildAdminFee(context,
                          adminFeeText: "Admin Fee", priceText: "01.00"),
                      SizedBox(height: 11.v),
                      _buildAdminFee(context,
                          adminFeeText: "Aditional Discount", priceText: "-"),
                      SizedBox(height: 11.v),
                      _buildAdminFee(context,
                          adminFeeText: "Total", priceText: "61.00"),
                      SizedBox(height: 25.v),
                      Divider(),
                      SizedBox(height: 27.v),
                      Text("Payment Method",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 10.v),
                      _buildAdminFee(context,
                          adminFeeText: "VISA", priceText: "Change"),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildCheckoutRow(context)));
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
        title: AppbarSubtitle(text: "My Cart"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Section Widget
  Widget _buildDrugsList(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 25.v);
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return DrugslistItemWidget();
        });
  }

  /// Section Widget
  Widget _buildCheckoutRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 26.v),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 2.v, bottom: 6.v),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total",
                            style: CustomTextStyles.titleSmallGray500),
                        Opacity(
                            opacity: 0.9,
                            child: Padding(
                                padding: EdgeInsets.only(top: 1.v),
                                child: Text(" 20.98",
                                    style:
                                        CustomTextStyles.titleMediumOnPrimary)))
                      ])),
              CustomElevatedButton(width: 192.h, text: "Checkout")
            ]));
  }

  /// Common widget
  Widget _buildAdminFee(
    BuildContext context, {
    required String adminFeeText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(adminFeeText,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onPrimary)),
      Text(priceText,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onPrimary))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
