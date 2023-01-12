import 'package:flutter/material.dart';

import '../../init/navigation/navigation_service.dart';
import '../../init/network/dio_manager.dart';


abstract class BaseCubit {
  BuildContext? context;
  DioManager dioManager = DioManager.instance;

  NavigationService navigation = NavigationService.instance;
  
  void setContext(BuildContext context);
  void init();
}