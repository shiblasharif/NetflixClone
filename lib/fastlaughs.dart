import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model.dart';

class FastLaughs extends StatefulWidget {
  const FastLaughs({Key? key}) : super(key: key);

  @override
  _FastLaughsState createState() => _FastLaughsState();
}

class _FastLaughsState extends State<FastLaughs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getPopular(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List upcoming = snapshot.data as List;
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: upcoming.length,
                itemBuilder: (ctx, index) {
                  return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            kBottomNavigationBarHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                'http://image.tmdb.org/t/p/w500' +
                                    upcoming[index]['poster_path'],
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            icons(
                              Icons.emoji_emotions_rounded,
                              "50k",
                            ),
                            icons(Icons.add, "My List"),
                            icons(Icons.share, "Share"),
                            icons(Icons.play_arrow, "Play"),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Column icons(IconData icons, String title) {
    return Column(
      children: [
        Icon(
          icons,
          color: Colors.white,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
