class NewsFeed {
  String version;
  String title;
  String homePageUrl;
  String feedUrl;
  String description;
  String icon;
  Author author;
  List<Item> items;

  NewsFeed(
      {this.version,
      this.title,
      this.homePageUrl,
      this.feedUrl,
      this.description,
      this.icon,
      this.author,
      this.items});

  NewsFeed.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    title = json['title'];
    homePageUrl = json['home_page_url'];
    feedUrl = json['feed_url'];
    description = json['description'];
    icon = json['icon'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['title'] = this.title;
    data['home_page_url'] = this.homePageUrl;
    data['feed_url'] = this.feedUrl;
    data['description'] = this.description;
    data['icon'] = this.icon;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  String name;
  String url;

  Author({this.name, this.url});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Item {
  String id;
  String url;
  String title;
  String description;
  String image;
  String datePublished;
  String dateModified;
  Author author;

  Item(
      {this.id,
      this.url,
      this.title,
      this.description,
      this.image,
      this.datePublished,
      this.dateModified,
      this.author});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    datePublished = json['date_published'];
    dateModified = json['date_modified'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['date_published'] = this.datePublished;
    data['date_modified'] = this.dateModified;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    return data;
  }
}
