import 'package:flutter/material.dart';

String tabsBackground =   "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg";

BoxDecoration tabsBackgroundDecoration = const BoxDecoration(
          image: DecorationImage(opacity: 0.6,
            image: AssetImage('assets/images/background.jpg', ),
            fit: BoxFit.cover, // Adjust fit as needed (cover, contain, fill, etc.)
          ),
        );