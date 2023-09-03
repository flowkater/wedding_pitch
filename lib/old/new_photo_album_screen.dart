import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:wedding_pitch/old/layout.dart';

class NewPhotoAlbumScreen extends StatefulWidget {
  const NewPhotoAlbumScreen({super.key});

  @override
  State<NewPhotoAlbumScreen> createState() => _NewPhotoAlbumScreenState();
}

class _NewPhotoAlbumScreenState extends State<NewPhotoAlbumScreen> {
  final List<Card> cards = [];
  final List<Card> topCards = [];

  Color getRandomColor() => Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );

  @override
  void initState() {
    for (var i = 0; i < 10; i++) {
      final color = getRandomColor();
      cards.add(Card(color: color, tag: "${i.toString()}i"));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      horizontalPadding: 0.0,
      body: Column(
        children: [
          const Text("New Photo Album"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...topCards.map(
                  (card) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TopCard(
                      key: ValueKey(card),
                      card: card,
                      onTap: () {
                        setState(() {
                          cards.add(card);
                          topCards.remove(card);
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                ...cards.map(
                  (card) => PhotoCard(
                    key: ValueKey(card),
                    card: card,
                    onTap: () {
                      setState(() {
                        topCards.add(card);
                        cards.remove(card);
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  final Card card;
  final VoidCallback onTap;

  const TopCard({
    required this.card,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocalHero(
      tag: card.tag,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 50,
          height: 50,
          color: card.color,
        ),
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final Card card;
  final VoidCallback onTap;

  const PhotoCard({
    required this.card,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocalHero(
      tag: card.tag,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Container(
            color: card.color,
          ),
        ),
      ),
    );
  }
}

class Card {
  final Color color;
  final String tag;

  Card({
    required this.color,
    required this.tag,
  });
}
