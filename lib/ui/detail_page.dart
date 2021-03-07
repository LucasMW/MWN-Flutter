import 'package:flutter/material.dart';
import 'package:mwn_flutter/API/news_feed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class DetailPage extends StatefulWidget {
  final Item item;

  const DetailPage({Key key, this.item}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.item.id);
    return Scaffold(
      appBar: AppBar(title: Text("Detail ${widget.item.author.name}")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(child: Text(widget.item.title)),
              Image.network(widget.item.image),
              Container(child: Text(widget.item.description)),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        print("Go to page");
                        _launchURL(widget.item.id);
                      },
                      child: Text("go to web page")),
                  TextButton(
                      onPressed: () {
                        print("xxx");
                        Share.share('${widget.item.id}}',
                            subject:
                                'Check this ${widget.item.author.name} article!');
                      },
                      child: Text("Share"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
