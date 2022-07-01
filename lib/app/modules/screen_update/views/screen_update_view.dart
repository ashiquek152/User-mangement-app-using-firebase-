import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_update_controller.dart';

class ScreenUpdateView extends GetView<ScreenUpdateController> {
  const ScreenUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenUpdateView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ScreenUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
