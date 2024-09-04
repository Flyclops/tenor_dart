import 'package:flutter/material.dart';
import 'package:tenor_dart/tenor_dart.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenor Dart Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tenor Dart Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TenorResult> searchResults = [];
  List<TenorResult> featuredResults = [];
  List<TenorCategory?> categoryResults = [];
  List<String?> autocompleteResults = [];
  List<String?> trendingSearchTermsResults = [];
  List<String?> searchSuggestionsResults = [];
  TenorResult? randomGif;

  @override
  void initState() {
    super.initState();

    exampleCode();
  }

  void exampleCode() async {
    // replace apiKey with an api key provided by Tenor > https://developers.google.com/tenor/guides/quickstart
    final String apiKey = FlutterConfig.get('TENOR_API_KEY');
    var api = Tenor(apiKey: apiKey, clientKey: 'tenor-dart-example');

    ///
    /// Search GIFs for "marvel" keyword
    ///
    final searchResponse = await api.search('marvel', limit: 5);
    print(searchResponse);
    if (searchResponse?.results.isNotEmpty ?? false) {
      setState(() {
        searchResults = searchResponse!.results;
      });
    }
    // Additional
    final searchResponseNext = await searchResponse?.fetchNext(limit: 5);
    if (searchResponseNext?.results.isNotEmpty ?? false) {
      setState(() {
        final clonedResults = [...searchResults];
        clonedResults.addAll(searchResponseNext!.results);
        searchResults = clonedResults;
      });
    }

    ///
    /// Random GIF
    ///
    final randomResponse = await api.search('universe', limit: 1, random: true);
    if (randomResponse?.results.isNotEmpty ?? false) {
      setState(() {
        randomGif = randomResponse!.results.first;
      });
    }

    ///
    /// Fetch Featured GIFs
    ///
    final featuredResponse = await api.featured(limit: 5);
    if (featuredResponse?.results.isNotEmpty ?? false) {
      setState(() {
        featuredResults = featuredResponse!.results;
      });
    }
    // Additional
    final featuredNext = await featuredResponse?.fetchNext(limit: 5);
    if (featuredNext?.results.isNotEmpty ?? false) {
      setState(() {
        final clonedResults = [...featuredResults];
        clonedResults.addAll(featuredNext!.results);
        featuredResults = clonedResults;
      });
    }

    ///
    /// Featured Categories
    ///
    final categoryResponse = await api.categories();
    setState(() {
      categoryResults = categoryResponse;
    });

    ///
    /// Autocomplete
    ///
    var autocompleteResponse = await api.autocomplete('pro', limit: 10);
    setState(() {
      autocompleteResults = autocompleteResponse;
    });

    ///
    /// Trending Search Terms
    ///
    var trendingSearchTermsResponse = await api.trendingSearchTerms(limit: 10);
    setState(() {
      trendingSearchTermsResults = trendingSearchTermsResponse;
    });

    ///
    /// Search Suggestions
    ///
    var searchSuggestionsResponse =
        await api.searchSuggestions('laugh', limit: 10);
    setState(() {
      searchSuggestionsResults = searchSuggestionsResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
                const Text(
                  'Search GIFs for "marvel"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: searchResults.map(
                    (gif) {
                      final tinygif = gif.media?.tinygif;
                      if (tinygif == null) {
                        return const SizedBox();
                      }
                      return Expanded(
                        child: Image.network(
                          tinygif.url.toString(),
                          // height: tinygif.dims?[1].toDouble(),
                          // width: tinygif.dims?[0].toDouble(),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Featured GIFs',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: featuredResults.map(
                    (gif) {
                      final tinygif = gif.media?.tinygif;
                      if (tinygif == null) {
                        return const SizedBox();
                      }
                      return Expanded(
                        child: Image.network(
                          tinygif.url.toString(),
                          // height: tinygif.dims?[1].toDouble(),
                          // width: tinygif.dims?[0].toDouble(),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Random GIF for "universe"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (randomGif?.media?.tinygif?.url != null)
                  Image.network(
                    randomGif!.media!.tinygif!.url,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 100,
                  ),
                const SizedBox(height: 16),
                const Text(
                  'Featured Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: categoryResults.map(
                    (category) {
                      if (category == null) {
                        return const SizedBox();
                      }
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            category.image.toString(),
                            fit: BoxFit.cover,
                            height: 50,
                            width: 100,
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            color: Colors.black.withOpacity(0.3),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  category.searchTerm,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Autocomplete for "pro"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(autocompleteResults.join(', ')),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Trending Search Terms',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(trendingSearchTermsResults.join(', ')),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Search Suggestions for "laugh"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(searchSuggestionsResults.join(', ')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
