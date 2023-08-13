import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wedding_pitch/layout/layout.dart';

class PhotoAlbumScreen extends StatefulWidget {
  const PhotoAlbumScreen({super.key});

  @override
  State<PhotoAlbumScreen> createState() => _PhotoAlbumScreenState();
}

class _PhotoAlbumScreenState extends State<PhotoAlbumScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 0.7,
  );
  late final List<Card> cards;
  final List<Card> topCards = [];
  int currentPage = 0;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  OverlayEntry _overlayPhotoCard(Card card) {
    return OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        width: 600,
        child: CompositedTransformFollower(
          link: _layerLink,
          child: Material(
            color: card.color,
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.7),
          ),
        ),
      ),
    );
  }

  // 드롭다운 생성.
  void _createOverlay(Card card) {
    if (_overlayEntry == null) {
      _overlayEntry = _overlayPhotoCard(card);
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  // 드롭다운 해제.
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Color getRandomColor() => Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );

  @override
  void initState() {
    cards = List.generate(20, (index) {
      final color = getRandomColor();
      return Card(color: color, tag: "${index.toString()}i");
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void handlePageChanged(int newIndex) {
    if (newIndex > currentPage) {
      final beforeCard = cards[newIndex - 1];
      if (newIndex != 0) {
        setState(() {
          // cards.remove(beforeCard);
          // _removeOverlay();
          // _createOverlay(beforeCard);
          topCards.add(beforeCard);
        });
      }
    } else {
      // final beforeCard = topCards.last;
      setState(() {
        topCards.removeLast();
      });
    }
    setState(() {
      currentPage = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      horizontalPadding: 0,
      body: Column(
        children: [
          const Text('Photo Album'),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topCards.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (_pageController.hasClients && index < topCards.length) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    color: topCards[index].color,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: CompositedTransformTarget(
              link: _layerLink,
              child: PageView.builder(
                onPageChanged: (value) => handlePageChanged(value),
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (_pageController.hasClients &&
                        index != cards.length - 1) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: PhotoCard(
                    key: ValueKey(cards[index]),
                    card: cards[index],
                  ),
                ),
                itemCount: cards.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final Card card;

  const PhotoCard({required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        color: card.color,
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
