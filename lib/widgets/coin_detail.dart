import 'package:coin_rich/models/coin_data.dart';
import 'package:flutter/material.dart';

class CoinDetailCard extends StatelessWidget {
  final Datum coinData;
  const CoinDetailCard({
    Key? key,
    required this.coinData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  coinData.name,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      coinData.quote.usd.percentChange24H > 0
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color: coinData.quote.usd.percentChange24H > 0
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${coinData.quote.usd.percentChange24H.toStringAsFixed(2)}%",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 56, 54),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  coinData.symbol,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "\$${coinData.quote.usd.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        "Rank",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        coinData.cmcRank.toString(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _modalBottomSheetMenu(context, coinData);
                },
                child: const Icon(
                  Icons.arrow_circle_right,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void _modalBottomSheetMenu(ctx, data) {
  showModalBottomSheet(
      context: ctx,
      builder: (builder) {
        return Container(
          height: 350.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0))),
            child: buttomSheetDetail(data),
          ),
        );
      });
}

Widget buttomSheetDetail(data) {
  return Column(
    children: [
      Text(data.name),
      Column(
        children: [
          Text("Tags"),
          Wrap(
            children: [
              ...data.tags.map((e) {
                return Chip(
                  label: Text(e),
                );
              })
            ],
          )
        ],
      ),
      Column(
        children: [
          Text("Price Last Updated"),
        ],
      ),
    ],
  );
}
