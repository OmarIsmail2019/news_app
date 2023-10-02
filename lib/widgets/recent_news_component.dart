import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsComponent extends StatefulWidget {
  const NewsComponent(
      {super.key, required this.url, required this.title, required this.time});
  final String url;
  final String title;
  final String time;
  @override
  State<NewsComponent> createState() => _NewsComponentState();
}

class _NewsComponentState extends State<NewsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black45,
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(1, 1))
          ],
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(widget.url))),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.grey.shade500],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            ),
            Text(
              widget.time,
              style: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
