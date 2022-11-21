import 'package:app_working/pages/auth_page.dart';
import 'package:app_working/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return auth.isAuth ? const HomePage() : const AuthPage();
  }
}
