final List<Map<String, dynamic>> allPlayers = [
  {'name': 'Lionel Messi', 'country': 'Argentina'},
  {'name': 'Cristiano Ronaldo', 'country': 'Portugal'},
  {'name': 'Neymar Jr', 'country': 'Brazil'},
  {'name': 'Kylian Mbappé', 'country': 'France'},
  {'name': 'Kevin De Bruyne', 'country': 'Belgium'},
  {'name': 'Mohamed Salah', 'country': 'Egypt'},
  {'name': 'Virgil van Dijk', 'country': 'Netherlands'},
  {'name': 'Luka Modrić', 'country': 'Croatia'},
  {'name': 'Erling Haaland', 'country': 'Norway'},
  {'name': 'Robert Lewandowski', 'country': 'Poland'},
  {'name': 'Harry Kane', 'country': 'England'},
  {'name': 'Sadio Mané', 'country': 'Senegal'},
  {'name': 'Son Heung-min', 'country': 'South Korea'},
  {'name': 'Karim Benzema', 'country': 'France'},
  {'name': 'Antoine Griezmann', 'country': 'France'},
  {'name': 'Paulo Dybala', 'country': 'Argentina'},
  {'name': 'Bruno Fernandes', 'country': 'Portugal'},
  {'name': 'Joshua Kimmich', 'country': 'Germany'},
  {'name': 'Jude Bellingham', 'country': 'England'},
  {'name': 'Pedri', 'country': 'Spain'},
  {'name': 'Frenkie de Jong', 'country': 'Netherlands'},
  {'name': 'Thibaut Courtois', 'country': 'Belgium'},
  {'name': 'Jan Oblak', 'country': 'Slovenia'},
  {'name': 'Ederson Moraes', 'country': 'Brazil'},
  {'name': 'Alisson Becker', 'country': 'Brazil'},
  {'name': 'Achraf Hakimi', 'country': 'Morocco'},
  {'name': 'Riyad Mahrez', 'country': 'Algeria'},
  {'name': 'Trent Alexander-Arnold', 'country': 'England'},
  {'name': 'Vinícius Júnior', 'country': 'Brazil'},
  {'name': 'Phil Foden', 'country': 'England'},
];

class PlayerState {}

final class PlayerInitialState extends PlayerState {
  final List<Map<String, dynamic>> players;
  PlayerInitialState(this.players);
}

final class PlayerFilteredState extends PlayerState {
  final List<Map<String, dynamic>> filteredPlayers;
  PlayerFilteredState(this.filteredPlayers);
}
