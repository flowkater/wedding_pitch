import 'dart:math';

String getRandomCoverImage() {
  final random = Random();
  final randomNumber = random.nextInt(3) + 1;
  return 'assets/images/cover/main-cover-0$randomNumber.jpg';
}
