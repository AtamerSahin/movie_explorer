import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  String? img;
  String? name;
  String? point;
  double? height;
  MovieCard({this.name, this.img, this.point, this.height});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        img != null
            ? Container(
                height: deviceHeight * height!,
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
              )
            : Container(
                height: deviceHeight * height!,
                alignment: Alignment.bottomLeft,
                child: Text(
                  point!,
                  style: TextStyle(fontSize: 18),
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
