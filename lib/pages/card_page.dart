import 'package:flutter/material.dart';
import 'package:loginapp/model/card_detail.dart';
import 'package:loginapp/pages/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var cardDetail = CardDetail(
      1,
      'Flutter',
      'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
      'To ensure legibility, the Flutter lockup and icon should sit within an open space. A minimum margin of space equivalent to the height of a single should always be maintained around the lockup or icon. A greater margin of space should be proved when possible. The logo should never be overlapped or crowded by text or artwork. Additionally the logo should not be linked to other logos or labels. Only approved brand lockups should be used.');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CardDetailPage(cardDetail: cardDetail)));
            },
            child: Hero(
              tag: cardDetail.id,
              child: Card(
                elevation: 3,
                shadowColor: Colors.grey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            cardDetail.url,
                            height: 30,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            cardDetail.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(
                        cardDetail.text,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CardDetailPage(
                                            cardDetail: cardDetail)));
                              },
                              child: const Text(
                                'Ler Mais',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
