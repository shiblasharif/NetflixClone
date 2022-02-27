import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:netflix_clone/movies.dart';

class TopTen extends StatefulWidget {
  const TopTen({Key? key}) : super(key: key);

  @override
  _TopTenState createState() => _TopTenState();
}

class _TopTenState extends State<TopTen> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        movies(),
      ],
    );
  }

  movies() {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
          future: getPopular(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List topTen = snapshot.data as List;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    num = index + 1;
                    return Stack(
                      children: [
                        Container(
                          width: 160,
                        ),
                        Positioned(
                          left: 25,
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Movies(
                                          movie: topTen[index],
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500' +
                                                topTen[index]['poster_path'],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 5,
                          child: BorderedText(
                            strokeColor: Colors.white70,
                            strokeWidth: 10.0,
                            child: Text(
                              '$num',
                              style: const TextStyle(
                                decoration: TextDecoration.none,
                                decorationColor: Colors.black,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        num == 1
                            ? Container()
                            : Container(
                                width: 30,
                                height: 300,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black,
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
