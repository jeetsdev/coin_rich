// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_rich/home.dart';
import 'package:coin_rich/search_data_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coin_rich/providers/app_state.dart';

class SearchScreen extends StatefulWidget {
  final String title;
  const SearchScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchValue = "";

  onSearcHandler(String query) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          title: "Coinrich",
          query: query,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        color: Colors.black87.withOpacity(.8),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height:
            MediaQuery.of(context).size.height - AppBar().preferredSize.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(25),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search, size: 30),
                  ),
                  prefixIconColor: Colors.grey,
                  hintText: "Enter Coin Symbol",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  fillColor: Colors.black,
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  autofocus: true,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.grey,
                    backgroundColor: Colors.yellow,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                  ),
                  onPressed: searchValue == ""
                      ? null
                      : () {
                          onSearcHandler(searchValue);
                        },
                  child: Row(
                    children: const [
                      Expanded(
                        child: Center(
                          child: Text(
                            "SEARCH",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.black,
                        size: 50,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
