import 'package:flutter/material.dart';
import 'package:jokes_app/models/jokes_model.dart';
import 'package:jokes_app/services/api_services.dart';
import 'package:jokes_app/widgets/api_text.dart';
import 'package:jokes_app/widgets/text_container.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({Key? key}) : super(key: key);

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  ApiServices apiServices = ApiServices();
  List<JokesModel> jokesData = [];
  List<JokesModel> sortedJokesData = [];
  bool isShuffled = false;

  @override
  void initState() {
    super.initState();
    refreshJokes();
  }

  void refreshJokes() async {
    List<JokesModel>? fetchedJokes = await apiServices.getJokes();
    if (fetchedJokes != null) {
      setState(() {
        jokesData = fetchedJokes;
        sortedJokesData = jokesData.toList();
      });
    }
  }

  void sortJokesByType() {
    setState(() {
      sortedJokesData.sort((a, b) => a.type.compareTo(b.type));
    });
  }

  void shuffleJokes() {
    setState(() {
      if (isShuffled) {
        sortedJokesData = jokesData.toList();
      } else {
        sortedJokesData.shuffle();
      }
      isShuffled = !isShuffled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: Column(
        children: [
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: refreshJokes,
                  child: const Text('Refresh'),
                ),
                ElevatedButton(
                  onPressed: sortJokesByType,
                  child: const Text('Sort by Type'),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: shuffleJokes,
            child: Text(isShuffled ? 'Reset Shuffle' : 'Shuffle'),
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.grey.shade300,
              ),
              child: Scrollbar(
                thickness: 10,
                thumbVisibility: true,
                child: ListView.builder(
                  itemCount: sortedJokesData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      child: Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextContainer(
                                apiData:
                                    'Joke Type: ${sortedJokesData[index].type}',
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              ApiText(
                                apiText:
                                    'Setup: ${sortedJokesData[index].setup}',
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ApiText(
                                apiText:
                                    'Punchline: ${sortedJokesData[index].punchline}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
