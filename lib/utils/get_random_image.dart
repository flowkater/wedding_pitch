import 'dart:math';

String getRandomCoverImage() {
  final random = Random();
  final randomNumber = random.nextInt(3) + 1;
  return 'assets/images/cover/main-cover-0$randomNumber.jpg';
}

int getRandomNumber() {
  final random = Random();
  return random.nextInt(3) + 1;
}

String getCoverImage(int index) => 'assets/images/cover/main-cover-0$index.jpg';
