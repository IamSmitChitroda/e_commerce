import 'package:e_commerce/headers.dart';

AppBar hpAppbar() => AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu_rounded),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
      centerTitle: true,
      title: const Text('City Shop'),
    );
