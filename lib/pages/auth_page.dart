import 'package:app_working/components/auth_form.dart';
import 'package:app_working/core/app_colors.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.green_01,
                  AppColors.yellow_02,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.zero,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: 100,
                      width: 250,
                      child: Image.asset('assets/images/logo_ifpi_v2.png'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const AuthForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
