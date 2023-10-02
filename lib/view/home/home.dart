import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/home/components/filterDropdown.dart';
import 'package:todo/view/home/components/search_bar.dart';
import 'package:todo/view_model/controller/home_controller.dart';
import '../../res/constants.dart';
import 'components/back_decoration.dart';
import 'components/bottom_nav_bar.dart';
import 'components/floating_action.dart';
import 'components/task_page_holder.dart';
import 'components/upper_body.dart';
class HomePage extends StatelessWidget {

  HomePage({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          const BackColors(),
          SafeArea(
            child: Scaffold(
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                floatingActionButton: const FloatingButton(),
                bottomNavigationBar: BottomNavBar(),
                backgroundColor: Colors.transparent,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UperBody(),
                    Row(
                      children: [
                        Search_Bar(),
                        Spacer(),
                        FilterDropDown()
                    ])
                   , Expanded(
                      child: TaskPageBody(),
                    ),

                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}



