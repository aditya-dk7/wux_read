import 'package:flutter/material.dart';
import 'package:wux_read/models/wuxia_novel_model.dart';
import 'package:wux_read/network/network_request.dart';
import 'package:wux_read/screens/wuxia_novel_detailed_page.dart';
import 'package:wux_read/widgets/wuxia_novel_widget.dart';

import '../utils/routes.dart';

class HomeScreen extends StatefulWidget {
  final String token;

  const HomeScreen(this.token);

  static circularProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  goToDetailedPage(BuildContext context, WuxiaNovel wuxiaNovel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WuxiaNovelDetails(wuxiaNovel),
      ),
    );
  }

  gridView(AsyncSnapshot<List<WuxiaNovel>> snapshot) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(5),
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: (0.65),
      children: snapshot.data!.map((wuxiaNovel) {
        return GestureDetector(
          child: WuxiaNovelWidget(wuxiaNovel),
          onTap: () {
            goToDetailedPage(context, wuxiaNovel);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: FutureBuilder<List<WuxiaNovel>>(
                  future: NetworkRequest.fetchWuxiaNovels(widget.token),
                  builder: ((context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return gridView(snapshot);
                    }
                    return HomeScreen.circularProgress();
                  })),
            )
          ],
        ),
      ),
    );
  }
}
