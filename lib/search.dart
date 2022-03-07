import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                cursorColor: Colors.white,
                cursorHeight: 20,
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.4),
                  //focusedBorder: InputBorder.none,

                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.mic,
                    color: Colors.grey,
                  ),
                  hintText: 'Search for a movie, Tv shows,......',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
                    child: Text(
                      'Top Searches',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: getUpComing(),
                      builder: (context, snapshot) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 3,
                            );
                          },
                          itemCount: upcoming.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: ListTile(
                                leading: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          'http://image.tmdb.org/t/p/w500' +
                                              upcoming[index]['backdrop_path'],
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: Text(
                                  upcoming[index]['original_title'],
                                  maxLines: 2,
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              onTap: () {},
                            );
                          },
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
