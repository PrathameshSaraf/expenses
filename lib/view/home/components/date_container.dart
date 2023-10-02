import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/constants.dart';
import '../../../view_model/controller/home_controller.dart';
import 'dates.dart';
class DateContainer extends StatelessWidget {
  final int index;
  DateContainer({super.key, required this.index});
  final controller=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Obx(() => AnimatedContainer(
      duration: const Duration(milliseconds: 200),
        height: 70,
        width: 70,
        margin:  EdgeInsets.only(left: size.width*0.03),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            gradient:controller.currentIndex.value==index?  const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lightOrange,
                  darkOrange
                ]
            ) : null,
            // boxShadow: [
            //   controller.currentIndex.value==index?  const BoxShadow(
            //       color: lightOrange,
            //       offset: Offset(0, 10),
            //       blurRadius: 10
            //   ) : const BoxShadow(
            //       color: Colors.black12,
            //       offset: Offset(0, 10),
            //       blurRadius: 10
            //   )
            // ]
        ),
        child: Dates(index: index)
    ));
  }
}
