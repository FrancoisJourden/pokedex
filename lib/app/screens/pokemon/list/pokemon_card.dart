import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pokemon/app/modules/pokemon/models/pokemon_model.dart';
import 'package:pokemon/app/screens/pokemon/list/pokemon_list_screen.dart';
import 'package:pokemon/app/screens/pokemon/pokemon_screen.dart';
import 'package:http/http.dart' as http;

class PokemonCard extends StatelessWidget {
  PokemonCard({required this.name, required this.url});

  String name;
  String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: InkWell(
          onTap: () async {
            EasyLoading.show();
            var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$name');
            http.Response response = await http.get(url);
            Pokemon pokemon = await Pokemon.fromJson(jsonDecode(response.body));
            EasyLoading.dismiss();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PokemonScreen(
                pokemon: pokemon,
              ))
            );
          },
          child: Container(
            width: double.infinity,
            color: Colors.blue,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                )),
          ),
        ));
  }
}
