import 'package:flutter/material.dart';
import 'package:popular_movie/data/models/movie.dart';
import 'package:popular_movie/presentation/Widgets/atoms/horizontal_card.dart';
import 'package:popular_movie/presentation/Widgets/atoms/vertical_card.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  const DetailPage(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies Demo"),
        ),
        body: Builder(
          builder: (context) {
            if (orientation == Orientation.portrait) {
              return Row(
                children: [
                  Expanded(
                    child: HorizontalCard(
                      imgSource: movie.image ?? '',
                      lang: movie.language,
                      rate: movie.voteAverage,
                      releaseDate: movie.releaseDate,
                      title: movie.title,
                      detail: movie.overview,
                    ),
                  )
                ],
              );
            } else {
              return VerticalCard(
                imgSource: movie.image ?? '',
                lang: movie.language,
                rate: movie.voteAverage,
                releaseDate: movie.releaseDate,
                title: movie.title,
                detail: movie.overview,
              );
            }
          },
        ));
  }
}
