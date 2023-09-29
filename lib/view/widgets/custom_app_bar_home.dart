import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  final String title;
  final void Function()? onPressedSearch;
  final void Function()? onPressedFavorite;
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;

  const CustomAppBarHome(
      {super.key,
      required this.title,
      required this.onPressedSearch,
      required this.onPressedFavorite,
      this.onChanged,
      this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPressedSearch, icon: const Icon(Icons.search)),
                hintText: title,
                hintStyle: const TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: onPressedFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 35,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
