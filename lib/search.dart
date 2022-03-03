import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              style: TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Top Searches",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
           // ListView.separated(itemBuilder: (context,index)=>SizedBox(height: 10,), separatorBuilder: (context,index))=>SizedBox(height: 10,), itemCount: 10)
        
          ],
        ),
      )),
    );
  }
}
