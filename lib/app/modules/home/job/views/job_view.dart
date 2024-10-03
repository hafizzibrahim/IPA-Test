import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/job_controller.dart';

class JobView extends GetView<JobController> {
  const JobView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JobView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JobView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
