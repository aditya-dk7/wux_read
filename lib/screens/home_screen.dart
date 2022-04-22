import 'package:flutter/material.dart';
import 'package:wux_read/models/wuxia_novel_model.dart';
import 'package:wux_read/network/network_request.dart';
import 'package:wux_read/widgets/wuxia_novel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  gridView(AsyncSnapshot<List<WuxiaNovel>> snapshot) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(5),
      crossAxisSpacing: 10,
      mainAxisSpacing: 1,
      crossAxisCount: 2,
      children: snapshot.data!.map((wuxiaNovel) {
        return GestureDetector(
          child: WuxiaNovelWidget(wuxiaNovel),
          onTap: () {
            // goToDetailedPage(context, wuxiaNovel);
          },
        );
      }).toList(),
    );
  }

  goToDetailedPage(BuildContext context, WuxiaNovel wuxiaNovel) {}
  circularProgress() {
    return const Center(
      child: CircularProgressIndicator(),
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
                  future: NetworkRequest.fetchWuxiaNovels(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return gridView(snapshot);
                    }
                    return circularProgress();
                  })),
            )
          ],
        ),
      ),
    );
  }
}
