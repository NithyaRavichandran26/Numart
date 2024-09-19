import 'dart:developer';

debugLog({String tag = '', required dynamic value}) {
  if (true) {
    log("TAG $tag : ${'--------'+value.toString()}");
  }
}