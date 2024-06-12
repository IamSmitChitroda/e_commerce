import 'package:flutter/cupertino.dart';

CupertinoNavigationBar iosHpNavigationBar() => CupertinoNavigationBar(
      middle: const Text('City Shop'),
      leading: CupertinoButton(
        onPressed: () {},
        child: const Icon(CupertinoIcons.person_fill),
      ),
      trailing: CupertinoButton(
        onPressed: () {},
        child: const Icon(CupertinoIcons.bell_fill),
        // icon:
      ),
    );
