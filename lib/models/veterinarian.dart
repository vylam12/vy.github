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
      desc:
          'Pet hospitals, also known as veterinary clinics or animal hospitals, are specialized healthcare facilities that provide comprehensive medical services for companion animals such as dogs, cats, and other pets. These establishments are staffed by licensed veterinarians, veterinary technicians, and other support personnel who are dedicated to the well-being and treatment of animals.',
      distance: 2.5),
  Veterinarians(
      id: 2,
      imgUrl: 'assets/images/doctor.png',
      name: 'Dr. Nambuvan',
      rate: 5,
      price: 100,
      desc:
          'Pet hospitals, also known as veterinary clinics or animal hospitals, are specialized healthcare facilities that provide comprehensive medical services for companion animals such as dogs, cats, and other pets. These establishments are staffed by licensed veterinarians, veterinary technicians, and other support personnel who are dedicated to the well-being and treatment of animals.',
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 2),
  Veterinarians(
      id: 3,
      imgUrl: 'assets/images/doctor4.jpg',
      name: 'Dr. Sambuvan',
      rate: 5,
      desc:
          'Pet hospitals, also known as veterinary clinics or animal hospitals, are specialized healthcare facilities that provide comprehensive medical services for companion animals such as dogs, cats, and other pets. These establishments are staffed by licensed veterinarians, veterinary technicians, and other support personnel who are dedicated to the well-being and treatment of animals.',
      price: 120,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 2.5),
];
