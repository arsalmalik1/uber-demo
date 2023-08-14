import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_rider/utils/colors.dart';
import '../controllers/auth_controller.dart';
import '../utils/images.dart';
import '../widgets/button.dart';
import '../widgets/gaps.dart';
import '../widgets/social_card.dart';
import '../widgets/text_field.dart';
import '../widgets/wrapper.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final loginController = Get.put(AuthController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AuthController>(builder: (controller) {
        return SafeArea(
            child: wrapper(
          SingleChildScrollView(
            child: AbsorbPointer(
              absorbing: controller.isLoading.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.2,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  h25,
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          phoneField(
                              prefixText: controller.flagCode.value,
                              onTap: () {
                                controller.selectCountryCode(context);
                              },
                              controller: controller.phoneController.value,
                              // prefix: AppConstant.call,
                              textType: TextInputType.number,
                              hint: 'Phone'),
                        ],
                      )),
                  h25,
                  GetBuilder<AuthController>(
                      id: 'loader',
                      builder: (c) {
                        return button(
                            isLoading: c.isLoading.value,
                            text: 'Sign In',
                            onTap: () {
                              final FormState? form = formKey.currentState;

                              if (!form!.validate()) {
                                return;
                              }
                              controller.login();
                            });
                      }),
                  h25,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width * 0.15,
                        height: 1,
                        color: hintColor,
                      ),
                      w15,
                      const Text(
                        'or',
                        style: TextStyle(color: hintColor, fontSize: 14),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Continue with email',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: primary,
                                fontSize: 16),
                          )),
                      w15,
                      Container(
                        width: Get.width * 0.15,
                        height: 1,
                        color: hintColor,
                      ),
                    ],
                  ),
                  h25,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialCard(gmailIcon, onPress: () {}),
                      w20,
                      socialCard(facebookIcon, onPress: () {}),
                      w20,
                      socialCard(tweeterIcon, onPress: () {}),
                    ],
                  ),
                  h25,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: hintColor, fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: primary,
                                fontSize: 16),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
