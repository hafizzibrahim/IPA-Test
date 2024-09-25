// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:maritimmuda_connect/app/modules/e_kta/views/e_kta_detail_view.dart';
// import 'package:maritimmuda_connect/themes.dart';

// import '../controllers/e_kta_controller.dart';

// class EKtaView extends GetView<EKtaController> {
//   const EKtaView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ,
//       appBar: AppBar(
//         title: const Text('EKtaView'),
//         centerTitle: true,
//         scrolledUnderElevation: 0.0,
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         colors: [primaryBlueColor, primaryDarkBlueColor],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight)),
//               ),
//             ),
//             Center(
//               child: Container(
//                 // height: 335,
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 margin: const EdgeInsets.all(30),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: neutral04Color.withOpacity(0.1),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Image.asset("assets/images/qrcode.png", scale: 4),
//                     const SizedBox(height: 15),
//                     Text("Fajar genthur ilham",
//                         style: regulerText20.copyWith(color: neutral01Color)),
//                     IconButton(
//                         onPressed: () {
//                           Get.to(() => EKtaDetailView());
//                         },
//                         icon: Icon(Icons.abc))
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 80,
//               left: 150,
//               child: Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage("assets/images/profile.png"))),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/e_kta/views/e_kta_detail_view.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_button.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../controllers/e_kta_controller.dart';

class EKtaView extends GetView<EKtaController> {
  const EKtaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EKtaView'),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [primaryBlueColor, primaryDarkBlueColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 425,
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: neutral04Color.withOpacity(0.1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Fajar genthur ilham",
                          style: regulerText20.copyWith(color: neutral01Color)),
                      const SizedBox(height: 10),
                      Image.asset("assets/images/qrcode.png", scale: 4),
                      const SizedBox(height: 15),
                      CustomButton(
                          text: "Show E-KTA",
                          onPressed: () {
                            Get.to(() => EKtaDetailView());
                          })
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 150,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/profile.png"))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
