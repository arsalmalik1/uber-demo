import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uber_rider/utils/colors.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/wrapper.dart';
import '../utils/images.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/gaps.dart';
import '../widgets/headings.dart';
import '../widgets/top_section.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GetBuilder<AuthController>(
            id: 'loader',
            builder: (c) {
              return floatingButton(
                  isLoading: c.isLoading.value,
                  title: 'Verify',
                  onTap: () {
                    controller.verifyOTP();
                  });
            }),
        appBar: appBar('OTP', onLeftPress: () {}),
        body: wrapper(GetX<AuthController>(builder: (c) {
          return Column(
            children: [
              topSection(
                  image: otpImage,
                  title: 'Verification Code',
                  subTitle:
                      'We have sent verification code to\n Your mobile number'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    optFieldWidget(context, controller.otp1.value),
                    optFieldWidget(context, controller.otp2.value),
                    optFieldWidget(context, controller.otp3.value),
                    optFieldWidget(context, controller.otp4.value),
                    optFieldWidget(context, controller.otp5.value),
                    optFieldWidget(context, controller.otp6.value),
                  ],
                ),
              ),
              h40,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  subHeading("don't receive code?"),
                  w10,
                  GestureDetector(
                      onTap: () {},
                      child: subHeadingBold('Resend code', color: hintColor))
                ],
              ),
              h10,
              GetBuilder<AuthController>(
                  id: 'countdown',
                  builder: (controller) {
                    return subHeading("20 sec left", size: 14);
                  }),
            ],
          );
        })),
      ),
    );
  }

  Widget optFieldWidget(context, TextEditingController textController) {
    return SizedBox(
      height: 40,
      width: 40,
      child: TextField(
        controller: textController,
        onChanged: (v) {
          if (v.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          fillColor: bg,
          contentPadding: const EdgeInsets.all(3),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primary,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primary,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
        ),
      ),
    );
  }
}
