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
              const Icon(
                Icons.arrow_circle_right,
                color: Colors.yellow,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
