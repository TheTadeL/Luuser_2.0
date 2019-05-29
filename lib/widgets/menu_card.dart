import 'package:flutter/material.dart';
import 'package:luuser_fltr/screens/about/index.dart';

class MenuCard extends StatelessWidget {
  MenuCard({this.title, this.description, this.icon});

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(top: 16, left: 8, right: 8),
      child: InkWell(
        splashColor: Colors.red.withAlpha(100),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AboutScreen(),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(
                      icon,
                      size: 64,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      description != null ? Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          description,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ) : Container(),
                    ],
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
