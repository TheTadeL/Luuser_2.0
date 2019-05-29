import 'package:flutter/material.dart';
import 'package:luuser_fltr/widgets/menu_card.dart';
import 'package:luuser_fltr/widgets/meatball_menu.dart';

/// HOME ///
class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  static const String _title = 'Luuser';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          MeatBallMenu(context: context),
        ],
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MenuCard(
            title: 'Neue Kontrolle erfassen',
            description: 'Eine neue Kontrolle für eine beliebeige Schule und '
                'Klasse erfassen.',
            icon: Icons.event_note),
        MenuCard(
            title: 'Liste der eingetragenen Einrichtungen',
            description:
                'Hier sind alle eingetragenen Einrichtungen wie Schulen '
                'und Kindergärten zu finden. Neue Einrichtungen können hier'
                'eingetragen werden.',
            icon: Icons.school),
        MenuCard(
            title: 'Kontrollen einsehen',
            description: 'Kontrollen durchsuchen und filtern. Hier können auch '
                'Excel-Tabellen generiert werden',
            icon: Icons.search),
        MenuCard(title: 'Mein Profil', icon: Icons.person),
      ],
    );
  }
}
