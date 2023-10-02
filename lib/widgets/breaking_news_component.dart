import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakingNewsComponent extends StatefulWidget {
  const BreakingNewsComponent(
      {super.key,
      required this.url,
      required this.title, required this.source,
   });
  final String url;
  final String title;
  final String source;


  @override
  State<BreakingNewsComponent> createState() => _BreakingNewsComponentState();
}

class _BreakingNewsComponentState extends State<BreakingNewsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(2, 4))
          ],
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(widget.url))),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.source,
              style: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.cyan),
            ),
            Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
