import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pokemon/app/screens/pokemon/list/pokemon_card.dart';

class PokemonListScreen extends StatelessWidget {
  PokemonListScreen({Key? key, this.page = 1, this.nb = 20}) : super(key: key);
  final int page;
  final int nb;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
        future: http.get(Uri.parse(
            'https://pokeapi.co/api/v2/pokemon/?offset=${(page - 1) * nb}&limit=$nb')),
        builder: (context, AsyncSnapshot<Response> snapshot) {
          if (snapshot.data == null) {
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(title: const Text("Liste pokemons")),
                body: const CircularProgressIndicator(),
              ),
            );
          }
          Map<String, dynamic> res = jsonDecode(snapshot.data?.body ?? "");
          return MaterialApp(
              home: Scaffold(
            appBar: AppBar(title: const Text("Liste pokemons")),
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Column(
                    children: [
                      for (var element in res['results'])
                        PokemonCard(
                          url: element['url'],
                          name: element['name'],
                        ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        Text("Page $page sur ${(res['count'] / nb).round()}"),
                  )
                ]))
                // GridView.count(
                //         primary: false,
                //         padding: const EdgeInsets.all(20),
                //         crossAxisSpacing: 10,
                //         mainAxisSpacing: 10,
                //         shrinkWrap: true,
                //         crossAxisCount: pokemon.abilities.length,
                //         children: [
                //           for (var ability in pokemon.abilities)
                //             Container(
                //               padding: const EdgeInsets.all(8),
                //               color: Colors.blue,
                //               child: Text(ability?.name ?? ""),
                //             ),
                //         ],
                //       ),
                ),
          ),
            builder:
            EasyLoading.init(),
          );
        });
  }
}
