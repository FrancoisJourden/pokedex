import 'package:flutter/material.dart';

import 'package:pokemon/app/modules/pokemon/models/pokemon_model.dart';
import 'package:pokemon/app/modules/pokemon/models/pokemon_type_model.dart';
import 'package:pokemon/app/modules/type/models/type_color_model.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(pokemon.name)),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey),
                  child: Column(
                    children: [
                      Image(
                        image: NetworkImage(pokemon.sprite.frontDefault),
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          pokemon.description,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (PokemonType t in pokemon.types)
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: TypeColor.colors[t.name]?.primary,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          t.name.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: TypeColor.colors[t.name]?.secondary),
                        ),
                      ),
                    ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Abilities :",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  for (var ability in pokemon.abilities)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.blue),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  ability?.name ?? "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                ability?.description ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
