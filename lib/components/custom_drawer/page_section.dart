import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_clone/components/custom_drawer/page_tile.dart';
import 'package:xlo_clone/stores/page_store.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            pageStore.setPage(0);
          },
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {
            pageStore.setPage(1);
          },
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            pageStore.setPage(2);
          },
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            pageStore.setPage(3);
          },
          highlighted: pageStore.page == 3,
        ),
        PageTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {
            pageStore.setPage(4);
          },
          highlighted: pageStore.page == 4,
        ),
        userManagerStore.isLogedIn
            ? PageTile(
                label: 'Realizar logout',
                iconData: Icons.logout,
                onTap: () {
                  print('logout');
                },
                highlighted: pageStore.page == 5,
              )
            : Container(),
      ],
    );
  }
}
