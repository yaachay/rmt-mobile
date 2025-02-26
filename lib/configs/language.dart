import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String _rkLang = 'ရခိုင်ဘာသာ';
  String get rkLang => _rkLang;
  String _myLang = 'မြန်မာဘာသာ';
  String get myLang => _myLang;
  String _rkHint = 'ရခိုင်ဘာသာဖြင့်ရေးပါ။';
  String get rkHint => _rkHint;
  String _myHint = 'မြန်မာဘာသာဖြင့်ရေးပါ။';
  String get myHint => _myHint;
  String _recentHistory = 'မကြာသေးမှီက';
  String get recentHistory => _recentHistory;
  String _version = 'ဗားရှင်း';
  String get version => _version;
  String _copy = 'ကူးယူသည်';
  String get copy => _copy;
  String _copyAll = 'အားလုံးကူးယူသည်';
  String get copyAll => _copyAll;
  String _paste = 'ကူးထည့်သည်';
  String get paste => _paste;
  String _speak = 'စကားပြောသည်';
  String get speak => _speak;
  String _favourite = 'နှစ်သက်သည်';
  String get favourite => _favourite;
  String _Favourite = 'နှစ်သက်မှု';
  String get Favourite => _Favourite;
  String _cancel = 'ပယ်ဖျက်သည်';
  String get cancel => _cancel;
  String _home = 'ပင်မ';
  String get home => _home;
  String _favourites = 'နှစ်သက်မှုများ';
  String get favourites => _favourites;
  String _settings = 'ဆက်တင်များ';
  String get settings => _settings;
  String _shareApp = 'အက်ပ်ကိုမျှဝေရန်ကို';
  String get shareApp => _shareApp;
  String _aboutUs = 'ကျွန်ုပ်တို့အကြောင်း';
  String get aboutUs => _aboutUs;
  String _feedback = 'အကြံပေးရန်';
  String get feedback => _feedback;
  String _removeThisItem = 'ဒီပစ္စည်းကို ဖက်ရှားပါ။';
  String get removeThisItem => _removeThisItem;
  String _language = 'ဘာသာစကား';
  String get language => _language;
  String _chooseLanguageAsYouLike = 'သင်ကြိုက်နှစ်သက်ရာ ဘာသာကို‌ရွေးပါ။';
  String get chooseLanguageAsYouLike => _chooseLanguageAsYouLike;
  String _myanmar = 'မြန်မာ';
  String get myanmar => _myanmar;
  String _english = 'English';
  String get english => _english;
  String _theme = 'အပြင်အဆင်';
  String get theme => _theme;
  String _chooseThemeAsYouLike = 'သင်ကြိုက်နှစ်သက်ရာ အပြင်အဆင်ကိုရွေးပါ။';
  String get chooseThemeAsYouLike => _chooseThemeAsYouLike;
  String _systemDefault = 'စနစ်အပြင်အဆင်';
  String get systemDefault => _systemDefault;
  String _lightTheme = 'အလင်းအပြင်အဆင်';
  String get lightTheme => _lightTheme;
  String _darkTheme = 'အမှောင်အပြင်အဆင်';
  String get darkTheme => _darkTheme;
  String _history = 'မှတ်တမ်း';
  String get history => _history;
  String _clearAllHistories = 'မှတ်တမ်းအားလုံးကို ရှင်းလင်းပါ။';
  String get clearAllHistories => _clearAllHistories;
  String _deleteAllFavourite = 'နှစ်သက်မှုအားလုံးကို ဖျက်ထုတ်ပါ။';
  String get deleteAllFavourite => _deleteAllFavourite;
  String _areYouSure = 'သေချာသွားပြီလား။';
  String get areYouSure => _areYouSure;
  String _areYouSureToClearAllHistories =
      'မှတ်တမ်းအားလုံးကို ရှင်းလင်းဖို့သေချာသွားပြီလား။';
  String get areYouSureToClearAllHistories => _areYouSureToClearAllHistories;
  String _areYouSureToDeleteAllFavourite =
      'နှစ်သက်မှုအားလုံးကို ဖျက်ထုတ်ဖို့သေချာသွားပြီးလား။';
  String get areYouSureToDeleteAllFavourite => _areYouSureToDeleteAllFavourite;
  String _clear = 'ရှင်းလင်းရန်';
  String get clear => _clear;
  String _delete = 'ဖျက်ထုတ်ရန်';
  String get delete => _delete;
  String _sure = 'သေချာပါသည်';
  String get sure => _sure;
  String _scanToDownloadApp = 'အက်ပ်ကို ဒေါင်းလုဒ်ရင် စကင်ဖတ်ပါ။';
  String get scanToDownloadApp => _scanToDownloadApp;
  String _checkForUpdate = 'ဗားရှင်းအသစ်စစ်ဆေးရန်';
  String get checkForUpdate => _checkForUpdate;
  String _shareAppFor = 'အက်ပ်ကိုမျှဝေရန်';
  String get shareAppFor => _shareAppFor;
  String _members = 'အဖွဲ့ဝင်များ';
  String get members => _members;
  String _purpose = 'ရည်ရွယ်ချက်';
  String get purpose => _purpose;
  String _contactMeOn = 'ကျွန်ုပ်ကို ဆက်သွယ်ရန်';
  String get contactMeOn => _contactMeOn;
  LanguageProvider() {
    loadLanguage();
  }
  void loadLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langString = prefs.getString('lang');
    Languages? lang = langString != null
        ? Languages.values.firstWhere(
            (e) => e.toString() == langString,
            orElse: () => Languages.myanmar,
          )
        : null;
    if (lang == Languages.english) {
      _rkLang = 'Rakhine';
      _myLang = 'Myanmar';
      _rkHint = 'Type in Rakhine';
      _myHint = 'Type in Myanmar';
      _recentHistory = 'Recent History';
      _version = 'version';
      _copy = 'copy';
      _copyAll = 'copy-all';
      _paste = 'paste';
      _speak = 'speak';
      _favourite = 'favourite';
      _Favourite = 'Favourite';
      _cancel = 'cancel';
      _home = 'Home';
      _favourites = 'Favourites';
      _settings = 'Settings';
      _shareApp = 'Share App';
      _aboutUs = 'About Us';
      _feedback = 'Feedback';
      _removeThisItem = 'Remove this Item.';
      _language = 'Language';
      _chooseLanguageAsYouLike = 'Choose language as you like.';
      _myanmar = 'မြန်မာ';
      _english = 'English';
      _theme = 'Theme';
      _chooseThemeAsYouLike = 'Choose theme as you like.';
      _systemDefault = 'System default';
      _lightTheme = 'Light theme';
      _darkTheme = 'Dark theme';
      _history = 'History';
      _clearAllHistories = 'Clear all histories.';
      _deleteAllFavourite = 'Delete all favourites';
      _areYouSure = 'Are you sure?';
      _areYouSureToClearAllHistories = 'Are you sure to clear all histories?';
      _areYouSureToDeleteAllFavourite = 'Are you sure to delete all favourite?';
      _clear = 'Clear';
      _delete = 'Delete';
      _sure = 'Sure';
      _scanToDownloadApp = 'Scan to download app.';
      _checkForUpdate = 'Check for update';
      _shareAppFor = 'Share app for :';
      _members = 'Members';
      _purpose = 'Purpose';
      _contactMeOn = 'Contact me on:';
    } else {
      _rkLang = 'ရခိုင်ဘာသာ';
      _myLang = 'မြန်မာဘာသာ';
      _rkHint = 'ရခိုင်ဘာသာဖြင့်ရေးပါ။';
      _myHint = 'မြန်မာဘာသာဖြင့်ရေးပါ။';
      _recentHistory = 'မကြာသေးမှီက';
      _version = 'ဗားရှင်း';
      _copy = 'ကူးယူသည်';
      _copyAll = 'အားလုံးကူးယူသည်';
      _paste = 'ကူးထည့်သည်';
      _speak = 'စကားပြောသည်';
      _favourite = 'နှစ်သက်သည်';
      _Favourite = 'နှစ်သက်မှု';
      _cancel = 'ပယ်ဖျက်သည်';
      _home = 'ပင်မ';
      _favourites = 'နှစ်သက်မှုများ';
      _settings = 'ဆက်တင်များ';
      _shareApp = 'အက်ပ်ကိုမျှဝေရန်ကို';
      _aboutUs = 'ကျွန်ုပ်တို့အကြောင်း';
      _feedback = 'အကြံပေးရန်';
      _removeThisItem = 'ဒီပစ္စည်းကို ဖက်ရှားပါ။';
      _language = 'ဘာသာစကား';
      _chooseLanguageAsYouLike = 'သင်ကြိုက်နှစ်သက်ရာ ဘာသာကို‌ရွေးပါ။';
      _myanmar = 'မြန်မာ';
      _english = 'English';
      _theme = 'အပြင်အဆင်';
      _chooseThemeAsYouLike = 'သင်ကြိုက်နှစ်သက်ရာ အပြင်အဆင်ကိုရွေးပါ။';
      _systemDefault = 'စနစ်အပြင်အဆင်';
      _lightTheme = 'အလင်းအပြင်အဆင်';
      _darkTheme = 'အမှောင်အပြင်အဆင်';
      _history = 'မှတ်တမ်း';
      _clearAllHistories = 'မှတ်တမ်းအားလုံးကို ရှင်းလင်းပါ။';
      _deleteAllFavourite = 'နှစ်သက်မှုအားလုံးကို ဖျက်ထုတ်ပါ။';
      _areYouSure = 'သေချာသွားပြီလား။';
      _areYouSureToClearAllHistories =
          'မှတ်တမ်းအားလုံးကို ရှင်းလင်းဖို့သေချာသွားပြီလား။';
      _areYouSureToDeleteAllFavourite =
          'နှစ်သက်မှုအားလုံးကို ဖျက်ထုတ်ဖို့သေချာသွားပြီးလား။';
      _clear = 'ရှင်းလင်းရန်';
      _delete = 'ဖျက်ထုတ်ရန်';
      _sure = 'သေချာပါသည်';
      _scanToDownloadApp = 'အက်ပ်ကို ဒေါင်းလုဒ်ရင် စကင်ဖတ်ပါ။';
      _checkForUpdate = 'ဗားရှင်းအသစ်စစ်ဆေးရန်';
      _shareAppFor = 'အက်ပ်ကိုမျှဝေရန်';
      _members = 'အဖွဲ့ဝင်များ';
      _purpose = 'ရည်ရွယ်ချက်';
      _contactMeOn = 'ကျွန်ုပ်ကို ဆက်သွယ်ရန်';
    }
    notifyListeners();
  }

  Future<void> setLanguage(Languages lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', lang.toString());
    notifyListeners();
  }
}
