import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/network/firebase/firebase_services.dart';
import 'icon_container.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => FirebaseService.signInwWithGoogle(),
            child: const IconContainer(
                widget: Icon(
                FontAwesomeIcons.google,
                  size: 18,
                  color: Colors.orange,
                )),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => FirebaseService.signInwWithGoogle(),
            child: const IconContainer(
                widget: Icon(
                  FontAwesomeIcons.facebook,
                  size: 22,
                  color: Colors.blue,
                )),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => FirebaseService.signInwWithGoogle(),
            child: const IconContainer(
                widget: Icon(
                  FontAwesomeIcons.phone,
                  size: 18,
                  color: Colors.pink,
                )),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => FirebaseService.signInwWithGoogle(),
            child: const IconContainer(
                widget: Icon(
                  FontAwesomeIcons.microsoft,
                  size: 18,
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }
}
