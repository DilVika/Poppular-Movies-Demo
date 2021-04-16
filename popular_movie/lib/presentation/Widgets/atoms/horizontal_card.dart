import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HorizontalCard extends StatelessWidget {
  final String title;
  final String imgSource;
  final String? lang;
  final String releaseDate;
  final Function()? onTap;
  final String? detail;

  final double rate;
  final int countRates;

  HorizontalCard(
      {required this.imgSource,
      required this.title,
      required this.lang,
      required this.releaseDate,
      required this.rate,
      this.countRates = 0,
      this.onTap,
      this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size(300, 500)),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          // margin: EdgeInsets.only(10),
          elevation: 4,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 3,
                child: Image.network(
                  imgSource,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        title,
                        style:
                            theme.textTheme.headline6?.copyWith(fontSize: 17),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        //textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lang ?? "" + " " + releaseDate,
                          style: theme.textTheme.subtitle2
                              ?.copyWith(fontWeight: FontWeight.normal),
                        ),
                        // Text
                        //Text(releaseDate, style: theme.textTheme.subtitle2),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: rate,
                          minRating: 0.0,
                          maxRating: 10.0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemSize: 26,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            // size: 1,
                          ),
                          onRatingUpdate: (rating) {
                            //print(rating);
                          },
                        ),
                      ],
                    ),
                    detail != null
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text(
                              detail ?? '',
                              style: theme.textTheme.bodyText1,
                              //overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
