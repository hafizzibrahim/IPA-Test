import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/themes.dart';

SnackbarController customSnackbar(String text,
    [Color? color, Duration? duration]) {
  return Get.snackbar(
    "",
    text,
    titleText: const SizedBox.shrink(),
    duration: duration ?? const Duration(seconds: 3),
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: mediumText12.copyWith(
              fontSize: 14,
              color: neutral01Color,
            ),
            maxLines: null,
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Text(
            "Close",
            style: mediumText12.copyWith(fontSize: 14),
          ),
        ),
      ],
    ),
    backgroundColor: color ?? primaryDarkBlueColor,
    borderRadius: 10,
  );
}
