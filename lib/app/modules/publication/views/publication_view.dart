import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/publication_controller.dart';

class PublicationView extends GetView<PublicationController> {
  const PublicationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PublicationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PublicationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
