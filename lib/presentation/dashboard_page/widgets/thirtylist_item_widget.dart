import 'package:flutter/material.dart';
import 'package:pavan_s_application1/core/app_export.dart';
import 'package:pavan_s_application1/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ThirtylistItemWidget extends StatelessWidget {
  ThirtylistItemWidget({
    Key? key,
    this.onTapBtnTicket,
  }) : super(
          key: key,
        );

  VoidCallback? onTapBtnTicket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71.h,
      child: CustomIconButton(
        height: 71.adaptSize,
        width: 71.adaptSize,
        padding: EdgeInsets.all(16.h),
        decoration: IconButtonStyleHelper.fillCyan,
        onTap: () {
          onTapBtnTicket!.call();
        },
        child: CustomImageView(
          imagePath: ImageConstant.imgTicket,
        ),
      ),
    );
  }
}
