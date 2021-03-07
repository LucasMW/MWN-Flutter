import 'package:flutter/material.dart';
import 'package:mwn_flutter/API/api.dart';
import 'package:mwn_flutter/API/news_feed.dart';
import 'package:mwn_flutter/ui/detail_page.dart';

class NewsTile extends StatelessWidget {
  final Item item;

  const NewsTile({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.description),
      onTap: () {
        print("tap $item");
        final route = MaterialPageRoute(builder: (ctx) {
          return DetailPage(item: item);
        });
        Navigator.push(context, route);
      },
    );
  }
}

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Item> items = [];

  @override
  void initState() {
    final api = API();
    api.getNewsFeed().then((value) {
      setState(() {
        items = value.items;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Minimal World News")),
        body: SafeArea(
          child: items.length > 0
              ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return NewsTile(
                      item: items[index],
                    );
                  })
              : Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.transparent,
                      child: CircularProgressIndicator())),
        ));
  }
}
