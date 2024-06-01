class Devices {
  final String? imgUrl;
  final String? desc;
  final String? name;
  final double? rate;
  final double? price;
  final int? quantity;
  Devices({
    this.price,
    this.imgUrl,
    this.quantity,
    this.desc,
    this.rate,
    this.name,
  });
}

List<Devices> devicesList = [
  Devices(
    imgUrl: 'assets/images/dv_01.png',
    name: 'GPS Pet Tracker',
    price: 30,
    rate: 4.5,
    quantity: 10,
    desc:
        'Losing a pet is a worry for all pet owners, but with the "GPS Pet Tracker", you can rest assured that you can track and protect your beloved companion. This is a compact and precise GPS tracking device designed specifically to be attached to your pet\'s collar or leash.',
  ),
  Devices(
    imgUrl: 'assets/images/dv_02.png',
    name: 'Petcube Pet Camera',
    quantity: 100,
    price: 150,
    rate: 4.5,
    desc:
        'Staying connected with your beloved pet when you\'re away from home is now easier than ever with the Petcube Pet Camera. This innovative device allows you to keep an eye on your furry friend, interact with them, and even capture special moments, all from the convenience of your smartphone.',
  ),
  Devices(
    imgUrl: 'assets/images/dv_03.png',
    name: 'Fi  Smart Collar',
    quantity: 100,
    rate: 4.5,
    price: 120,
    desc:
        'Keeping your dog safe and secure is a top priority for any pet owner. The Fi Smart Collar takes pet tracking and monitoring to the next level, providing an advanced solution that seamlessly integrates with your lifestyle.',
  ),
  Devices(
    imgUrl: 'assets/images/dv_04.png',
    name: 'Automatic Pet Feeder',
    price: 122,
    quantity: 100,
    rate: 4.5,
    desc:
        'Keeping your furry friend fed and nourished is a daily responsibility, but the Automatic Pet Feeder makes the process easier and more convenient than ever before. This innovative device takes the hassle out of pet feeding, allowing you to provide your pet with consistent, scheduled meals even when you\'re not at home.',
  ),
];
