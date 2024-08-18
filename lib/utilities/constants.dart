import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldStryle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(Icons.location_city_rounded),
    hintText: "Entrer le nom de la ville",
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none
    )
);