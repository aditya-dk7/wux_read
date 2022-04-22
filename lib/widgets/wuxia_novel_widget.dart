import 'package:flutter/material.dart';
import 'package:wux_read/models/wuxia_novel_model.dart';
import 'package:google_fonts/google_fonts.dart';

class WuxiaNovelWidget extends StatelessWidget {
  @required
  final WuxiaNovel wuxiaNovel;

  const WuxiaNovelWidget(this.wuxiaNovel);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0)),
              child: Image.network(wuxiaNovel.imageUrl),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 1.0, bottom: 1.0),
                child: SizedBox(
                    child: Text(wuxiaNovel.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 13.0))))
          ],
        ));
  }
}
