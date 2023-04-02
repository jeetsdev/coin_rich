import 'package:coin_rich/providers/app_state.dart';
import 'package:coin_rich/widgets/coin_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppState>(context, listen: false).getCoinDataHandler();
    });
    super.initState();
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
        body: Consumer<AppState>(
          builder: (context, value, child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: const Color(0XFF363333),
              child: value.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.yellow,
                      ),
                    )
                  : value.isError
                      ? Center(
                          child: Text(
                            "Something went wrong, please try again",
                            style: TextStyle(
                              color: Colors.red.withOpacity(0.7),
                              fontSize: 12,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.pie_chart_outline,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Show Chart",
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "Count: ${value.coinData!.data.length}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return CoinDetailCard(
                                      coinData: value.coinData!.data.entries
                                          .elementAt(index)
                                          .value,
                                      key: Key(value.coinData!.data.entries
                                          .elementAt(index)
                                          .value
                                          .id
                                          .toString()),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      height: 20,
                                      thickness: 0,
                                    );
                                  },
                                  itemCount: value.coinData!.data.length),
                            ),
                          ],
                        ),
            );
          },
        ));
  }
}
