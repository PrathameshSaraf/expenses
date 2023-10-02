
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';
import '../../../view_model/controller/home_controller.dart';
import 'custom_app_bar.dart';
import 'date_container.dart';

class UperBody extends StatelessWidget {
  UperBody({super.key});
  final controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding,),
         CustomAppBar(),
        SizedBox(
          height: 120,
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: 7,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 30,top: defaultPadding),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => controller.setIndex(index-3),
                child: DateContainer(index: index-3),
              );
            },),
        ),
      ],
    );
  }
}