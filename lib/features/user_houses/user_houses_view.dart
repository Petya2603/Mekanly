import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class UserHousesView extends StatelessWidget {
  const UserHousesView({super.key});

  static const routePath = '/user-houses-view';
  static const routeName = 'user-houses-view';

  static Widget builder(BuildContext context, GoRouterState state) {
    return const UserHousesView();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
