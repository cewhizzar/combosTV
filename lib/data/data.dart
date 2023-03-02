class Product {
  final String productName;
  final String productImageUrl;
  dynamic isLiked;

  Product({
    required this.productName,
    required this.productImageUrl,
    required this.isLiked,
  });
}

// list of products
List<Product> products = [
  Product(
    productName: "Premier League",
    productImageUrl:
        "https://a1.espncdn.com/combiner/i?img=%2Fi%2Fleaguelogos%2Fsoccer%2F500%2F23.png",
    isLiked: false,
  ),
  Product(
    productName: "La Liga",
    productImageUrl:
        "https://assets.laliga.com/assets/logos/laliga-v/laliga-v-600x600.png",
    isLiked: false,
  ),
  Product(
    productName: "Bundesliga",
    productImageUrl:
        "https://upload.wikimedia.org/wikipedia/en/thumb/d/df/Bundesliga_logo_%282017%29.svg/1200px-Bundesliga_logo_%282017%29.svg.png",
    isLiked: false,
  ),
  Product(
    productName: "Serie A",
    productImageUrl:
        "https://1.bp.blogspot.com/-YKz5TI53PIY/XNeD1q84RGI/AAAAAAABVEI/X_ZK8SKdjaoAX1i9w1-zV7x-LV-KvUgfgCLcBGAs/s1600/Serie%2BA%2BTim.png",
    isLiked: false,
  ),
  Product(
    productName: "Ligue 1",
    productImageUrl:
        "https://1.bp.blogspot.com/-4zeD0EcWQ7s/X2P0p8asYgI/AAAAAAABgJc/yV8RIBy7EEYATVKsOETuW0oY4HR_73_aQCLcBGAsYHQ/s16000/Ligue%2B1%2BUber%2BEats.png",
    isLiked: false,
  ),
  Product(
    productName: "Primeira Liga",
    productImageUrl:
        "https://a.espncdn.com/combiner/i?img=/i/leaguelogos/soccer/500/14.png",
    isLiked: false,
  ),
  Product(
    productName: "UEFA Champions League",
    productImageUrl:
        "https://b.fssta.com/uploads/application/soccer/competition-logos/UEFAChampionsLeague.png",
    isLiked: false,
  ),
  Product(
    productName: "Major League Soccer",
    productImageUrl:
        "https://3.bp.blogspot.com/-2tA6aHA9sYU/WSt4PWzAfVI/AAAAAAAAMZY/oraeVVHnS4cthhOg243jLWl36oBPZpeKACLcB/s1600/major-league-logo-primary.png",
    isLiked: false,
  ),
  Product(
    productName: "UEFA Europa League",
    productImageUrl:
        "https://a3.espncdn.com/combiner/i?img=%2Fi%2Fleaguelogos%2Fsoccer%2F500%2F2310.png",
    isLiked: false,
  ),
  Product(
    productName: "Copa Libertadores",
    productImageUrl:
        "https://www.thesportsdb.com/images/media/league/badge/mlo2451549460358.png",
    isLiked: false,
  ),
  Product(
    productName: "Brasileirao",
    productImageUrl:
        "https://static.wikia.nocookie.net/fifa/images/3/3b/Brasileir%C3%A3o_Serie_A.png/revision/latest?cb=20180331001747&path-prefix=es",
    isLiked: false,
  ),
  Product(
    productName: "Argentina Primera Division",
    productImageUrl:
        "https://a.espncdn.com/combiner/i?img=/i/leaguelogos/soccer/500/1.png",
    isLiked: false,
  ),
  Product(
    productName: "Chile Primera Division",
    productImageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/c/cd/Campeonato_Nacional_Petrobras.png",
    isLiked: false,
  ),
  Product(
    productName: "Liga MX",
    productImageUrl:
        "https://a.espncdn.com/combiner/i?img=%2Fi%2Fleaguelogos%2Fsoccer%2F500%2F22.png",
    isLiked: false,
  ),
  // Product(
  //   productName: "Liga de Expansion MX",
  //   productImageUrl: "https://upload.wikimedia.org/wikipedia/commons/9/93/Ascenso_MX_logo.png",
  //   isLiked: false,
  // ),
  Product(
    productName: "Liga BetPlay",
    productImageUrl:
        "https://1.bp.blogspot.com/-8VfFi4pKjmg/X2P5yVeuFsI/AAAAAAABgLw/Uu3G37wVuPcrFXiw4C82OqBKdElP59XigCLcBGAsYHQ/s0/Liga%2BBetPlay256x.png",
    isLiked: false,
  ),
  Product(
    productName: "Uruguay Primera Division",
    productImageUrl:
        "https://a.espncdn.com/combiner/i?img=/i/leaguelogos/soccer/500/1592.png",
    isLiked: false,
  ),
  Product(
    productName: "Paraguay Primera Division",
    productImageUrl:
        "https://4.bp.blogspot.com/-6BQv5SOuxn4/XEs537Yz01I/AAAAAAABT-c/aol0uy0p_l8gSbrYVLhz4qu5-GpyGG3lQCLcBGAs/s1600/Copa%2Bde%2BPrimera.png",
    isLiked: false,
  ),
  Product(
    productName: "Eredivisie",
    productImageUrl:
        "https://a.espncdn.com/combiner/i?img=/i/leaguelogos/soccer/500/11.png",
    isLiked: false,
  ),
  Product(
    productName: "Jupiler Pro League",
    productImageUrl:
        "https://upload.wikimedia.org/wikipedia/pt/2/2e/Jpl-lang-logo.png",
    isLiked: false,
  ),
  Product(
    productName: "Ligue 2",
    productImageUrl:
        "https://www.thesportsdb.com/images/media/league/badge/32bol01592927502.png",
    isLiked: false,
  ),
  Product(
    productName: "Copa de Francia",
    productImageUrl:
        "https://a.espncdn.com/combiner/i?img=%2Fi%2Fleaguelogos%2Fsoccer%2F500%2F182.png",
    isLiked: false,
  ),
  Product(
    productName: "2. Bundesliga",
    productImageUrl:
        "https://upload.wikimedia.org/wikipedia/en/thumb/7/7b/2._Bundesliga_logo.svg/1200px-2._Bundesliga_logo.svg.png",
    isLiked: false,
  ),

  Product(
    productName: "DFB Pokal",
    productImageUrl:
        "https://a1.espncdn.com/combiner/i?img=%2Fi%2Fleaguelogos%2Fsoccer%2F500%2F2061.png",
    isLiked: false,
  ),
  Product(
    productName: "FA Cup",
    productImageUrl:
        "https://images.fotmob.com/image_resources/logo/leaguelogo/132.png",
    isLiked: false,
  ),
  Product(
    productName: "Mundial de Clubes",
    productImageUrl:
        "https://i.pinimg.com/originals/41/60/e9/4160e9e356f7ee2746a29a0fbaf92e87.png",
    isLiked: false,
  ),

  // Product(
  //   productName: "Copa Ciudadana Ecuador",
  //   productImageUrl:
  //       "https://a1.espncdn.com/combiner/i?img=%2Fi%2Fleaguelogos%2Fsoccer%2F500%2F2061.png",
  //   isLiked: false,
  // ),
  Product(
    productName: "UEFA Super Cup",
    productImageUrl:
        "https://images.sports.gracenote.com/images/lib/basic/sport/football/competition/logo/300/44.png",
    isLiked: false,
  ),
  Product(
    productName: "Copa de portugal",
    productImageUrl:
        "https://cdn.footystats.org/img/competitions/portugal-taca-de-portugal.png",
    isLiked: false,
  ),
  // Product(
  //   productName: "CONCACAF Champions League",
  //   productImageUrl:
  //       "https://images.mlssoccer.com/image/upload/t_keep-aspect-ratio-e-mobile/f_png/v1625198358/assets/competitions/concacaf-champions-league/ccl-logo-2021-v1.png",
  //   isLiked: false,
  // ),
  Product(
    productName: "AFC Champions League",
    productImageUrl:
        "https://static.wikia.nocookie.net/proevolutionsoccer/images/a/a9/AFC_Champions_League.png/revision/latest?cb=20151223182015&path-prefix=es",
    isLiked: false,
  ),
  Product(
    productName: "FA Cup",
    productImageUrl:
        "https://images.fotmob.com/image_resources/logo/leaguelogo/132.png",
    isLiked: false,
  ),
  Product(
    productName: "NBA",
    productImageUrl:
        "https://www.freepnglogos.com/uploads/nba-logo-png/nba-all-star-game-full-team-lebron-team-giannis-18.png",
    isLiked: false,
  ),
  Product(
    productName: "NFL",
    productImageUrl:
        "https://loodibee.com/wp-content/uploads/nfl-league-logo.png",
    isLiked: false,
  ),
];
