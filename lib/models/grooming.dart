class Grooming {
  final int? id;
  final String? imgUrl;
  final String? name;
  final String? desc;
  final double? price;
  final String? time;
  final double? rate;
  final double? distance;
  Grooming(
      {this.imgUrl,
      this.name,
      this.id,
      this.desc,
      this.time,
      this.price,
      this.rate,
      this.distance});
}

List<Grooming> groomingList = [
  Grooming(
      id: 1,
      imgUrl: 'assets/images/gr3.jpg',
      name: 'Comb and Collar',
      rate: 4.5,
      price: 120,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 2.5),
  Grooming(
    id: 2,
    imgUrl: 'assets/images/gr2.jpg',
    name: 'Cosmo Dog Cares',
    rate: 5,
    price: 120,
    time: 'Monday - Friday at 8.00 am - 5.00pm',
    distance: 2.5,
  ),
  Grooming(
    id: 3,
    imgUrl: 'assets/images/gr1.jpg',
    name: 'Dirty Paws Dog Spa',
    price: 120,
    rate: 5,
    time: 'Monday - Friday at 8.00 am - 5.00pm',
    distance: 2,
  ),
  Grooming(
      id: 4,
      imgUrl: 'assets/images/gr4.jpg',
      name: 'Golden Bone',
      rate: 5,
      price: 100,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 3.5),
];
