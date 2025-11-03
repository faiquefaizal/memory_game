import 'dart:developer';

List<String> list = [
  "asset/apple.png",
  "asset/banana.png",
  "asset/black_berry.png",
  "asset/guava.png",
  "asset/lemon.png",
  "asset/orange.png",
  "asset/strawberry.png",
  "asset/watermelon.png",
];
List<String> cardList = [...list, ...list];
List<String> generateList() {
  log(cardList.toString());
  return cardList..shuffle();
}
