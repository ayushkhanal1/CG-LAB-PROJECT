import 'package:flutter/material.dart';
import 'package:tracker/expense.dart';

var kcolorscheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 125, 9, 249),
);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kcolorscheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorscheme.onPrimaryContainer,
          foregroundColor: kcolorscheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(31, 200, 76, 246),
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        ),
      ),
      home: const Expense(),
    ),
  );
}
