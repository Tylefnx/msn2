import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:msn2/core/presentation/app_text.dart';
import 'package:msn2/friends/presentation/dm_page.dart';
import 'package:msn2/friends/presentation/friends_page.dart';

@RoutePage()
class UserMainPage extends StatelessWidget {
  const UserMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}

void onTap(ValueNotifier<int> selectedIndex, int value) {
  selectedIndex.value = value;
}

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    final List<Widget> pages = <Widget>[
      const FriendsPage(),
      const DmPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: AppText.normal(
          text: 'Mesajlaşma Uygulaması',
        ),
      ),
      body: pages[selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Arkadaş Ekle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'DM Kutusu',
          ),
        ],
        currentIndex: selectedIndex.value,
        selectedItemColor: Colors.blue,
        onTap: (value) => onTap(selectedIndex, value),
      ),
    );
  }
}
