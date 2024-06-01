class Vet {
  final String? imgUrl;
  final String? name;
  final double? price;
  final String? desc;
  final double? rate;
  final int? quantity;
  Vet({
    this.price,
    this.imgUrl,
    this.rate,
    this.quantity,
    this.name,
    this.desc,
  });
}

List<Vet> vetList = [
  Vet(
    imgUrl: 'assets/images/vet_item1.png',
    name: 'Wet Dog - Flea',
    price: 80,
    rate: 4.5,
    quantity: 100,
    desc:
        'Effective Flea Relief for Wet Dogs Banish fleas on your wet, furry friend with our specially formulated flea treatment. This unique formula works quickly to eliminate existing flea infestations and prevent future outbreaks, all while being gentle on your dog\'s skin.',
  ),
  Vet(
    imgUrl: 'assets/images/vet_item2.png',
    name: 'Orondo Spray',
    rate: 4.5,
    quantity: 100,
    price: 28,
    desc:
        'Orondo Spray is a versatile topical solution formulated to support the treatment of surgical wounds, skin injuries, and bacterial nail infections. Powered by a potent yet gentle antimicrobial blend, this spray provides comprehensive care for a variety of skin and nail conditions.',
  ),
  Vet(
    imgUrl: 'assets/images/vet_item3.png',
    name: 'Nexgard - Afoxolaner',
    rate: 4.5,
    quantity: 100,
    price: 30,
    desc:
        'NexGard is a convenient, once-a-month chewable tablet that provides comprehensive protection against fleas and ticks for dogs. Formulated with the active ingredient afoxolaner, this veterinary-exclusive medication quickly kills existing infestations and prevents future outbreaks.',
  ),
  Vet(
    imgUrl: 'assets/images/vet_item4.png',
    name: 'Petro Mange Cream',
    quantity: 100,
    rate: 4.5,
    price: 650.000,
    desc:
        'Petro Mange Cream is a specialized topical treatment formulated to provide soothing relief and promote healing for dogs suffering from mange infections. Infused with a powerful, veterinarian-approved blend of active ingredients, this cream targets the root cause of mange to eliminate the mites responsible and alleviate uncomfortable symptoms.',
  ),
];
