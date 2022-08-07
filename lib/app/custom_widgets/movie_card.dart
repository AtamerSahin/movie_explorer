import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  String? img;
  String? name;
  String? point;
  MovieCard({this.name, this.img, this.point});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        img != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: deviceHeight * 0.17,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/" + img!,
                    ),
                  )),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.transparent, width: 1),
                      ),
                      child: Text(
                        point!,
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: deviceHeight * 0.17,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    point!,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
        name != null
            ? Expanded(
                child:
                    Center(child: Text(name!, style: TextStyle(fontSize: 14))))
            : Container(),
      ],
    );
  }
}
