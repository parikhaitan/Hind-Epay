import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();


  final countryController = TextEditingController();
  final userName = TextEditingController();
  final phoneNo = TextEditingController();
  final emailId = TextEditingController();

  //For Service Provider
  final orgName = TextEditingController();
  final serviceName = TextEditingController();
  final phoneNumber = TextEditingController();
  final name = TextEditingController();



//Call this Function from Design & it will do the rest


}