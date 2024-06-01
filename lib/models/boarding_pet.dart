class BoardingPet {
  final int? id;
  final String? imgUrl;
  final String? name;
  final String? desc;
  final String? time;
  final double? price;
  final double? rate;
  final double? distance;
  BoardingPet(
      {this.imgUrl,
      this.name,
      this.id,
      this.desc,
      this.time,
      this.price,
      this.rate,
      this.distance});
}

List<BoardingPet> boardingPetList = [
  BoardingPet(
      id: 1,
      imgUrl: 'assets/images/bd1.jpg',
      name: 'Tails of the city',
      rate: 4.5,
      price: 120,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      desc:
          'Pet boarding facilities, also known as pet hotels or pet resorts, are specialized establishments that provide temporary care and accommodation for companion animals like dogs and cats when their owners are away. These facilities are staffed by trained and experienced caretakers who are dedicated to ensuring the comfort, safety, and well-being of the pets in their charge.',
      distance: 2.5),
  BoardingPet(
      id: 2,
      imgUrl: 'assets/images/bd3.jpg',
      name: 'Cutie Paws',
      price: 120,
      desc:
          'Pet boarding facilities, also known as pet hotels or pet resorts, are specialized establishments that provide temporary care and accommodation for companion animals like dogs and cats when their owners are away. These facilities are staffed by trained and experienced caretakers who are dedicated to ensuring the comfort, safety, and well-being of the pets in their charge.',
      rate: 4.5,
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 2.5),
  BoardingPet(
      id: 3,
      price: 120,
      imgUrl: 'assets/images/bd2.jpg',
      name: 'Silver Paw Lodge',
      rate: 5,
      desc:
          'Pet boarding facilities, also known as pet hotels or pet resorts, are specialized establishments that provide temporary care and accommodation for companion animals like dogs and cats when their owners are away. These facilities are staffed by trained and experienced caretakers who are dedicated to ensuring the comfort, safety, and well-being of the pets in their charge',
      time: 'Monday - Friday at 8.00 am - 5.00pm',
      distance: 2.5),
];
