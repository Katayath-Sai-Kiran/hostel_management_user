import 'package:hostel_management_user/controllers/navigation_controller.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<NavigationController>(
    create: (context) => NavigationController(),
  )
];
