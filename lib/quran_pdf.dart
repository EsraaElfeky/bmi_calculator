import 'package:flutter/material.dart';

class Quran extends StatelessWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('قران كريم'),
        centerTitle: true,
      ),
      // body: SfPdfViewer.asset(
      //   'asset/pdf/quran.pdf',
      //
      //   // scrollDirection: PdfScrollDirection.horizontal,
      //   // pageLayoutMode: PdfPageLayoutMode.single,
      // ),
    );
  }
}
