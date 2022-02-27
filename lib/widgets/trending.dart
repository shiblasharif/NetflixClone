import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:netflix_clone/movies.dart';

class TrendingNow extends StatefulWidget {
  const TrendingNow({Key? key}) : super(key: key);

  @override
  _TrendingNowState createState() => _TrendingNowState();
}

class _TrendingNowState extends State<TrendingNow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        moviesList(),
      ],
    );
  }

  moviesList() {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
          future: getLatest(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List toRev = snapshot.data as List;
              List popular = toRev.reversed.toList();
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Movies(
                                    movie: popular[index],
                                  ))),
                      child: SizedBox(
                        width: 145,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          popular[index]['poster_path'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
