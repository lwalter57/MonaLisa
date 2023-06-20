import 'package:flutter/material.dart';

void main() {
  runApp(const MuseumApp());
}

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Artwork(),
    );
  }
}

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  State<Artwork> createState() => _Artwork();
}

class _Artwork extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  Widget displayIconHeart() {
    if (!_isFavorite) {
      return const Opacity(
        opacity: 0.20,
        child: Icon(
          Icons.favorite,
          size: 100,
          color: Colors.white,
        ),
      );
    } else {
      return const Icon(Icons.favorite,
          size: 100, color: Color.fromARGB(255, 180, 83, 83));
    }
  }

  Container displayArticle() {
    String text = "";
    int opacity = 0;

    if (_showDescription) {
      text =
          """La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.""";
      opacity = 95;
    }
    return Container(
      color: Color.fromARGB(opacity, 0, 0, 0),
      height: 350,
      width: 350,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            text,
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }

  void toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    if (_isFavorite) {
      const snackBar = SnackBar(
        backgroundColor: Color.fromARGB(255, 56, 56, 56),
        content: Text(
          'Oeuvre ajouté aux favoris',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void toggleArticle() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Museum DeVinci"),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/Mona_Lisa.jpg'),
                  displayIconHeart(),
                  displayArticle(),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: const [
                  Text(
                    'Mona Lisa',
                    style: TextStyle(fontFamily: 'Merriweather', fontSize: 30),
                  ),
                  Text(
                    'Leonnard Devinci',
                    style: TextStyle(fontFamily: 'Merriweather', fontSize: 15),
                  )
                ],
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () => toggleFavorite(),
                  ),
                  IconButton(
                    icon: Icon(Icons.article),
                    onPressed: () => toggleArticle(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
