import 'package:flutter/material.dart';

import 'package:pokemon/app/modules/pokemon/models/pokemon_model.dart';
import 'package:pokemon/app/modules/pokemon/models/pokemon_type_model.dart';

class PokemonScreen extends StatelessWidget {
  PokemonScreen({Key? key, required this.pokemon})
      : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Description ${pokemon.name}")),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Column(children: [
                  Image.network(pokemon.sprite.frontDefault, height: 150, fit: BoxFit.cover,),
                  Text("Id: ${pokemon.id}"),
                  Text("Nom: ${pokemon.name}"),
                  Row(children: [
                    for(PokemonType t in pokemon.types) Text("${t.name} ")
                  ],)
                ]),
              ),
              GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                crossAxisCount: pokemon.abilities.length,
                children: [
                  for (var ability in pokemon.abilities)
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue,
                      child: Text(ability?.name ?? ""),
                    ),
                ],
              ),
            ],
          )),
    ));
  }
}
