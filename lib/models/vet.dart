class Vet {
  final String? imgUrl;
  final String? namevet;
  final double? price;
  Vet({
    this.price,
    this.imgUrl,
    this.namevet,
  });
}

List<Vet> vet = [
  Vet(
    imgUrl: 'assets/images/vet1.jpg',
    namevet: 'Wet Dog - Flea',
    price: 700.000,
  ),
  Vet(
    imgUrl: 'assets/images/vet2.jpg',
    namevet: 'Orondo Spray',
    price: 2800.000,
  ),
  Vet(
    imgUrl: 'assets/images/vet3.jpg',
    namevet: 'Nexgard - Afoxolaner',
    price: 3480.000,
  ),
  Vet(
    imgUrl: 'assets/images/vet4.jpg',
    namevet: 'Petro Mange Cream',
    price: 650.000,
  ),
];
