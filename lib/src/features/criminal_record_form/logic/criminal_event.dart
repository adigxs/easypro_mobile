// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_pro/src/datasource/models/criminal_record_request.dart';
import 'package:easy_pro/src/datasource/models/file_upload.dart';

abstract class CriminalEvent {}

class CreateCriminalRecord extends CriminalEvent {
  final CriminalRecordRequest criminalRecordRequest;
  CreateCriminalRecord({
    required this.criminalRecordRequest,
  });
}

class OnUploadFile extends CriminalEvent {
  final FileUpload fileUpload;
  OnUploadFile({
    required this.fileUpload,
  });
}

class DownloadPdf extends CriminalEvent {
  DownloadPdf();
}
