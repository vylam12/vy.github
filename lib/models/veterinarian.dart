class Veterinarians {
  final String? imgUrl;
  final int? id;
  final String? name;
  final String? desc;
  final double? price;
  final String? time;
  final double? distance;
  final double? rate;
  Veterinarians(
      {this.imgUrl,
      this.name,
      this.desc,
      this.time,
      this.id,
      this.rate,
      this.price,
      this.distance});
}

List<Veterinarians> veterinariansList = [
  Veterinarians(
      id: 1,
      imgUrl: 'assets/images/ve1.jpg',
      name: 'Dr. Nambuvan',
      price: 100,
      rate: 4.5,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 2.5),
  Veterinarians(
      id: 2,
      imgUrl: 'assets/images/doctor.png',
      name: 'Dr. Nambuvan',
      rate: 5,
      price: 100,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 2),
  Veterinarians(
      id: 3,
      imgUrl: 'assets/images/doctor4.jpg',
      name: 'Dr. Sambuvan',
      rate: 5,
      price: 120,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 2.5),
];
