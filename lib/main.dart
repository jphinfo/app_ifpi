import 'package:app_working/core/app_colors.dart';
import 'package:app_working/models/auth.dart';
import 'package:app_working/models/contac_models.dart';
import 'package:app_working/pages/auth_or_home_page.dart';
import 'package:app_working/pages/auth_page.dart';
import 'package:app_working/pages/contact_list_page.dart';
import 'package:app_working/pages/fuel_page.dart';
import 'package:app_working/pages/imc_page.dart';
import 'package:app_working/pages/location_page.dart';
import 'package:app_working/pages/map_page.dart';
import 'package:app_working/pages/ui/contact_page.dart';
import 'package:app_working/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MaterialApp(
        title: 'Meus Aplicativos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(secondary: AppColors.yellow_01),
          canvasColor: const Color.fromARGB(255, 219, 233, 207),
          textTheme: const TextTheme(
            headline2: TextStyle(color: Colors.white),
          ),
          primaryColor: const Color.fromARGB(255, 30, 233, 108),
          secondaryHeaderColor: Colors.white70,
        ),
        //home: const FuelWidget(),
        //initialRoute: AppRouters.AUTH_PAGE,
        initialRoute: AppRouters.AUTH_PAGE,
        routes: {
          //AppRouters.AUTH: (context) => const AuthPage(),
          AppRouters.AUTH_PAGE: (context) => const AuthOrHomePage(),
          AppRouters.HOME: (context) => const HomePage(),
          AppRouters.CONTACT_LIST: (context) => const ContactListWidget(),
          AppRouters.MAP: (context) => const MapPageWiget(),
          AppRouters.FUEL: (context) => const FuelWidget(),
          //AppRouters.CONTACT_PAGE: (context) => const ContactPage(),
        },
      ),
    );
  }
}
