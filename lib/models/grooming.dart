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
      desc:
          'The core of the Comb and Collar collection is a range of meticulously constructed dress shirts, suits, and accessories. The shirts, available in a variety of classic and seasonal colors, feature superior construction with features like reinforced collars and cuffs, custom-developed fabrics, and ergonomic tailoring for a perfect fit.',
      distance: 2.5),
  Grooming(
    id: 2,
    imgUrl: 'assets/images/gr2.jpg',
    name: 'Cosmo Dog Cares',
    rate: 5,
    desc:
        'Cosmo Dog Cares is a mission-driven pet care brand that is dedicated to promoting the health, happiness, and wellbeing of dogs. Launched in 2021, the brand\'s core philosophy is to provide high-quality products and services that prioritize the needs of our canine companions.',
    price: 120,
    time: 'Monday - Friday at 8.00 am - 5.00pm',
    distance: 2.5,
  ),
  Grooming(
    id: 3,
    imgUrl: 'assets/images/gr1.jpg',
    name: 'Dirty Paws Dog Spa',
    price: 120,
    desc:
        'Dirty Paws Dog Spa is a premium pet grooming and wellness destination that caters to the unique needs of discerning dog owners. Established in 2020, the spa has quickly gained a reputation for its exceptional customer service, state-of-the-art facilities, and a holistic approach to canine care.',
    rate: 5,
    time: 'Monday - Friday at 8.00 am - 5.00pm',
    distance: 2,
  ),
  Grooming(
      id: 4,
      imgUrl: 'assets/images/gr4.jpg',
      name: 'Golden Bone',
      rate: 5,
      desc:
          'At the core of the Golden Bone brand is a deep understanding of the unique needs and preferences of modern pet owners. The product lineup includes a diverse range of premium pet food, treats, toys, and accessories, all of which are formulated and designed with the well-being of the animals in mind.',
      price: 100,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 3.5),
];
