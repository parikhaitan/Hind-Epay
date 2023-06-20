import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SPController extends GetxController {
  static SPController get instance => Get.find();

  // final String nameOfService;
  // final int numberOfVouchers;
  // final double amountPerVoucher;
  //For User
  final serviceController = TextEditingController();
  final amountController = TextEditingController();
}