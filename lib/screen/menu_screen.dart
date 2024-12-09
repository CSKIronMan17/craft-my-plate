import 'package:flutter/material.dart';
import 'fill_details_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool _isPureVeg = false;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          decoration: const BoxDecoration(
            color: Color(0XFF242628),
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: const Color(0XFFFFFFFF)),
        ),
        title: Row(
          children: [
            const Text(
              'South Indian Breakfast',
              style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Color(0XFF93999F),
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Category Tabs
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CategoryChip(
                          label: 'Starters',
                          count: '2/2',
                          isSelected: true,
                          textColor: const Color(0XFF252229),
                          countColor: const Color(0XFF252229),
                          borderColor: const Color(0XFF00B85C),
                          solidColor: const Color(0XFF00B85C).withOpacity(0.1),
                          assetImage: Image.asset("assets/samosa.png"),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CategoryChip(
                          label: 'Mains',
                          count: '2/2',
                          isSelected: true,
                          textColor: const Color(0XFF6318AF),
                          countColor: const Color(0XFFFFFFFF),
                          borderColor: Colors.transparent,
                          solidColor: const Color(0XFF6318AF),
                          assetImage: Image.asset("assets/main.png"),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CategoryChip(
                          label: 'Sweets',
                          count: '0/1',
                          isSelected: false,
                          textColor: const Color(0XFF252229),
                          countColor: const Color(0XFF515151),
                          borderColor: const Color(0XFFDEDDDE),
                          solidColor: Colors.transparent,
                          assetImage: Image.asset("assets/sweet.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 8),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/leaf.png",
                                height: 15,
                                width: 15,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Pure Veg",
                                style: TextStyle(
                                    color: Color(0XFF0A7047),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Switch(
                                value: _isPureVeg,
                                // State variable to control the switch
                                onChanged: (bool value) {
                                  setState(() {
                                    _isPureVeg =
                                        value; // Update the state when the switch is toggled
                                  });
                                },
                                activeColor: const Color(0XFF257B3E),
                                // Customize switch color
                                inactiveThumbColor: const Color(0XFF257B3E),
                                inactiveTrackColor: Colors.grey.shade300,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelected =
                                        !isSelected; // Toggle the state
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isSelected
                                          ? const Color(0XFF912018)
                                          : Colors.grey, // Dynamic border color
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/nonveg.png",
                                          height: 18,
                                          width: 18,
                                          fit: BoxFit.cover),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Non Veg",
                                        style: TextStyle(
                                          color: isSelected
                                              ? const Color(0XFF912018)
                                              : const Color(
                                                  0xFF912018), // Dynamic text color
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Food Items Grid
                      Expanded(
                        child: Container(
                          color: const Color(0XFFF5F6FB),
                          child: Stack(
                            children: [
                              GridView.builder(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.7 / 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: foodItems.length,
                                // Use the length of foodItems list
                                itemBuilder: (context, index) {
                                  // Access the specific food item at index
                                  FoodItem foodItem = foodItems[index];

                                  return FoodCard(
                                    imageAsset: foodItem.imageAsset,
                                    // Pass the image URL
                                    title: foodItem.name,
                                  );
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 225, top: 620),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 10),
                                  child: const Text(
                                    "Add Ons",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 315,
                                top: 610,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0XFFED4596),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Price per plate",
                  style: TextStyle(color: Color(0XFF93999F)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: '₹240',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '/Plate',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FillDetailsScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        backgroundColor: const Color(0XFF6318AF),
                        foregroundColor: const Color(0XFFFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Fill Details',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class FilterChipWidget extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//
//   FilterChipWidget({required this.label, required this.isSelected});
//
//   @override
//   Widget build(BuildContext context) {
//     return FilterChip(
//       label: Text(label),
//       selected: isSelected,
//       onSelected: (_) {},
//       selectedColor: Colors.green,
//       checkmarkColor: Colors.white,
//       backgroundColor: Colors.grey.shade200,
//     );
//   }
// }

class CategoryChip extends StatefulWidget {
  final String label;
  final String count;
  final bool isSelected;
  final Color textColor;
  final Color countColor;
  final Color borderColor;
  final Color solidColor;
  final Image assetImage;

  const CategoryChip({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.textColor, // New parameter for text color
    required this.countColor, // New parameter for text color
    required this.borderColor, // New parameter for text color
    required this.solidColor, // New parameter for text color
    required this.assetImage, // New parameter for text color
    super.key,
  });

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 25, // Adjust radius to control size
            backgroundColor:
                widget.isSelected ? Colors.green : Colors.grey.shade300,
            child: widget.assetImage),
        const SizedBox(height: 8), // Space between CircleAvatar and label
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: widget.textColor, // Use the custom text color
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4), // Space between label and count
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          decoration: BoxDecoration(
              color: widget.solidColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: widget.borderColor,
                  width: 2,
                  style: BorderStyle.solid)),
          child: Text(
            widget.count,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: widget.countColor, // Use the custom text color
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class FoodCard extends StatefulWidget {
  final Image imageAsset;
  final String title;

  const FoodCard({
    required this.imageAsset,
    required this.title,
    super.key,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: widget.imageAsset),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: isAdded ? Colors.white : Colors.pink,
                    backgroundColor: isAdded ? Colors.pink : Colors.white,
                    side: const BorderSide(color: Colors.pink),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isAdded = !isAdded; // Toggle the state
                      // Debug print to verify
                    }); // Toggle the state
                    print("isAdded state: $isAdded");
                  },
                  child: Text(
                    isAdded ? "Added" : 'Add',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodItem {
  final String name;
  final Image imageAsset;

  FoodItem({required this.name, required this.imageAsset});
}

List<FoodItem> foodItems = [
  FoodItem(
      name: 'Idli Sambar',
      imageAsset: Image.asset(
        "assets/idli.png",
        fit: BoxFit.cover,
        width: double.infinity,
      )),
  FoodItem(
    name: 'Appam',
    imageAsset: Image.asset(
      "assets/appam.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ),
  FoodItem(
    name: 'Dosa',
    imageAsset: Image.asset(
      "assets/dosa.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ),
  FoodItem(
    name: 'Wada',
    imageAsset: Image.asset(
      "assets/wada.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ),
  FoodItem(
    name: 'Pongal',
    imageAsset: Image.asset(
      "assets/pongal.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ),
  FoodItem(
    name: 'Bonda',
    imageAsset: Image.asset(
      "assets/bonda.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ),
];
