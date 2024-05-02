import 'package:barokah_cars_project/app/modules/navigation_bar/controllers/navigation_bar_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarView extends GetView<NavigationBarController> {
  const NavigationBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationBarController>(builder: (controller) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFE82027),
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
          destinations: const [
            NavigationDestination(icon: Icon(FluentIcons.home_20_regular, size: 25,), label: '', selectedIcon: Icon(FluentIcons.home_20_filled, size: 28,),),
            NavigationDestination(icon: Icon(FluentIcons.search_20_filled, size: 25,), label: '', selectedIcon: Icon(FluentIcons.search_20_filled, size: 28,),),
            NavigationDestination(icon: Icon(FluentIcons.receipt_20_regular, size: 25,), label: '', selectedIcon: Icon(FluentIcons.receipt_20_filled, size: 28,),),
            NavigationDestination(icon: Icon(FluentIcons.person_20_regular, size: 25,), label: '', selectedIcon: Icon(FluentIcons.person_20_filled, size: 28,),),
          ]
          ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
    });
  }
}