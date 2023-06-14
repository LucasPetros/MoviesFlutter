import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:movies/data/network/client/api_client.dart';
import 'package:movies/data/network/network_mapper.dart';
import 'package:movies/data/repository/movies_repository.dart';
import 'package:movies/domain/model/config.dart';
import 'package:movies/presentation/app/app.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class InitialData {
  final List<SingleChildWidget> providers;

  InitialData({required this.providers});
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final data = await _createData();

  runApp(App(data: data));
}

Future<InitialData> _createData() async {
  //Util
  final log = Logger(
    printer: PrettyPrinter(),
    level: kDebugMode ? Level.verbose : Level.nothing,
  );

  //Load project configuration
  final config = await _loadConfig(log);

  //Data
  final apiClient = ApiClient(
    baseUrl: 'https://moviesdatabase.p.rapidapi.com/',
    apiKey: config.apiKey,
    apiHost: config.apiHost,
  );

  final networkMapper = NetworkMapper(log: log);
  final moviesRepo = MoviesRepository(
    apiClient: apiClient,
    networkMapper: networkMapper,
  );

  //create and return list of providers
  return InitialData(
    providers: [
      Provider<Logger>.value(value: log),
      Provider<MoviesRepository>.value(value: moviesRepo)
    ],
  );
}

Future<Config> _loadConfig(Logger log) async {
  String raw;

  try {
    raw = await rootBundle.loadString('assets/config/config.json');
    final config = jsonDecode(raw) as Map<String, dynamic>;

    return Config(
      apiKey: config['apiKey'] as String,
      apiHost: config['apiHost'] as String,
    );
  } catch (e) {
    log.e('Error while loading project configuration please make sure: '
        'That the config.json file  located at /assets/config/ '
        'Exists and that it contains correct configuration');
    rethrow;
  }
}
