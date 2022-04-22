import 'package:flutter/material.dart';
import 'package:wux_read/models/wuxia_novel_model.dart';

class WuxiaNovelWidget extends StatelessWidget {
  @required
  final WuxiaNovel wuxiaNovel;
  const WuxiaNovelWidget(this.wuxiaNovel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.message),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(child: Text("Title", style: Theme.of(context).textTheme.headline4)),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed"
                        " do eiusmod tempor incididunt ut labore et dolore magna "
                        "aliqua. Ut enim ad minim veniam, quis nostrud "
                        "exercitation ullamco laboris nisi ut aliquip ex ea "
                        "commodo consequat."
                        ,
                )
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
