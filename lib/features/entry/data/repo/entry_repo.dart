import 'package:dio/dio.dart';
import 'package:focus_flow_flutter/core/network/dio_client.dart';

import '../../../summary/data/model/summary_model.dart';
import '../model/entry_request.dart';
import '../model/entry_response.dart';
import '../model/today_entry_response.dart';

class EntryRepo {
  final DioClient dioClient;

  EntryRepo(this.dioClient);

  Future<TodayEntryResponse> getTodayEntries() async {
    try {
      final response = await dioClient.dio.get('/entries/today');

      if (response.data['status'] != 'success') {
        throw Exception(response.data['message']);
      }

      return TodayEntryResponse.fromJson(response.data);
    } on DioException catch (e) {
      // 🔥 Handle different cases
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Server is taking too long. Try again.");
      }

      if (e.type == DioExceptionType.connectionError) {
        throw Exception("No internet connection.");
      }

      if (e.response != null) {
        throw Exception(e.response?.data['message'] ?? "Server error");
      }

      throw Exception("Something went wrong.");
    } catch (e) {
      throw Exception("Unexpected error occurred.");
    }
  }

  Future<SummaryModel> getTodaySummary() async {
    try {
      final response = await dioClient.dio.get('/entries/summary/today');

      if (response.data['status'] != 'success') {
        throw Exception(response.data['message']);
      }

      return SummaryModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      // 🔥 Handle different cases
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Server is taking too long. Try again.");
      }

      if (e.type == DioExceptionType.connectionError) {
        throw Exception("No internet connection.");
      }

      if (e.response != null) {
        throw Exception(e.response?.data['message'] ?? "Server error");
      }

      throw Exception("Something went wrong.");
    } catch (e) {
      throw Exception("Unexpected error occurred.");
    }
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
