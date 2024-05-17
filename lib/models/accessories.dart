class Accessories {
  final String? imgUrl;
  final String? nameaccess;
  final double? price;
  Accessories({
    this.price,
    this.imgUrl,
    this.nameaccess,
  });
}

List<Accessories> accessoriesList = [
  Accessories(
    imgUrl: 'assets/images/ass1.jpg',
    nameaccess: 'Dog Collar',
    price: 1390.000,
  ),
  Accessories(
    imgUrl: 'assets/images/ass2.jpg',
    nameaccess: 'Warm fleece vest',
    price: 1780.000,
  ),
  Accessories(
    imgUrl: 'assets/images/ass3.jpg',
    nameaccess: 'Pet Nail Clipper',
    price: 900.000,
  ),
  Accessories(
    imgUrl: 'assets/images/ass4.jpg',
    nameaccess: 'Flea Comb',
    price: 285.000,
  ),
];
