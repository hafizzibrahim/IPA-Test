import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/themes.dart';

SnackbarController customSnackbar(String text) {
  return Get.snackbar(
    "",
    text,
    titleText: const SizedBox.shrink(),
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: mediumText12.copyWith(
            fontSize: 14,
            color: neutral01Color,
          ),
        ),
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
    backgroundColor: primaryDarkBlueColor,
    borderRadius: 5,
  );
}
