import 'package:flutter/cupertino.dart';
import 'package:flutter_lovers/app/tab_items.dart';

class MyCustomBottomNavigation extends StatelessWidget {
  const MyCustomBottomNavigation(
      {super.key,
      required this.currentTab,
      required this.onSelectedTab,
      required this.sayfaOlusturucu,
      required this.navigatorKeys});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map sayfaOlusturucu;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            _navItemOlustur(TabItem.Kullanicilar),
            _navItemOlustur(TabItem.Konusmalarim),
            _navItemOlustur(TabItem.Profil),
          ],
          onTap: (index) => onSelectedTab(TabItem.values[index]),
        ),
        tabBuilder: (context, index) {
          final gosterilecekItem = TabItem.values[index];

          return CupertinoTabView(
              navigatorKey: navigatorKeys[gosterilecekItem],
              builder: (context) {
                return sayfaOlusturucu[gosterilecekItem];
              });
        });
  }

  BottomNavigationBarItem _navItemOlustur(TabItem tabItem) {
    final olusturulacakTab = TabItemData.tumTablar[tabItem];

    return BottomNavigationBarItem(
      icon: Icon(olusturulacakTab!.icon),
      label: olusturulacakTab.title,
    );
  }
}
