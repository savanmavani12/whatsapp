class Global {
   final String title;
  final String subtitle;

  Global({required this.title, required this.subtitle});

  factory Global.fromMap({required Map<String, String> data}) {
    return Global(
        title: data['title']!,
        subtitle: data['subtitle']!);
  }

  static List<dynamic> allContact = [
    {
      'title': "savan",
      'subtitle': "xcvghujmnbvcxfgh",
    },
    {
      'title': "dhruvil",
      'subtitle': "cvbnmkjuytgfdo",
    },
    {
      'title': "man",
      'subtitle': "zsdertyuhgfc",
    },
    {
      'title': "sudhir",
      'subtitle': "asertyuikmnbvcx",
    },
    {
      'title':"nilesh",
      'subtitle': "tgyujikijmnbvcxdfr ",
    },
    {
      'title':
      "jony",
      'subtitle': "sertyui",
    },
    {
      'title': "tapudo",
      'subtitle': "azx vbnjytred",
    },
    {
      'title': "goli",
      'subtitle': "jklioiujyhtgrfeds",
    },
    {
      'title': "chirag",
      'subtitle': "zaswe34retgytu",
    },
    {
      'title': "kano",
      'subtitle': "cvbngjhkujyht",
    },
    {
      'title': "dhamo",
      'subtitle': "xsdfrgch",
    },
    {
      'title': "paras",
      'subtitle': "cvfjukykyjtr",
    },
    {
      'title':"sendy",
      'subtitle': "iuyhjtgrf",
    },
    {
      'title':
      "haresh",
      'subtitle': "xcdvfghjyyuk",
    },
    {
      'title': "kalu",
      'subtitle': "hiutrfd",
    },
    {
      'title': "jigar",
      'subtitle': "dfgght",
    },
  ];

}