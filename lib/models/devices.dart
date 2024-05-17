class Devices {
  final String? imgUrl;
  final String? namedv;
  final double? price;
  Devices({
    this.price,
    this.imgUrl,
    this.namedv,
  });
}

List<Devices> accessories = [
  Devices(
    imgUrl: 'assets/images/dv1.jpg',
    namedv: 'GPS Pet Tracker',
    price: 10580.000,
  ),
  Devices(
    imgUrl: 'assets/images/dv2.jpg',
    namedv: 'Petcube Pet Camera',
    price: 15965.000,
  ),
  Devices(
    imgUrl: 'assets/images/dv3.jpg',
    namedv: 'Fi  Smart Collar',
    price: 9200.000,
  ),
  Devices(
    imgUrl: 'assets/images/dv4.jpg',
    namedv: 'Automatic Pet Feeder',
    price: 24489.000,
  ),
];
