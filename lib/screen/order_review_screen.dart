import 'package:flutter/material.dart';

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({super.key});
  @override
  _OrderReviewScreenState createState() => _OrderReviewScreenState();
}

class _OrderReviewScreenState extends State<OrderReviewScreen> {
  bool _isSelectedItemsVisible =
      false; // To toggle the visibility of selected items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0XFFFFFFFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined), // Outline icon
          onPressed: () {
            // Navigate to FillDetailsScreen when back button is pressed
            Navigator.pop(context);
          },
        ),
        title: const Text("Order Review"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.cable_outlined,
                            size: 20), // Outline icon
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Millet Breakfast",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.people_outline, size: 18),
                                  SizedBox(width: 3),
                                  Text("265"),
                                  SizedBox(width: 5),
                                  Icon(Icons.calendar_today_outlined, size: 18),
                                  Text("11/09/2024"),
                                  SizedBox(width: 5),
                                  Icon(Icons.access_time_outlined, size: 18),
                                  Text("12:30AM-2:30AM"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Edit",
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0), // Align with Subtotal
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Hide Selected Items",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(
                          _isSelectedItemsVisible
                              ? Icons.expand_less
                              : Icons.expand_more,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSelectedItemsVisible = !_isSelectedItemsVisible;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                if (_isSelectedItemsVisible)
                  const Column(
                    children: [
                      ListTile(
                        title: Text("Selected Item 1"),
                        trailing: Text("₹12,000"),
                      ),
                      ListTile(
                        title: Text("Selected Item 2"),
                        trailing: Text("₹5,600"),
                      ),
                    ],
                  ),
                // Subtotal Section
                Padding(
                  padding: const EdgeInsets.only(left: 20.0), // Align Subtotal
                  child: ListTile(
                    title: const Text("Subtotal"),
                    contentPadding: EdgeInsets.zero, // Remove default padding
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          // Reduce gap between subtotal text and amount
                          child: RichText(
                            text: const TextSpan(
                              text: "₹24,600 ",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                              children: [
                                TextSpan(
                                    text: "₹22,200",
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 18), // Right arrow icon
                      ],
                    ),
                  ),
                ),
                // New "Incl. taxes and charges" Line
                const Padding(
                  padding: EdgeInsets.only(
                    left: 0,
                  ), // Align with Subtotal
                  child: Text(
                    "Incl. taxes and charges",
                    style: TextStyle(
                      color: Color(0xFF93999F), // Specific color
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(), // Divider to separate
                const SizedBox(
                  height: 26,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0XFF6318AF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.celebration_outlined, color: Colors.yellow),
                      // Outline icon
                      SizedBox(width: 10),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Hurray! You saved ",
                              style: TextStyle(
                                  color: Colors.white), // White text color
                            ),
                            Text(
                              "₹17,130/-",
                              style: TextStyle(
                                color: Color(0XFFEFB31A),
                                fontWeight: FontWeight.bold,
                              ), // White text color
                            ),
                            Text(
                              " on total order",
                              style: TextStyle(
                                  color: Colors.white), // White text color
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Removed the SizedBox here to attach "Hurray" to the next section
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFFFFFFF),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 2),
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(4)),
                  child: const Column(
                    children: [
                      ListTile(
                        title: Text("Total"),
                        trailing: Text("₹24,600"),
                      ),
                      ListTile(
                        title: Text("Dynamic pricing discount"),
                        trailing: Text("-₹8,000"),
                      ),
                      ListTile(
                        title: Text(
                          "To Pay",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF60666C),
                          ),
                        ),
                        trailing: Text(
                          "₹41,800",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF242628),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(1, -2),
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2),
            ]),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To pay",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF60666C),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "₹90,500",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF242628),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 240,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(140, 45),
                      backgroundColor: const Color(0xFF6318AF),
                      // Set button color to #6318AF
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Place Order",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Set text color to #FFFFFF
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
