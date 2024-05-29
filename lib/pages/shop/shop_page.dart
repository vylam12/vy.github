import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../component/product_item.dart';
import '../../component/shop_item_classify.dart';
import '../../models/accessories.dart';
import '../../models/devices.dart';
import '../../models/food.dart';
import '../../models/vet.dart';
import '../../resources/app_color.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int selectedCategoryIndex = 0;
  String searchKeyword = '';
  List<dynamic> filteredProducts = [];
  List<Map<String, dynamic>> categories = [
    {'icon': FontAwesomeIcons.bone, 'label': 'Food'},
    {'icon': FontAwesomeIcons.shieldCat, 'label': 'Vet Items'},
    {'icon': Icons.pets, 'label': 'Accessories'},
    {'icon': Icons.devices, 'label': 'IOT Devices'},
  ];
  List<Map<String, dynamic>> product = [
    {'foods': foods},
    {'vets': vetList},
    {'accessories': accessoriesList},
    {'devices': devicesList},
  ];
  @override
  void initState() {
    super.initState();
    filteredProducts = product[selectedCategoryIndex].values.first;
  }

  void searchProducts(String keywords) {
    setState(() {
      searchKeyword = keywords;
      filteredProducts = [];
      List<dynamic> productList = product[selectedCategoryIndex].values.first;
      for (dynamic productItem in productList) {
        if (productItem is Foods) {
          Foods food = productItem;
          if (food.namefood!.toLowerCase().contains(keywords.toLowerCase())) {
            filteredProducts.add(food);
          }
        } else if (productItem is Vet) {
          Vet vet = productItem;
          if (vet.namevet!.toLowerCase().contains(keywords.toLowerCase())) {
            filteredProducts.add(vet);
          }
        } else if (productItem is Accessories) {
          Accessories accessories = productItem;
          if (accessories.nameaccess!
              .toLowerCase()
              .contains(keywords.toLowerCase())) {
            filteredProducts.add(accessories);
          }
        } else if (productItem is Devices) {
          Devices devices = productItem;
          if (devices.namedv!.toLowerCase().contains(keywords.toLowerCase())) {
            filteredProducts.add(devices);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Shop',
          style: GoogleFonts.fredoka(
              fontSize: 25.0,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.white)),
        ),
        backgroundColor: AppColor.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30.0),
            Center(
              child: Container(
                height: 51.0,
                width: 350.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: searchProducts,
                  decoration: InputDecoration(
                    hintText: 'Search keywords..',
                    icon: const Icon(
                      Icons.search,
                      color: AppColor.grey,
                      size: 25.0,
                    ),
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.fredoka(
                        fontSize: 16.0,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500, color: AppColor.grey)),
                  ),
                ),
              ),
            ),
            const Gap(20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      categories.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                            searchKeyword =
                                ''; // Xóa từ khóa tìm kiếm khi chuyển danh mục
                            filteredProducts =
                                product[selectedCategoryIndex].values.first;
                          });
                        },
                        child: ShopItemClassify(
                          icon: categories[index]['icon'],
                          hintText: categories[index]['label'],
                          isSelected: selectedCategoryIndex == index,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(20.0),
                Text(
                  'Recommended ${categories[selectedCategoryIndex]['label']}',
                  style: GoogleFonts.fredoka(
                    fontSize: 20.0,
                    textStyle: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: searchKeyword.isEmpty
                    ? product[selectedCategoryIndex].values.first.length
                    : filteredProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  final List<dynamic> productList = searchKeyword.isEmpty
                      ? product[selectedCategoryIndex].values.first
                      : filteredProducts;
                  final dynamic productItem = productList[index];
                  if (productItem is Foods) {
                    final Foods food = productItem;
                    return ProductItem(
                      priceProduct: food.price!.toStringAsFixed(2),
                      nameProduct: food.namefood ?? '',
                      imageProduct: food.imgUrl ?? '',
                      weight: food.weight.toString(),
                    );
                  } else if (productItem is Vet) {
                    final Vet vet = productItem;
                    return ProductItem(
                      nameProduct: vet.namevet ?? '',
                      imageProduct: vet.imgUrl ?? '',
                      weight: '',
                      priceProduct: vet.price!.toStringAsFixed(2),
                    );
                  } else if (productItem is Accessories) {
                    final Accessories accessories = productItem;
                    return ProductItem(
                      nameProduct: accessories.nameaccess ?? '',
                      imageProduct: accessories.imgUrl ?? '',
                      priceProduct: accessories.price!.toStringAsFixed(2),
                      weight: '',
                    );
                  } else if (productItem is Devices) {
                    final Devices devices = productItem;
                    return ProductItem(
                      priceProduct: devices.price!.toStringAsFixed(2),
                      weight: '',
                      nameProduct: devices.namedv ?? '',
                      imageProduct: devices.imgUrl ?? '',
                    );
                  } else {
                    return const SizedBox();
                  }
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 0,
                    childAspectRatio: 2 / 2.83),
              ),
            ),
            const Gap(10.0),
          ],
        ),
      ),
    );
  }
}
