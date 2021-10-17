// ignore_for_file: always_declare_return_types

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:registro_elettronico/feature/notes/data/model/remote/note_remote_model.dart';
import 'package:registro_elettronico/feature/notes/data/model/remote/notes_read_remote_model.dart';
import 'package:registro_elettronico/feature/scrutini/data/model/document_remote_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

// part 'spaggiari_client.g.dart';

// This is written 'strangely' beacuse I used Retrofit to generate the calls but then
// for feature reasons I had to manually write the http calls

abstract class LegacySpaggiariClient {
  factory LegacySpaggiariClient(Dio dio) = _SpaggiariClient;

  @GET("/students/{studentId}/notes/all/")
  Future<NotesResponse> getNotes(@Path() String studentId);

  @POST("/students/{studentId}/notes/{type}/read/{layout_note}")
  Future<NotesReadResponse> markNote(
    @Path('studentId') String studentId,
    @Path("type") String type,
    @Path("layout_note") int note,
    @Body() String body,
  );

  @POST('/students/{studentId}/documents')
  Future<DocumentsResponse> getDocuments(@Path() String studentId);

  @POST('/students/{studentId}/documents/check/{documentHash}')
  Future<bool> checkDocumentAvailability(
    @Path() String studentId,
    @Path() String documentHash,
  );

  @POST('/students/{studentId}/documents/check/{documentHash}')
  Future<Tuple2<List<int>, String>> readDocument(
    @Path() String studentId,
    @Path() String documentHash,
  );
}

class _SpaggiariClient implements LegacySpaggiariClient {
  _SpaggiariClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://web.spaggiari.eu/rest/v1';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getNotes(studentId) async {
    ArgumentError.checkNotNull(studentId, 'studentId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/students/$studentId/notes/all/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NotesResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  markNote(studentId, type, note, body) async {
    ArgumentError.checkNotNull(studentId, 'studentId');
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(note, 'note');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = body;
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/students/$studentId/notes/$type/read/$note',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NotesReadResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  Future<DocumentsResponse> getDocuments(String studentId) async {
    ArgumentError.checkNotNull(studentId, 'studentId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = '';
    final Response<Map<String, dynamic>> _result = await _dio.request(
      '/students/$studentId/documents',
      queryParameters: queryParameters,
      options: RequestOptions(
          method: 'POST',
          headers: <String, dynamic>{},
          extra: _extra,
          baseUrl: baseUrl),
      data: _data,
    );
    final value = DocumentsResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  Future<bool> checkDocumentAvailability(
      String studentId, String documentHash) async {
    ArgumentError.checkNotNull(studentId, 'studentId');
    ArgumentError.checkNotNull(documentHash, 'documentHash');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = '';
    final Response<Map<String, dynamic>> _result = await _dio.request(
      '/students/$studentId/documents/check/$documentHash',
      queryParameters: queryParameters,
      options: RequestOptions(
        method: 'POST',
        headers: <String, dynamic>{},
        extra: _extra,
        baseUrl: baseUrl,
      ),
      data: _data,
    );

    final bool avaliable = _result.data['document']['available'];
    return Future.value(avaliable);
  }

  @override
  Future<Tuple2<List<int>, String>> readDocument(
    String studentId,
    String documentHash,
  ) async {
    ArgumentError.checkNotNull(studentId, 'studentId');
    ArgumentError.checkNotNull(documentHash, 'documentHash');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = '';
    final Response<List<dynamic>> _result = await _dio.request(
      '/students/$studentId/documents/read/$documentHash',
      queryParameters: queryParameters,
      options: RequestOptions(
        method: 'POST',
        headers: <String, dynamic>{},
        extra: _extra,
        baseUrl: baseUrl,
        responseType: ResponseType.bytes,
      ),
      data: _data,
    );
    final bytes = _result.data.cast<int>();

    String filename = _result.headers.value('content-disposition');

    return Tuple2(bytes, filename);
  }
}
