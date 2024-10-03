import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompteView extends StatelessWidget {
  const CompteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compte", style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),),
        centerTitle: true,
      ),
    );
  }
}