class Dealer {
  String name;
  int offers;
  String image;

  Dealer(this.name, this.offers, this.image);

  static List<Dealer> getDealerList() {
    return <Dealer>[
      Dealer(
        "Hertz",
        174,
        "assets/images/hertz.png",
      ),
      Dealer(
        "Avis",
        126,
        "assets/images/avis.png",
      ),
      Dealer(
        "Tesla",
        89,
        "assets/images/tesla.jpg",
      ),
    ];
  }
}
