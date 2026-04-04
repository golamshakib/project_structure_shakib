import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/widgets/custom_text.dart';
import '../constants/app_sizes.dart';
import '../constants/image_path.dart';

class AppHelperFunctions{
 AppHelperFunctions._();

 static void showSnackBar(String message) {
  Get.rawSnackbar(
   snackPosition: SnackPosition.TOP,
   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
   borderRadius: 24,
   backgroundColor: Colors.transparent,
   duration: const Duration(seconds: 3),
   animationDuration: const Duration(milliseconds: 600),
   isDismissible: true,
   snackStyle: SnackStyle.FLOATING,
   overlayBlur:0,
   barBlur: 3.0,
   padding: EdgeInsets.zero,
   messageText: ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: BackdropFilter(
     filter: ColorFilter.mode(
      Colors.black.withAlpha(20),
      BlendMode.darken,
     ),
     child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
       color: Colors.white.withAlpha(10),
       borderRadius: BorderRadius.circular(24),
       border: Border.all(
        color: Colors.white.withAlpha(20),
        width: 0.5,
       ),
      ),
      child: Row(
       children: [
        /// App Icon Container
        Container(
         height: getHeight(38),
         width: getWidth(38),
         decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
           BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 4,
            offset: const Offset(0, 2),
           ),
          ],
         ),
         padding: const EdgeInsets.all(6),
         child: SvgPicture.asset(
          ImagePath.appLogo,
         ),
        ),

        const SizedBox(width: 12),

        /// Message
        Expanded(
         child: CustomText(
          text: message,
          fontSize: getWidth(16),
          fontWeight: FontWeight.w700,
          textColor: Colors.white,
         ),
        ),
       ],
      ),
     ),
    ),
   ),
  );
 }

 static void showAlert(String title, String message) {
  showDialog(
   context: Get.context!,
   builder: (BuildContext context) {
    return AlertDialog(
     title: Text(title),
     content: Text(message),
     actions: [
      TextButton(
       onPressed: () => Navigator.of(context).pop(),
       child: const Text('OK'),
      ),
     ],
    );
   },
  );
 }


 static void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
   context,
   MaterialPageRoute(builder: (_) => screen),
  );
 }


 static String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
   return text;
  } else {
   return '${text.substring(0, maxLength)}...';
  }
 }

 static bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
 }
 static Size screenSize() {
  return MediaQuery.of(Get.context!).size;
 }

 static double screenHeight() {
  return MediaQuery.of(Get.context!).size.height;
 }
 static double screenWidth() {
  return MediaQuery.of(Get.context!).size.width;
 }

 static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
  return DateFormat(format).format(date);
 }

 static List<T> removeDuplicates<T>(List<T> list) {
  return list.toSet().toList();
 }

 static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
  final wrappedList = <Widget>[];
  for (var i = 0; i < widgets.length; i += rowSize) {
   final rowChildren = widgets.sublist(
    i,
    i + rowSize > widgets.length ? widgets.length : i + rowSize,
   );
   wrappedList.add(Row(children: rowChildren));
  }
  return wrappedList;
 }

}

extension EnumToText on String {
 String enumToText() {
  // Replace underscores with spaces, convert to lowercase, then capitalize each word
  return split('_')
      .map((word) => word.isEmpty
      ? word
      : word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join(' ');
 }
}