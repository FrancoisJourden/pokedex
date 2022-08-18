import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pokemon/app/screens/pokemon/list/pokemon_card.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({Key? key, this.page = 1, this.nb = 20}) : super(key: key);
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
                body: const Center(
                  child: CircularProgressIndicator()
                ),
              ),
            );
          }
          Map<String, dynamic> res = jsonDecode(snapshot.data?.body ?? "");
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: const Text("Liste pokemons")),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          for (var element in res['results'])
                            PokemonCard(
                              url: element['url'],
                              name: element['name'],
                            ),
                        ],
                      ),
                      ButtonBar(
                        children: [
                          if(page>1) TextButton(onPressed: () => runApp(PokemonListScreen(page:page-1)), child: const Text('Previous')),
                          if(jsonDecode(snapshot.data?.body??"")['next']!=null)TextButton(onPressed: () => runApp(PokemonListScreen(page:page+1)), child: const Text('Next'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            builder: EasyLoading.init(),
          );
        });
  }
}
