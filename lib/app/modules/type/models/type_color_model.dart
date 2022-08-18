import 'package:flutter/material.dart';

class TypeColor{
  Color primary;
  Color secondary;

  TypeColor(this.primary, this.secondary);


  static final Map<String, TypeColor> colors = {
    "normal" : TypeColor(Colors.grey, Colors.white),
    "fighting" : TypeColor(Colors.red, Colors.white),
    "flying" : TypeColor(Colors.blueGrey, Colors.white),
    "poison" : TypeColor(Colors.deepPurpleAccent, Colors.white),
    "ground" : TypeColor(Colors.brown, Colors.white),
    "rock" : TypeColor(Colors.grey, Colors.white),
    "bug" : TypeColor(Colors.lightGreen, Colors.white),
    "ghost" : TypeColor(Colors.indigo, Colors.white),
    "steel" : TypeColor(Colors.grey, Colors.white),
    "fire" : TypeColor(Colors.deepOrange, Colors.white),
    "water" : TypeColor(Colors.blueAccent, Colors.white),
    "grass" : TypeColor(Colors.green, Colors.white),
    "electric" : TypeColor(Colors.yellow, Colors.black),
    "psychic" : TypeColor(Colors.redAccent, Colors.white),
    "ice" : TypeColor(Colors.lightBlueAccent, Colors.white),
    "dragon" : TypeColor(Colors.blueAccent, Colors.white),
    "dark" : TypeColor(Colors.black, Colors.white),
    "fairy" : TypeColor(Colors.pinkAccent, Colors.white),
  };
}