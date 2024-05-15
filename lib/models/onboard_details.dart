class Onboards {
  final String? imgUrl;
  final String? title;
  final String? desc;
  Onboards({this.imgUrl, this.title, this.desc});
}

List<Onboards> onboards = [
  Onboards(
      imgUrl: 'assets/images/onb1.png',
      title: 'Hey! Welcome',
      desc: "while you sit and stay - we’ll go out and play"),
  Onboards(
      imgUrl: 'assets/images/on3.png',
      title: 'Now!',
      desc:
          "One tap for foods, accessories, health care products & digital gadgets "
          "Grooming & boarding "
          "Easy & best consultation bookings"),
  Onboards(
      imgUrl: 'assets/images/on2.png',
      title: 'We provide',
      desc: "24hrs location tracking & health updates "
          "On time feeding updates"),
];
