// import 'package:coin_rich/providers/app_state.dart';
// import 'package:coin_rich/widgets/coin_detail.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'models/coin_data.dart';

// class SearchDataHome extends StatefulWidget {
//   final String title;
//   final CoinData query;

//   const SearchDataHome({
//     Key? key,
//     required this.title,
//     required this.query,
//   }) : super(key: key);

//   @override
//   State<SearchDataHome> createState() => _SearchDataHomeState();
// }

// class _SearchDataHomeState extends State<SearchDataHome> {
//   @override
//   void initState() {
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   Provider.of<AppState>(context, listen: false).getCoinDataHandler();
//     // });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.title,
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         color: const Color(0XFF363333),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Row(
//                     children: const [
//                       Icon(
//                         Icons.pie_chart_outline,
//                         color: Colors.yellow,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         "Show Chart",
//                         style: TextStyle(
//                           color: Colors.yellow,
//                           fontSize: 12,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.bottomRight,
//                     child: Text(
//                       "Count: ${widget.coinData.data.length}",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: ListView.separated(
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     // return CoinDetailCard(
//                     //   coinData:
//                     //       value.coinData!.data.entries.elementAt(index).value,
//                     //   key: Key(value.coinData!.data.entries
//                     //       .elementAt(index)
//                     //       .value
//                     //       .id
//                     //       .toString()),
//                     // );
//                   },
//                   separatorBuilder: (context, index) {
//                     return const Divider(
//                       height: 20,
//                       thickness: 0,
//                     );
//                   },
//                   itemCount: widget.coinData.data.length),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
