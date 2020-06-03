import 'package:flutter/material.dart';
import 'package:petct/core/error/failure.dart';
import 'package:petct/core/resources/strings.dart';

class FailureToMessagesConverter {
  String convert(BuildContext context, Failure failure) {
    if (failure is PlatformFailure)
      return failure.message;
    else if (failure is ServerFailure)
      return Strings(context).messageServerFailure;
    else if (failure is NoInternetConnectionFailure)
      return Strings(context).messageNoInternetFailure;
    else if (failure is CacheFailure)
      return Strings(context).messageCacheFailure;
    else
      return Strings(context).messageUnknownError;
  }
}
