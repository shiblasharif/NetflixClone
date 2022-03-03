import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/model/model.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return NestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            snap: true,
            backgroundColor: Colors.transparent,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "Downloads",
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                  ),
                ),
                actions: [
                  const Icon(
                    Icons.cast,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "assets/images/avatar.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          )
        ];
      }),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              'Smart Downloads',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FutureBuilder(
            future: getPopular(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List downloaded = snapshot.data as List;
                return Column(
                  children: [
                    downloads(downloaded, 4),
                    downloads(downloaded, 5),
                  ],
                );
              }
              return Container();
            },
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Introducing Downloads for You',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We'll download a personalised selection of movies and shows for you. so these always something to watch on your device.",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                  future: getTopRated(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List poster = snapshot.data as List;
                      return Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 280,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[850],
                            ),
                          ),
                          Positioned(
                            // left: 80,
                            // bottom: 10,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-25 / 360),
                              child: Container(
                                height: 205,
                                width: 140,
                                margin: EdgeInsets.only(right: 130, bottom: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'http://image.tmdb.org/t/p/w500' +
                                            poster[3]['poster_path'],
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // bottom: 10,
                            // left: 180,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(13 / 360),
                              child: Container(
                                height: 205,
                                width: 140,
                                margin: EdgeInsets.only(left: 150, bottom: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'http://image.tmdb.org/t/p/w500' +
                                            poster[10]['poster_path'],
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 225,
                              width: 150,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          poster[6]['poster_path'],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: MaterialButton(
                  minWidth: 500,
                  color: Colors.blue,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Set up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: MaterialButton(
                  minWidth: 500,
                  color: Colors.white,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "See what you can download",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  ListTile downloads(List<dynamic> downloaded, int index) {
    return ListTile(
      leading: Container(
        height: 90,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'http://image.tmdb.org/t/p/w500' +
                  downloaded[index]['backdrop_path'],
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        downloaded[index]['title'],
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
      ),
      subtitle: const Text(
        "10-17 Episodes |2.6 GB",
        style: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: Colors.white70,
      ),
    );
  }
}
