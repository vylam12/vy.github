class Foods {
  final String? imgUrl;
  final String? name;
  final String? desc;
  final int? weight;
  final double? price;
  final double? rate;
  final int? quantity;
  Foods({
    this.price,
    this.imgUrl,
    this.name,
    this.weight,
    this.desc,
    this.rate,
    this.quantity,
  });
}

List<Foods> foods = [
  Foods(
      imgUrl: 'assets/images/food_view1.png',
      name: 'Josi Dog Master Mix',
      desc:
          'Brighten up your pet\'s bowl with the colourful corn and beetroot kibble in JosiDog MasterMix! Crunchy and flavourful variety for adult dogs of all sizes, plus a wide range of important nutrients included. No added soya, sugar or milk products. Free from artificial colourings, flavourings and preservatives. Contains animal protein, vitamins & minerals.',
      weight: 900,
      rate: 4.5,
      price: 80,
      quantity: 100),
  Foods(
    imgUrl: 'assets/images/food_view2.png',
    name: 'Josera Mini Deluxe',
    desc:
        'Brighten up your pet\'s bowl with the colourful corn and beetroot kibble in JosiDog MasterMix! Crunchy and flavourful variety for adult dogs of all sizes, plus a wide range of important nutrients included. No added soya, sugar or milk products. Free from artificial colourings, flavourings and preservatives. Contains animal protein, vitamins & minerals.',
    weight: 500,
    rate: 4.5,
    price: 90,
    quantity: 90,
  ),
  Foods(
    imgUrl: 'assets/images/food_view5.png',
    name: 'Happy Dog - Profi Line High Energy 30-20',
    desc:
        'Brighten up your pet\'s bowl with the colourful corn and beetroot kibble in JosiDog MasterMix! Crunchy and flavourful variety for adult dogs of all sizes, plus a wide range of important nutrients included. No added soya, sugar or milk products. Free from artificial colourings, flavourings and preservatives. Contains animal protein, vitamins & minerals.',
    weight: 500,
    rate: 4.5,
    price: 90,
    quantity: 100,
  ),
  Foods(
    imgUrl: 'assets/images/food_view3.png',
    name: 'Pedigree Chicken & Vege',
    desc:
        'Brighten up your pet\'s bowl with the colourful corn and beetroot kibble in JosiDog MasterMix! Crunchy and flavourful variety for adult dogs of all sizes, plus a wide range of important nutrients included. No added soya, sugar or milk products. Free from artificial colourings, flavourings and preservatives. Contains animal protein, vitamins & minerals.',
    weight: 900,
    price: 56,
    quantity: 100,
    rate: 5.0,
  ),
  Foods(
    imgUrl: 'assets/images/food_view4.png',
    name: 'BlackHawk Puppy Lamb',
    desc:
        'Brighten up your pet\'s bowl with the colourful corn and beetroot kibble in JosiDog MasterMix! Crunchy and flavourful variety for adult dogs of all sizes, plus a wide range of important nutrients included. No added soya, sugar or milk products. Free from artificial colourings, flavourings and preservatives. Contains animal protein, vitamins & minerals.',
    weight: 1000,
    price: 253.000,
    rate: 4.5,
    quantity: 100,
  ),
];
