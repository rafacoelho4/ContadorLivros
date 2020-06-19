import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Contador de Livros', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _books = 0;

  String _infoText = "Pegue mais livros!";

  void _changeBooks(int delta) {
    setState(() {
      _books += delta;

      if (_books < 0) {
        _infoText = "¿Mundo invertido?";
      } else if (_books >= 7) {
        _infoText = "Você chegou ao máximo";
      } else {
        _infoText = "Pegue mais livros!";
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Biblioteca'),
          backgroundColor: Colors.orange[900],
        ),
        body: Stack(
          children: <Widget>[
            Image.network(
              "https://image.freepik.com/free-vector/library-interior-empty-room-reading-with-books-wooden-shelves_33099-1722.jpg",
              fit: BoxFit.cover,
              height: 1000.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Livros: $_books',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.exposure_plus_1),
                      color: Colors.white,
                      iconSize: 35.0,
                      onPressed: () {
                        _changeBooks(1);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.exposure_neg_1),
                      color: Colors.white,
                      iconSize: 35.0,
                      onPressed: () {
                        _changeBooks(-1);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '$_infoText',
                  style: TextStyle(fontSize: 24.0, color: Colors.grey[200] ),
                )
              ],
            )
          ],
        ));
  }
}