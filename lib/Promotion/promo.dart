import 'package:benda/Promotion/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          buildCardRow(),
          SizedBox(
            height: 30,
          ),
          buildLoyaltyProgramSection(),
          SizedBox(
            height: 20,
          ),
          buildPromotionSection(),
        ],
      ),
    );
  }
}

Widget buildCardRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      CustomCardPromo(
          cardTitle: "Kids",
          cardSubtitle: "Enroll your kids",
          subtitleColor: Colors.green,
          onPressed: () => {}),
      CustomCardPromo(
          cardTitle: "Subscriptions",
          cardSubtitle: "Active Now",
          subtitleColor: Colors.orange,
          onPressed: () => {}),
      CustomCardPromo(
          cardTitle: "Milestones",
          cardSubtitle: "In Progress",
          subtitleColor: Colors.blue,
          onPressed: () => {}),
    ],
  );
}

Widget buildLoyaltyProgramSection() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 25,
          ),
          Text(
            "Join the loyalty program!",
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      // TODO: Image instead of colors
      LoyaltyCard(color: Colors.redAccent, onPressed: () => {}),
    ],
  );
}

Widget buildPromotionSection() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 25,
          ),
          Text(
            "Unlock these promos",
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
      SizedBox(height: 15,),
      Container(
        height: 150,
        child: ListView(
          // TODO: Make it a dynamic ListView
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            // TODO: Images instead of colors
            PromoCard(color: Colors.orange, onPressed: () => {}),
            PromoCard(color: Colors.yellow, onPressed: () => {}),
            PromoCard(color: Colors.greenAccent, onPressed: () => {}),
          ],
        ),
      ),
    ],
  );
}
