class Product {
  String title;
  String image;

  Product(this.title, this.image);
}

class TrendingModel {
  String title;
  List<Product> items;

  TrendingModel(this.title, this.items);
}

List<TrendingModel> trending = [
  new TrendingModel("Popular Trending Tec", [
    new Product("Play Station",
        "https://www.howtogeek.com/wp-content/uploads/2016/01/steam-and-xbox-controllers.jpg"),
    new Product("XBox",
        "https://www.howtogeek.com/wp-content/uploads/2016/01/steam-and-xbox-controllers.jpg"),
    new Product("Electronics",
        "http://images4.fanpop.com/image/photos/21600000/Electronics-hd-wallpaper-21627626-1920-1200.jpg"),
  ]),
  new TrendingModel("Popular Trending Travel", [
    new Product("Moscu",
        "https://cms.hostelworld.com/hwblog/wp-content/uploads/sites/2/2017/08/girlgoneabroad-1170x805.jpg"),
    new Product("Varadero", "http://www.aphamok.com/images/travel.jpg"),
    new Product("Cancun",
        "https://thenationalwealthcenterreview.com/wp-content/uploads/2015/06/travel.jpg"),
  ]),
];
