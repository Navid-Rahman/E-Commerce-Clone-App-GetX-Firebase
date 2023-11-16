import 'package:daraz_idea_firebase/constants/consts.dart';
import 'package:daraz_idea_firebase/controllers/home-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// initialize home controller

    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 25,
        ),
        label: home,
      ),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 25,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 25,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 25,
          ),
          label: account),
    ];

    var navBody = [
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.yellow),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
    );
  }
}
