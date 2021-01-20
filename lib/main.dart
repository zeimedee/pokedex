import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red[500],
    ),
    title: 'pokedex',
    home: Pokedex(),
  ));
}

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Pokedex',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.amber[200]),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Pokemon(),
            )));
  }
}

class Pokemon extends StatefulWidget {
  @override
  _Pokemon createState() => _Pokemon();
}

class _Pokemon extends State<Pokemon> {
  var pok1;
  var pok2;
  var pok3;

  Future getPokemon() async {
    http.Response response =
        await http.get('https://pokeapi.co/api/v2/pokemon');
    var results = jsonDecode(response.body);
    setState(() {
      this.pok1 = results['results'][3]['name'];
      this.pok2 = results['results'][6]['name'];
      this.pok3 = results['results'][0]['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(7.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Poke1()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red[300],
                ),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.height / 6,
                child: Center(
                  child: Text(pok1 != null ? pok1.toString() : "Loading"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Poke2()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[100],
                ),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.height / 6,
                child: Center(
                  child: Text(pok2 != null ? pok2.toString() : "Loading"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Poke3()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[100],
                ),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.height / 6,
                child: Center(
                  child: Text(pok3 != null ? pok3.toString() : "Loading"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Poke1 extends StatefulWidget {
  @override
  _Poke1 createState() => _Poke1();
}

class _Poke1 extends State<Poke1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charmander"),
      ),
      body: Column(
        children:<Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange[500],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png'),
              ],
            ),
          ),
          Expanded(
            child:Padding(
              padding:EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Text(
                    'Base Stats'
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text('Type'),
                    trailing: Text('Fire'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.heart),
                    title: Text('HP'),
                    trailing: Text('39'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.fire),
                    title: Text('Attack'),
                    trailing: Text('52'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.shieldAlt),
                    title: Text('Defence'),
                    trailing: Text('43'),
                  ),
                ],
              ),
              ),
            ),


        ],
      ),
    );
  }
}


class Poke2 extends StatefulWidget {
  @override
  _Poke2 createState() => _Poke2();
}

class _Poke2 extends State<Poke2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Squirtle"),
      ),
      body: Column(
        children:<Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png'),
              ],
            ),
          ),
          Expanded(
            child:Padding(
              padding:EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Text(
                    'Base Stats'
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text('Type'),
                    trailing: Text('Water'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.heart),
                    title: Text('HP'),
                    trailing: Text('44'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.fire),
                    title: Text('Attack'),
                    trailing: Text('48'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.shieldAlt),
                    title: Text('Defence'),
                    trailing: Text('65'),
                  ),
                ],
              ),
              ),
            ),

        ],
      ),
    );
  }
}


class Poke3 extends StatefulWidget {
  @override
  _Poke3 createState() => _Poke3();
}

class _Poke3 extends State<Poke3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bulbasaur"),
      ),
      body: Column(
        children:<Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.green[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'),
              ],
            ),
          ),
          Expanded(
            child:Padding(
              padding:EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Text(
                    'Base Stats'
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text('Type'),
                    trailing: Text('Grass-Poison'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.heart),
                    title: Text('HP'),
                    trailing: Text('45'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.fire),
                    title: Text('Attack'),
                    trailing: Text('49'),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.shieldAlt),
                    title: Text('Defence'),
                    trailing: Text('49'),
                  ),
                ],
              ),
              ),
            ),
          
        ],
      ),
    );
  }
}
