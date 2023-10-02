import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';

import '../../../res/constants.dart';


class FilterDropDown extends StatelessWidget {
    FilterDropDown({super.key});
  final fruitDropdownController = DropdownController();
  List<CoolDropdownItem<String>> fruitDropdownItems = [CoolDropdownItem(label:"New latest", value:'New latest'),CoolDropdownItem(label:"Old", value:'Old'),];

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 50,
        width: 130,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow:  [
              BoxShadow(
                  color: lightAccentBlue,
                  offset: Offset(0, 5),
                  blurRadius: 20
              )
            ],
            gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  lightAccentBlue,
                  darkAccentBlue
                ]
            )
        ),
        child:CoolDropdown<String>(
          controller: fruitDropdownController,
          dropdownList: fruitDropdownItems,
          defaultItem: null,

          onChange: (value) async {
            if (fruitDropdownController.isError) {
              await fruitDropdownController.resetError();
            }
            // fruitDropdownController.close();
          },
          onOpen: (value) {},
          resultOptions: ResultOptions(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 200,
            icon: const SizedBox(
              width: 10,
              height: 10,
              child: CustomPaint(
                painter: DropdownArrowPainter(),
              ),
            ),
            render: ResultRender.all,
            placeholder: 'Filter',
            isMarquee: true,
          ),
        ),),
    );
  }
}
