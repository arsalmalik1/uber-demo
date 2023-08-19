import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_rider/utils/colors.dart';
import 'package:uber_rider/views/dasboard_view.dart';
import 'package:uber_rider/views/driver/driver_dashboard.dart';
import 'package:uber_rider/widgets/button.dart';
import 'package:uber_rider/widgets/gaps.dart';

import '../controllers/auth_controller.dart';
import '../widgets/appbar.dart';
import '../widgets/text_field.dart';
import '../widgets/wrapper.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(builder: (controller) {
      return Scaffold(
        appBar: appBar('Register', onLeftPress: () {}),
        backgroundColor: bg,
        body: SafeArea(
            child: wrapper(Form(
          key: controller.regKey,
          child: Column(
            children: [
              h40,
              textField(
                  controller: controller.fnameController.value,
                  hint: 'First Name'),
              h20,
              textField(
                  controller: controller.lnameController.value,
                  hint: 'Last Name'),
              h20,
              Row(
                children: [
                  Expanded(
                      child: button(
                          rad: 100,
                          text: 'Passenger',
                          backColor:
                              controller.selectedType.value == 'Passenger'
                                  ? primary
                                  : bg,
                          textColor:
                              controller.selectedType.value == 'Passenger'
                                  ? bg
                                  : primary,
                          onTap: () {
                            controller.selectType('Passenger');
                          })),
                  w10,
                  Expanded(
                      child: button(
                          rad: 100,
                          text: 'Driver',
                          backColor: controller.selectedType.value == 'Driver'
                              ? primary
                              : bg,
                          textColor: controller.selectedType.value == 'Driver'
                              ? bg
                              : primary,
                          onTap: () {
                            controller.selectType('Driver');
                          })),
                ],
              ),
              h30,
              button(
                  text: 'Register',
                  onTap: () {
                    if (controller.regKey.currentState!.validate()) {
                      controller.register();
                    }
                  })
            ],
          ),
        ))),
      );
    });
  }
}
