import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hostel_management_user/constants.dart';
import 'package:hostel_management_user/controllers/navigation_controller.dart';
import 'package:hostel_management_user/screens/activity.dart';
import 'package:hostel_management_user/screens/home.dart';
import 'package:hostel_management_user/screens/payments.dart';
import 'package:hostel_management_user/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: GetMaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        )),
        home: Consumer<NavigationController>(
            builder: (context, NavigationController navigationController, _) {
          return Scaffold(
            body: IndexedStack(
              index: navigationController.selectedIndex,
              children: const [
                HomeScreen(),
                PaymentsScreen(),
                ActivityScreen()
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      if (navigationController.selectedIndex != 0) {
                        navigationController.changeSelectedIndex(index: 0);
                      } else {
                        HapticFeedback.lightImpact();
                      }
                    },
                    icon: Icon(navigationController.selectedIndex == 0
                        ? Iconsax.home5
                        : Iconsax.home),
                    color: kPrimaryColor.withOpacity(0.8),
                  ),
                  IconButton(
                      onPressed: () {
                        if (navigationController.selectedIndex != 1) {
                          navigationController.changeSelectedIndex(index: 1);
                        } else {
                          HapticFeedback.lightImpact();
                        }
                      },
                      icon: Icon(
                        navigationController.selectedIndex == 1
                            ? Iconsax.money5
                            : Iconsax.money,
                        color: kPrimaryColor,
                        size: 24.0,
                      )),
                  IconButton(
                      onPressed: () {
                        if (navigationController.selectedIndex != 2) {
                          navigationController.changeSelectedIndex(index: 2);
                        } else {
                          HapticFeedback.lightImpact();
                        }
                      },
                      icon: Icon(
                        navigationController.selectedIndex == 2
                            ? Iconsax.activity5
                            : Iconsax.activity,
                        color: kPrimaryColor,
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
