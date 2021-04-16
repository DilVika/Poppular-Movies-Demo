import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  final String title;
  final String imgSource;
  final String? lang;
  final String releaseDate;
  final String? detail;

  final double rate;
  final int countRates;

  VerticalCard(
      {required this.imgSource,
      required this.title,
      required this.lang,
      required this.releaseDate,
      this.detail = "",
      this.rate = 0,
      this.countRates = 0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Card(
        margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
        elevation: 4,
        child: Row(
          children: [
            Image.network(
              imgSource,
              fit: BoxFit.scaleDown,
            ),
            Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    if (lang != null)
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Language: $lang"))
                    else
                      Container(),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("Released: $releaseDate")),
                    Divider(),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Overview: $detail"))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
