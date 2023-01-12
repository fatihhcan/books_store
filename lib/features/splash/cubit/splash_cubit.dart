import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/cubit/base_cubit.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> with BaseCubit {
  SplashCubit() : super(SplashInitial());
  Timer? dialogTimer;

  @override
  void init() async {

  }

  Future<void> routeHome() async {
 Future.delayed(const Duration(seconds: 3), () {
//route
    });
  }

  @override
  void setContext(BuildContext context) => this.context = context;
}
