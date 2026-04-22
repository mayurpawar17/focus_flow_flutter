import 'package:focus_flow_flutter/core/network/dio_client.dart';

import '../../../summary/data/model/summary_model.dart';
import '../model/entry_request.dart';
import '../model/entry_response.dart';
import '../model/today_entry_response.dart';

class EntryRepo {
  final DioClient dioClient;

  EntryRepo(this.dioClient);

  Future<TodayEntryResponse> getTodayEntries() async {
    final response = await dioClient.dio.get('/entries/today');

    if (response.data['status'] != 'success') {
      throw Exception(response.data['message']);
    }

    return TodayEntryResponse.fromJson(response.data);
  }

  Future<SummaryModel> getTodaySummary() async {
    final response = await dioClient.dio.get('/entries/summary/today');

    if (response.data['status'] != 'success') {
      throw Exception(response.data['message']);
    }

    return SummaryModel.fromJson(response.data['data']);
  }

  Future<EntryResponse> saveTodayEntry(EntryRequest entryRequest) async {
    final response = await dioClient.dio.post(
      '/entries',
      data: entryRequest.toJson(),
    );

    if (response.data['status'] != 'success') {
      throw Exception(response.data['message']);
    }

    return EntryResponse.fromJson(response.data);
  }
}
