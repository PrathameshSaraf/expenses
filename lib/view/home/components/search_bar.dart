
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Search_Bar extends StatefulWidget {
  const Search_Bar({super.key});
  @override
  State<Search_Bar> createState() => _Search_BarState();
}
class _Search_BarState extends State<Search_Bar> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SearchBarAnimation(
            searchBoxWidth: 200,
            textEditingController: TextEditingController(),
            isOriginalAnimation: true,
            enableKeyboardFocus: true,
            onExpansionComplete: () {

              debugPrint(
                  'do something just after searchbox is opened.');
            },
            onCollapseComplete: () {
              debugPrint(
                  'do something just after searchbox is closed.');
            },
            onPressButton: (isSearchBarOpens) {

              debugPrint(
                  'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
            },
            trailingWidget: const Icon(
              Icons.search,
              size: 20,
              color: Colors.black,
            ),
            secondaryButtonWidget: const Icon(
              Icons.close,
              size: 20,
              color: Colors.black,
            ),
            buttonWidget: const Icon(
              Icons.search,
              size: 20,
              color: Colors.black,
            ),
          ),
        );

  }
}
