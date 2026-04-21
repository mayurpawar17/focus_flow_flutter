import 'package:dio/dio.dart';

import '../../../summary/data/model/summary_model.dart';
import '../model/entry_model.dart';

abstract class EntryRepo {
  Future<List<EntryModel>> getTodayEntries();
}

class EntryRemoteDataSourceImpl implements EntryRepo {
  final Dio dio;

  EntryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<EntryModel>> getTodayEntries() async {
    final response = await dio.get('/entries/today');

    if (response.data['status'] != 'success') {
      throw Exception(response.data['message']);
    }

    final List data = response.data['data'];

    return data.map((e) => EntryModel.fromJson(e)).toList();
  }

  Future<SummaryModel> getTodaySummary() async {
    final response = await dio.get('/entries/summary/today');

    if (response.data['status'] != 'success') {
      throw Exception(response.data['message']);
    }

    return SummaryModel.fromJson(response.data['data']);
  }
}
