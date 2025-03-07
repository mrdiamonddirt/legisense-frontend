import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'es', 'nl', 'de', 'ru', 'it'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? esText = '',
    String? nlText = '',
    String? deText = '',
    String? ruText = '',
    String? itText = '',
  }) =>
      [enText, frText, esText, nlText, deText, ruText, itText][languageIndex] ??
      '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    'icgf46if': {
      'en': 'Relevant Recent Laws',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'gs7exzr0': {
      'en': 'Law Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'eda9rzi8': {
      'en': 'Date it Passed',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '0upuw48x': {
      'en': 'Net impact',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'u89420og': {
      'en': 'View',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'za5ii17q': {
      'en': 'Law Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '59vt5u2g': {
      'en': 'Date it Passed',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'fuesh9zs': {
      'en': 'Net impact',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'f3ct0xmi': {
      'en': 'View',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'wfn02hbd': {
      'en': 'Law Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'lf89imlb': {
      'en': 'Date it Passed',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'cwkbm2d4': {
      'en': 'Net impact',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'thtwalh8': {
      'en': 'View',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '4bqfhouj': {
      'en': 'Law Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'aeozwq2k': {
      'en': 'Date it Passed',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '8owjiakj': {
      'en': 'Net impact',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'caacguhm': {
      'en': 'View',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'cboy8wdr': {
      'en': 'Law Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '7g0otlj5': {
      'en': 'Date it Passed',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '56w5j6or': {
      'en': 'Net impact',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'g4ovonlf': {
      'en': 'View',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'jsslb2im': {
      'en': 'Law Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'xa8dy1xc': {
      'en': 'Date it Passed',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'lvtxamrb': {
      'en': 'Net impact',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'a5i4t0t0': {
      'en': 'View',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'bgv4zc98': {
      'en': 'Search All Laws',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // entry
  {
    '0pfnonki': {
      'en': 'LegiSense',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'v3nnl4n0': {
      'en': 'Please complete the information below.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'sjjwkspm': {
      'en': 'Email',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'xe9k87e7': {
      'en': 'Password',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'bohozzmp': {
      'en': 'Forgot Password?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'cr4ibjb8': {
      'en': 'Log in ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'dmoigz0f': {
      'en': 'Or sign in with',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '7yaubi4r': {
      'en': 'Continue with Google',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'f2go8csa': {
      'en': 'Continue with Apple',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'bi85omnj': {
      'en': 'Don\'t have an account?  ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'mb5a6hpr': {
      'en': 'Sign Up Here',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'vtk71avo': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // emailVerification
  {
    'cjmzzqgm': {
      'en': 'Email Verification',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '6gr2xr40': {
      'en':
          'Please check your email for a link. Check your spam folder as well.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'znt6hx1e': {
      'en': 'Send',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'y1x9rsxz': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // signUp
  {
    'f8j47sc0': {
      'en': 'Sign up',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'u1ixgctt': {
      'en': 'Please fill the following information:',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'fvhx0g22': {
      'en': 'Email',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'x7yw5ppe': {
      'en': 'Password',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'ekagwsab': {
      'en': 'Confirm Password',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'puhmagmo': {
      'en': 'Sign up',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'zbc12g6r': {
      'en': 'Already a User? ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'dqpdadti': {
      'en': 'Log in',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'hepjwq9u': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // dateOfBirth
  {
    '1frnq0s2': {
      'en': 'Please state your age',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'rvy3yqw7': {
      'en': 'Age',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'ybzzwwsj': {
      'en': 'Confirm',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'i0nmxcbh': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // loggingIn
  {
    'f6hajlt7': {
      'en': 'Logging in',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '73muoz7n': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // welcome
  {
    '4gg4dp4r': {
      'en': 'Submitted!',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'o8tece4l': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '86ryte54': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // forgotPassword
  {
    'omnhrrrb': {
      'en': 'Forgot Password',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '1u1p8ks2': {
      'en': 'Please enter your email below.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'd26sv009': {
      'en': 'Email',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'y8j3ngrd': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '5997687h': {
      'en': 'Remember your password? ',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'j39j2u4c': {
      'en': 'Log in',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '43zyrd76': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // chat
  {
    'rkowl09j': {
      'en': 'Prompt Suggestions:',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'zk2dzqjc': {
      'en': 'What is the current tax policy for my income range?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'lh2xrhxu': {
      'en': 'What is the Magna Carta?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'gbwj1cg8': {
      'en': 'Who makes the laws in my government?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'rquq75x1': {
      'en': 'Copy response',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '1gkudsux': {
      'en': 'Type something...',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // questionairre
  {
    'kcl1803e': {
      'en': 'Questionairre',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'acj80sci': {
      'en': 'Please fill the following information:',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'h9g55r4g': {
      'en': 'Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '5wi5osx7': {
      'en': 'Country',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'vgfvyb4c': {
      'en': 'State',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'hyulkle0': {
      'en': 'County',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'o5mdh2yf': {
      'en': 'City',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'esscpqig': {
      'en': '<\$10K',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '3y2chiyz': {
      'en': '\$10K-50K',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    's3pjjjq6': {
      'en': '\$51K-100K',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'ntwx6g2r': {
      'en': '\$101K-200K',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '14hu4qb6': {
      'en': '\$201K-300K',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'zk61tzqq': {
      'en': '\$301K-500K',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'd9hx7ft3': {
      'en': '\$501K+',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'lr4o654c': {
      'en': 'What\'s your income range?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'w45nl5i8': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'vtff0ny1': {
      'en': 'Caucasian',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '131dpe1e': {
      'en': 'Latin American / Hispanic',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'kdvwbe7u': {
      'en': 'African',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    't646qyop': {
      'en': 'East Asian',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    've8kshkj': {
      'en': 'South Asian',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'm6jlgjf7': {
      'en': 'Middle Easterrn',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '45u0lyyp': {
      'en': 'Central Asian',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'ug3vlu99': {
      'en': 'What\'s your race?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'p08yzmel': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'isb635t1': {
      'en': 'Are you a student?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'ypt3q6nd': {
      'en': 'Yes',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'sectt81o': {
      'en': 'No',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'p72fdazm': {
      'en': 'Are you a Parent?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '7bwlmfta': {
      'en': 'Yes',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '5l6023bw': {
      'en': 'No',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '3dt4gp9d': {
      'en': 'Do you live alone?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '8b5exaol': {
      'en': 'Yes',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '7cj1pwcu': {
      'en': 'No',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'cjqmkuz1': {
      'en': 'Are you Employed?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'pqbuue5a': {
      'en': 'Yes',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'yusjwugo': {
      'en': 'No',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'pb7osbp5': {
      'en': 'Are you a Religious?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'isr0x5jc': {
      'en': 'Yes',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'iulxes45': {
      'en': 'No',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'kjlxj4f8': {
      'en': 'Are you in politics?',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '4uf6hpsd': {
      'en': 'Yes',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'lq11djzh': {
      'en': 'No',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'ypvjhjit': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'k2u2254b': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // settings
  {
    '4y0ode73': {
      'en': 'Settings',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'zoqvuskm': {
      'en': 'Account Settings',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'n6vfkvsn': {
      'en': 'Help Center',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'w2oqdbq4': {
      'en': 'Notifications',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'dchzer70': {
      'en': 'User Interface',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '8svf2ajp': {
      'en': 'Log out',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'wh1v4oya': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // notifications
  {
    'e7c8gtfk': {
      'en': 'Notifications',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '2b5nmrwk': {
      'en':
          'Please manage your notification settings according to your personal preferances.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'c93yf841': {
      'en': 'Push Notifications',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'wpc0rrkw': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'd8832y40': {
      'en': 'Email Notifications',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'kdponjtx': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'kyskiq18': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // userInterface
  {
    'sguuun1l': {
      'en': 'User Interface',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '5yr7sicv': {
      'en': 'Please select your user interface preferences.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '663gv1so': {
      'en': 'Display Mode',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '4tkkc7xp': {
      'en': 'Dark Mode',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'ki2y47cx': {
      'en': 'Light Mode',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'bnd0u3gv': {
      'en': 'Language',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'y778xsi1': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // search
  {
    'ewx2rk9m': {
      'en': 'Law Search',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '2558h8bj': {
      'en': 'Search',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'yrpwks6i': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // singleLaw
  {
    '4qxp5a6r': {
      'en': 'Law Name',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'mjfk1jks': {
      'en': 'Download PDF',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '3d3aask7': {
      'en': 'Download the PDF file of the law',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'a2mcr1jz': {
      'en': 'Download',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '4szity38': {
      'en': 'Law Summary',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'hc89gip7': {
      'en': 'Summarizing the law.',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'vg553u1n': {
      'en': 'Complexity Score',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'o65si70m': {
      'en': '11',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'jnnqixhr': {
      'en': 'Search All Laws',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
  // Miscellaneous
  {
    'ukuhes2v': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'scj8t84o': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'x5a7on8g': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'tzwvt0lz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'f38eoa9o': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'e6fsb0do': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'acfzyegw': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'v5rewnsu': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '5gjgs3b9': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '4jgeobst': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'fwutwpvk': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'tbzpqcs5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'hiwv306r': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'hdswlxuz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'zhibxi7w': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'rvm6h4zf': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'pwwwajbr': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'p3fv6zkq': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '60owdsmj': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'poq2rotr': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'uu3725z3': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    'nwli9uxu': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
    '94rjgkqa': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'nl': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
