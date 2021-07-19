class Filter {
  String name;

  Filter(this.name);

  static List<Filter> getFilterList() {
    return <Filter>[
      Filter("Best Match"),
      Filter("Highest Price"),
      Filter("Lowest Price"),
    ];
  }
}
