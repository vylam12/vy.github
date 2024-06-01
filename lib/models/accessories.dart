class Accessories {
  final String? imgUrl;
  final String? name;
  final double? price;
  final String? desc;
  final int? quantity;
  final double? rate;
  Accessories({
    this.price,
    this.imgUrl,
    this.name,
    this.rate,
    this.desc,
    this.quantity,
  });
}

List<Accessories> accessoriesList = [
  Accessories(
    imgUrl: 'assets/images/accessories1.jpg',
    name: 'Dog Collar',
    rate: 4.5,
    price: 59,
    desc:
        'Keep your furry friend looking their best with our high-quality dog collar. Crafted from premium materials, this collar is built to last, providing both style and practicality for your pup.',
    quantity: 30,
  ),
  Accessories(
    imgUrl: 'assets/images/accessories2.jpg',
    name: 'Warm fleece vest',
    price: 35,
    rate: 4.5,
    desc:
        'Stay warm and comfortable all season long with our premium fleece vest. Crafted with high-quality materials and thoughtful design, this vest is the perfect layering piece for any outdoor activity.',
    quantity: 30,
  ),
  Accessories(
    imgUrl: 'assets/images/accessories3.jpg',
    name: 'Pet Nail Clipper',
    rate: 4.5,
    price: 90,
    desc:
        'Safely and easily trim your pet\'s nails with our high-quality nail clippers. Designed with both pet comfort and user convenience in mind, these clippers will make grooming your furry friend a breeze.',
    quantity: 10,
  ),
  Accessories(
    imgUrl: 'assets/images/accessories4.jpg',
    rate: 4.5,
    name: 'Flea Comb',
    price: 25,
    desc:
        'Keep your pet\'s coat clean and free of fleas, ticks, and other debris with our high-quality flea comb. Designed with fine-toothed, stainless steel prongs, this comb efficiently removes even the smallest pests from your cat or dog\'s fur.',
    quantity: 30,
  ),
];
