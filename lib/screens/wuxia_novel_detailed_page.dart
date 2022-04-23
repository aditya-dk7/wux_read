import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/wuxia_novel_model.dart';

class WuxiaNovelDetails extends StatefulWidget {
  @required
  final WuxiaNovel wuxiaNovel;

  const WuxiaNovelDetails(this.wuxiaNovel);

  @override
  State<WuxiaNovelDetails> createState() => _WuxiaNovelDetailsState();
}

class _WuxiaNovelDetailsState extends State<WuxiaNovelDetails> {

  isHots() {
    return Material(
      color: widget.wuxiaNovel.hots ? Colors.red : const Color(0xffEEF0F4),
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: null,
        child: Container(
          width: 36,
          height: 14,
          alignment: Alignment.center,
          child: widget.wuxiaNovel.hots
              ? const Text(
                  "HOTS",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9),
                )
              : const Text(""),
        ),
      ),
    );
  }

  String isAdaptedToManhwa() {
    if (widget.wuxiaNovel.adaptedToManhwa) {
      return "Yes";
    }
    return "No";
  }

  String isTranslationFinished() {
    if (widget.wuxiaNovel.translationFinished) {
      return "Finished";
    }
    return "Ongoing";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 22.0, right: 5.0, top: 1.0, bottom: 1.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                      child: Image.network(
                        widget.wuxiaNovel.imageUrl,
                        height: 230.0,
                        width: 170.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 1.0, right: 35.0, top: 1.0, bottom: 1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Rating",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                                color: const Color(0xff565656), fontSize: 16.0),
                          ),
                          Text(
                            "${widget.wuxiaNovel.rating}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Author",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                                color: const Color(0xff565656), fontSize: 14.0),
                          ),
                          Text(
                            widget.wuxiaNovel.author,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Last Chapter Read",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                                color: const Color(0xff565656), fontSize: 14.0),
                          ),
                          Text(
                            "${widget.wuxiaNovel.lastChapterRead}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Adapted To Manhwa",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                                color: const Color(0xff565656), fontSize: 14.0),
                          ),
                          Text(
                            isAdaptedToManhwa(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Translation Status",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                                color: const Color(0xff565656), fontSize: 14.0),
                          ),
                          Text(
                            isTranslationFinished(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.merriweatherSans(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      isHots(),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.wuxiaNovel.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweatherSans(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.wuxiaNovel.description,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.merriweatherSans(
                        color: const Color(0xff000000),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Material(
                    color: const Color(0xff3766FF),
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      onTap: () { launch(widget.wuxiaNovel.url);},
                      child: Container(
                        width: 300,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          "Click Here To Read",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
