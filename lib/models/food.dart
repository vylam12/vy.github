class Foods {
  final String? imgUrl;
  final String? namefood;
  final String? desc;
  final int? weight;
  final double? price;
  Foods({this.price, this.imgUrl, this.namefood, this.weight, this.desc});
}

List<Foods> foods = [
  Foods(
    imgUrl: 'assets/images/food1.jpg',
    desc: 'Josi Dog Master Mix',
    namefood: 'Josera',
    weight: 900,
    price: 80.000,
  ),
  Foods(
    imgUrl: 'assets/images/food2.jpg',
    desc: 'Happy Dog - Profi Line High Energy 30-20',
    namefood: 'Happy Pet',
    weight: 500,
    price: 90.000,
  ),
  Foods(
    imgUrl: 'assets/images/food3.jpg',
    desc: 'Pedigree Chicken & Vege',
    namefood: 'Pedigree',
    weight: 900,
    price: 564.000,
  ),
  Foods(
    imgUrl: 'assets/images/food4.jpg',
    desc: 'BlackHawk Puppy Lamb',
    namefood: 'BlackHawk',
    weight: 1000,
    price: 253.000,
  ),
];
