import 'package:get/get.dart';

import 'locale_ar.dart';
import 'locale_en.dart';


class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'ar_SA': ar
  };
}
