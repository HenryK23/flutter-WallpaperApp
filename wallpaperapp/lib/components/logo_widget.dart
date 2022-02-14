import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 15),
        child: RichText(
          text: TextSpan(
            text: 'Wall',
            style: GoogleFonts.rubik(
                color: Theme.of(context).primaryColor, fontSize: 25),
            children: <TextSpan>[
              TextSpan(
                text: 'Paper',
                style: GoogleFonts.rubik(
                    color: Colors.amber, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
