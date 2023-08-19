import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uber_rider/utils/colors.dart';
import 'package:uber_rider/widgets/appbar.dart';

import '../../utils/constants.dart';
import '../../utils/helper.dart';
import '../../widgets/chart.dart';
import '../../widgets/gaps.dart';
import '../../widgets/headings.dart';

class DriverStatsView extends StatelessWidget {
  const DriverStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg,
        leading: null,
        centerTitle: true,
        title: const Text(
          'My Earnings',
          style: TextStyle(
              color: primary, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          balanceWidget(
            300.90,
            DateTime.now(),
          ),
          Expanded(child: Chart())
        ],
      ),
    );
  }

  Widget balanceWidget(double? amount, DateTime? date) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF069FDE),
                Color(0xFF20C8F2),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subHeading(
                    'Available Balance',
                    color: whiteColor,
                  ),
                  h10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heading(
                          '${Constants.currencySymbol} ${amountSeparator(amount)}',
                          color: whiteColor,
                          size: 25,
                          weight: FontWeight.bold),
                      SvgPicture.asset(
                        Constants.dollarIcon,
                        height: 25,
                      )
                    ],
                  ),
                  h10,
                  if (date != null)
                    subHeading('last withdraw ${dateFormate(date)}',
                        color: whiteColor, size: 12),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
