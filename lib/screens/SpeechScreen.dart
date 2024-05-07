import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordsSpoken = "";
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSearching = false;
  List<String> _searchResults = [];

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = result.recognizedWords ?? "";
    });
    if (result.confidence >= 0.5 &&
        _wordsSpoken.toLowerCase().startsWith('search')) {
      String query = _wordsSpoken.substring('search'.length).trim();
      _searchItems(query);
    }
  }

  void _searchItems(String query) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('product').get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        _searchResults = querySnapshot.docs
            .where((doc) => (doc['ProductTitle'] as String)
                .toLowerCase()
                .contains(query.toLowerCase()))
            .map((doc) => doc['ProductTitle'] as String)
            .toList();
        _isSearching = true;
      });

      if (_searchResults.isEmpty) {
        String announcement = '$query  are not found or   unavailable';
        _flutterTts.speak(announcement);
        setState(() {
          _isSearching = false;
        });
      } else {
        String announcement = 'Search results for "$query"';
        _flutterTts.speak(announcement);
      }
    } else {
      String announcement = 'No items found matching: $query';
      _flutterTts.speak(announcement);
      setState(() {
        _isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: _isSearching
                    ? ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (BuildContext context, int index) {
                          final productName = _searchResults[index];
                          final querySnapshot = FirebaseFirestore.instance
                              .collection('product')
                              .where('ProductTitle', isEqualTo: productName)
                              .get();

                          return FutureBuilder(
                            future: querySnapshot,
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return ListTile(
                                  title: Text('Product not found'),
                                );
                              } else {
                                final productData = snapshot.data!.docs.first;
                                final productTitle =
                                    productData['ProductTitle'];
                                final price = productData['price'];

                                return Card(
                                  elevation: 4,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          productTitle,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Price: $price',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.volume_up),
                                              onPressed: () {
                                                String announcement =
                                                    'Product  Name  is  $productTitle\n'
                                                    'Price  is  $price   rupees \n'
                                                    '${productData['ProductDescription']}\n'
                                                    'Sizes  are   ${productData['size']}\n'
                                                    'Colours  are  ${productData['color']}';
                                                _flutterTts.speak(announcement);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context, '/product',
                                          arguments: productData.id);
                                    },
                                  ),
                                );
                              }
                            },
                          );
                        },
                      )
                    : Center(
                        child: Text('say "search" followed by a product name'),
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        tooltip: 'Listen',
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(205, 7, 36, 112),
      ),
    );
  }
}
