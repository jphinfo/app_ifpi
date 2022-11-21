import 'package:app_working/core/app_images.dart';
import 'package:app_working/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context, listen: false);
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            otherAccountsPictures: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mode_night,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
            currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(AppImages.fofura)),
            accountName: const Text(
              'Joseph Machado ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
            accountEmail: Text(
              "${auth.email}",
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white70,
              ),
            ),
            onDetailsPressed: () {},
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicial'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Loja'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pedidos'),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(Icons.map_outlined),
              title: const Text('Mapa'),
              onTap: () =>
                  Navigator.of(context).popAndPushNamed(AppRouters.MAP)),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(AppRouters.AUTH_PAGE);
            },
          ),
        ],
      ),
    );
  }
}
