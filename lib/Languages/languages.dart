import 'package:en_passant/Languages/arLanguage.dart';
import 'package:en_passant/Languages/enLanguage.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
@override
Map<String, Map<String, String>> get keys => {
'ar_EG': ArLanguage().arLanguage,
'en_US': EnLanguage().enLanguage,
};
}