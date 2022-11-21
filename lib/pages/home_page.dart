import 'package:app_working/components/drawer_widget.dart';
import 'package:app_working/core/app_colors.dart';
import 'package:app_working/core/app_images.dart';
import 'package:app_working/pages/imc_page.dart';
import 'package:app_working/pages/map_page.dart';
import 'package:app_working/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../components/button_widget.dart';
import '../models/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _openMap() async {
      await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const MapPageWiget(),
      ));
    }

    Future<void> _openCalculator() async {
      await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => const ImcPage(),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Aplicativos'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<Auth>(context, listen: false).logout();

              Navigator.of(context).pushReplacementNamed(AppRouters.AUTH_PAGE);
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 80),
            Container(
              padding: EdgeInsets.zero,
              //color: Colors.amber,
              height: 150,
              child: Image.asset(AppImages.iconIfpi),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    icon: Icons.contact_phone_outlined,
                    navigator: () => Navigator.of(context)
                        .pushNamed(AppRouters.CONTACT_LIST),
                  ),
                  ButtonWidget(
                    icon: Icons.map,
                    navigator: _openMap,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    icon: Icons.balance_outlined,
                    navigator: _openCalculator,
                  ),
                  ButtonWidget(
                    icon: Icons.local_gas_station,
                    navigator: () =>
                        Navigator.of(context).popAndPushNamed(AppRouters.FUEL),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
