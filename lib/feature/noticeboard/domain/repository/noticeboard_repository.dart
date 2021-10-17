import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:registro_elettronico/core/infrastructure/error/failures_v2.dart';
import 'package:registro_elettronico/core/infrastructure/error/successes.dart';
import 'package:registro_elettronico/core/infrastructure/generic/resource.dart';
import 'package:registro_elettronico/feature/noticeboard/data/model/attachment/attachment_file.dart';
import 'package:registro_elettronico/feature/noticeboard/domain/model/attachment_domain_model.dart';
import 'package:registro_elettronico/feature/noticeboard/domain/model/notice_domain_model.dart';

abstract class NoticeboardRepository {
  Stream<Resource<List<NoticeDomainModel>>> watchAllNotices();

  Stream<Resource<AttachmentFile>> downloadFile({
    @required NoticeDomainModel notice,
    @required AttachmentDomainModel attachment,
  });

  Future<Either<Failure, Success>> updateNotices({
    @required bool ifNeeded,
  });
}
