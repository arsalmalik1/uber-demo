import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_rider/views/otp_verify_view.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';
import '../views/register_view.dart';

class AuthController extends GetxController {
  RxString phoneCode = '+92'.obs, flagCode = "🇵🇰 +92".obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> fnameController = TextEditingController().obs;
  Rx<TextEditingController> lnameController = TextEditingController().obs;
  RxBool isLoading = false.obs;
  Rx<TextEditingController> otp1 = TextEditingController().obs;
  Rx<TextEditingController> otp2 = TextEditingController().obs;
  Rx<TextEditingController> otp3 = TextEditingController().obs;
  Rx<TextEditingController> otp4 = TextEditingController().obs;
  Rx<TextEditingController> otp5 = TextEditingController().obs;
  Rx<TextEditingController> otp6 = TextEditingController().obs;
  final GlobalKey<FormState> regKey = GlobalKey<FormState>();

  login() {
    if (phoneController.value.text.isNotEmpty) {
      Get.to(() => OtpView());
    }
  }

  verifyOTP() {
    String otp = otp1.value.text +
        otp2.value.text +
        otp3.value.text +
        otp4.value.text +
        otp5.value.text +
        otp6.value.text;

    if (otp.length < 6) {
      showCustomSnackBars('OTP must be 6 digit.', isError: true);
    } else {
      Get.to(() => const RegisterView());
    }
  }

  selectCountryCode(BuildContext context) {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        favorite: ['US', 'PK'],
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: whiteColor,
          textStyle: const TextStyle(fontSize: 16, color: primary),
          bottomSheetHeight: 500, // Optional. Country list modal height
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
          ),
        ),
        onSelect: (Country country) {
          flagCode.value = '${country.flagEmoji} +${country.phoneCode}';
          phoneCode.value = '+${country.phoneCode}';
          update();
        });
  }
}
