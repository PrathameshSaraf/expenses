// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:intl/intl.dart';
// import '../home/components/bottom_nav_bar.dart';
// import 'details_page.dart';
// import 'widgets/action_buttons.dart';
// import 'widgets/custom_day_picker.dart';
// import 'widgets/date_field.dart';
// import 'widgets/header.dart';
// import 'widgets/time_field.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// class SetTimer extends StatefulWidget {
//   const SetTimer({Key? key}) : super(key: key);
//
//   @override
//   _SetTimerState createState() => _SetTimerState();
// }
// final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
//
// class _SetTimerState extends State<SetTimer> {
//   NotificationService notificationService = NotificationService();
//
//   final int maxTitleLength = 60;
//   TextEditingController _textEditingController =
//       TextEditingController(text: "Business meeting");
//
//   int segmentedControlGroupValue = 0;
//
//   DateTime currentDate = DateTime.now();
//   DateTime? eventDate;
//
//   TimeOfDay currentTime = TimeOfDay.now();
//   TimeOfDay? eventTime;
//
//   Future<void> onCreate() async {
//
//
//     await notificationService.showNotification(
//       0,
//       _textEditingController.text,
//       "A new event has been created.",
//       jsonEncode({
//         "title": _textEditingController.text,
//         "eventDate": DateFormat("EEEE, d MMM y").format(eventDate!),
//         "eventTime": eventTime!.format(context),
//       }),
//     );
//
//     await notificationService.scheduleNotification(
//       1,
//       _textEditingController.text,
//       "Reminder for your scheduled event at ${eventTime!.format(context)}",
//       eventDate!,
//       eventTime!,
//       jsonEncode({
//         "title": _textEditingController.text,
//         "eventDate": DateFormat("EEEE, d MMM y").format(eventDate!),
//         "eventTime": eventTime!.format(context),
//       }),
//       getDateTimeComponents(),
//     );
//
//     resetForm();
//   }
//   Future<void> cancelAllNotifications() async {
//     await notificationService.cancelAllNotifications();
//   }
//
//   void resetForm() {
//     segmentedControlGroupValue = 0;
//     eventDate = null;
//     eventTime = null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavBar(),
//       body: Stack(
//           children: [
//          Positioned.fill(
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(40),
//                     topLeft: Radius.circular(40)),
//                 gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.white.withOpacity(.6),
//                       Colors.white.withOpacity(.5),
//                       Colors.white.withOpacity(.4),
//                       Colors.white.withOpacity(.3),
//                       Colors.white.withOpacity(.2),
//                       Colors.white.withOpacity(.0),
//                       Colors.white.withOpacity(.0),
//                       Colors.white.withOpacity(.0),
//                       Colors.white.withOpacity(.0),
//                       Colors.white.withOpacity(.0),
//                     ])),
//             child: Padding(
//               padding: const EdgeInsets.all(40),
//               child: Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Header(),
//                       TextField(
//                         controller: _textEditingController,
//                         maxLength: maxTitleLength,
//                         decoration: InputDecoration(
//                           counterText: "",
//                           suffix: Container(
//                             padding: EdgeInsets.all(8.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4.0),
//                               color: Colors.grey[200],
//                             ),
//                             child: Text((maxTitleLength -
//                                     _textEditingController.text.length)
//                                 .toString()),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0),
//                       CupertinoSlidingSegmentedControl<int>(
//                         onValueChanged: (value) {
//                           if (value == 1) eventDate = null;
//                           setState(() => segmentedControlGroupValue = value!);
//                         },
//                         groupValue: segmentedControlGroupValue,
//                         padding: const EdgeInsets.all(4.0),
//                         children: <int, Widget>{
//                           0: Text("One time"),
//                           1: Text("Daily"),
//                           2: Text("Weekly")
//                         },
//                       ),
//                       SizedBox(height: 24.0),
//                       Text("Date & Time"),
//                       SizedBox(height: 12.0),
//                       GestureDetector(
//                         onTap: selectEventDate,
//                         child: DateField(eventDate: eventDate),
//                       ),
//                       SizedBox(height: 12.0),
//                       GestureDetector(
//                         onTap: () async {
//                           eventTime = await showTimePicker(
//                             context: context,
//                             initialTime: TimeOfDay(
//                               hour: currentTime.hour,
//                               minute: currentTime.minute + 1,
//                             ),
//                           );
//                           setState(() {});
//                         },
//                         child: TimeField(eventTime: eventTime),
//                       ),
//                       SizedBox(height: 20.0),
//                       ActionButtons(
//                         onCreate: onCreate,
//                         onCancel: resetForm,
//                       ),
//                       SizedBox(height: 12.0),
//                       GestureDetector(
//                         onTap: () async {
//                           await cancelAllNotifications();
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("All notfications cancelled"),
//                             ),
//                           );
//                         },
//                         child: _buildCancelAllButton(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),]
//       ),
//     );
//   }
//
//   Widget _buildCancelAllButton() {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Colors.indigo[100],
//       ),
//       padding: EdgeInsets.symmetric(
//         horizontal: 24.0,
//         vertical: 12.0,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Cancel all the reminders",
//             style: TextStyle(
//               fontSize: 16.0,
//               fontWeight: FontWeight.w500,
//               color: Colors.black87,
//             ),
//           ),
//           Icon(Icons.clear),
//         ],
//       ),
//     );
//   }
//
//   DateTimeComponents? getDateTimeComponents() {
//     if (segmentedControlGroupValue == 1) {
//       return DateTimeComponents.time;
//     } else if (segmentedControlGroupValue == 2) {
//       return DateTimeComponents.dayOfWeekAndTime;
//     }
//   }
//
//   void selectEventDate() async {
//     final today =
//         DateTime(currentDate.year, currentDate.month, currentDate.day);
//     if (segmentedControlGroupValue == 0) {
//       eventDate = await showDatePicker(
//         context: context,
//         initialDate: today,
//         firstDate: today,
//         lastDate: new DateTime(currentDate.year + 10),
//       );
//       setState(() {});
//     } else if (segmentedControlGroupValue == 1) {
//       eventDate = today;
//     } else if (segmentedControlGroupValue == 2) {
//       CustomDayPicker(
//         onDaySelect: (val) {
//           print("$val: ${CustomDayPicker.weekdays[val]}");
//           eventDate = today.add(
//               Duration(days: (val - today.weekday + 1) % DateTime.daysPerWeek));
//         },
//       ).show(context);
//     }
//   }
// }
//
// class NotificationService {
//   // Singleton pattern
//   static final NotificationService _notificationService =
//   NotificationService._internal();
//   factory NotificationService() {
//     return _notificationService;
//   }
//
//   NotificationService._internal();
//
//   static const channelId = "1";
//
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   static final AndroidNotificationDetails _androidNotificationDetails =
//   AndroidNotificationDetails(
//     channelId,
//     "thecodexhub",
//     channelDescription:
//     "This channel is responsible for all the local notifications",
//     playSound: true,
//     priority: Priority.high,
//     importance: Importance.high,
//   );
//
//   static final IOSNotificationDetails _iOSNotificationDetails =
//   IOSNotificationDetails();
//
//   final NotificationDetails notificationDetails = NotificationDetails(
//     android: _androidNotificationDetails,
//     iOS: _iOSNotificationDetails,
//   );
//
//
//   Future<void> init() async {
//     final AndroidInitializationSettings androidInitializationSettings =
//     AndroidInitializationSettings("app_icon");
//
//     final IOSInitializationSettings iOSInitializationSettings =
//     IOSInitializationSettings(
//       defaultPresentAlert: false,
//       defaultPresentBadge: false,
//       defaultPresentSound: false,
//     );
//
//     final InitializationSettings initializationSettings =
//     InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iOSInitializationSettings,
//     );
//
//     // *** Initialize timezone here ***
//     tz.initializeTimeZones();
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: onSelectNotification,
//     );
//   }
//
//   Future<void> requestIOSPermissions() async {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   Future<void> showNotification(
//       int id, String title, String body, String payload) async {
//
//     await flutterLocalNotificationsPlugin.show(
//       id,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }
//
//   Future<void> scheduleNotification(int id, String title, String body,
//       DateTime eventDate, TimeOfDay eventTime, String payload,
//       [DateTimeComponents? dateTimeComponents]) async {
//     final scheduledTime = eventDate.add(Duration(
//       hours: eventTime.hour,
//       minutes: eventTime.minute,
//     ));
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledTime, tz.local),
//       notificationDetails,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true,
//       payload: payload,
//       matchDateTimeComponents: dateTimeComponents,
//     );
//   }
//
//   Future<void> cancelNotification(int id) async {
//     await flutterLocalNotificationsPlugin.cancel(id);
//   }
//
//   Future<void> cancelAllNotifications() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }
// }
//
// Future<void> onSelectNotification(String? payload) async {
//   await navigatorKey.currentState
//       ?.push(MaterialPageRoute(builder: (_) => DetailsPage(payload: payload)));
// }
