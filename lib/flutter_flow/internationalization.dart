import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

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
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Logo
  {
    '22epcpqw': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // LoginSingUp
  {
    's1redc8l': {
      'pt': 'Entrar',
      'en': 'Login',
    },
    '2g3qo903': {
      'pt': 'Já tem uma conta? Faça login abaixo:',
      'en': 'Already have an account? Log in below:',
    },
    'a4i7bfog': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    'nw6zrolr': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'xcsbs0dv': {
      'pt': 'Entrar',
      'en': 'Login',
    },
    '5h04zhjp': {
      'pt': 'Esqueci minha senha',
      'en': '',
    },
    'f3ur3fcy': {
      'pt': 'Cadastro',
      'en': 'Register',
    },
    'p79jyqha': {
      'pt': 'Ainda não tem uma conta? Por favor, preencha os campos:',
      'en': 'Don\'t have an account yet? Please fill in the fields:',
    },
    'fnuha20z': {
      'pt': 'Nome de Usuário',
      'en': 'E-mail',
    },
    '1x0gx5m6': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    'ldzny6c0': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'koci2fx6': {
      'pt': 'Confirmar Senha',
      'en': 'Confirm Password',
    },
    'c0vdlzxb': {
      'pt': 'Criar Conta',
      'en': 'Create Account',
    },
    'tckwee96': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Configurcao
  {
    'j4s7inj5': {
      'pt': 'Nome usuário',
      'en': 'User name',
    },
    't7v06xa6': {
      'pt': 'Mudar para modo escuro',
      'en': 'Switch to dark mode',
    },
    'gu294188': {
      'pt': 'Mudar para modo claro',
      'en': 'Switch to light mode',
    },
    'vg6okgqq': {
      'pt': 'Alterar Idioma',
      'en': 'Change Language',
    },
    'dn2bhpkh': {
      'pt': 'Condiguração da conta',
      'en': 'Account configuration',
    },
    'np5ppyxs': {
      'pt': 'Alterar nome de usuário',
      'en': 'Change username',
    },
    '84q4dv87': {
      'pt': 'Deletar conta',
      'en': 'Delete account',
    },
    'vi73dhok': {
      'pt': 'Sair',
      'en': 'To go out',
    },
    'dnkhe2wl': {
      'pt': 'Meus dados',
      'en': 'My data',
    },
    'unhm88fh': {
      'pt': '__',
      'en': '__',
    },
  },
  // inicial
  {
    '899y2kmb': {
      'pt': 'Bem vindo, usuário',
      'en': '',
    },
    '8i36ce6h': {
      'pt': 'Procure em suas listas...',
      'en': '',
    },
    'zm9ekyk5': {
      'pt': 'Home',
      'en': '',
    },
  },
  // lista
  {
    'kehnl0bk': {
      'pt': 'Titulo:',
      'en': 'Title:',
    },
    '7a1mmb0d': {
      'pt': 'Comece a escrever:',
      'en': 'Start writing:',
    },
    'h4pw3uqz': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'sgvvuaao': {
      'pt': '',
      'en': '',
    },
    'rrfgopku': {
      'pt': '',
      'en': '',
    },
    'xkp84m19': {
      'pt': '',
      'en': '',
    },
    'qg81xsu5': {
      'pt': '',
      'en': '',
    },
    'lqelnatx': {
      'pt': '',
      'en': '',
    },
    '30bi4pup': {
      'pt': '',
      'en': '',
    },
    'awduqqbj': {
      'pt': '',
      'en': '',
    },
    't2ofwg5f': {
      'pt': '',
      'en': '',
    },
    '0yu55uzq': {
      'pt': '',
      'en': '',
    },
    'hvjfjv3x': {
      'pt': '',
      'en': '',
    },
    'kn6w305u': {
      'pt': '',
      'en': '',
    },
    'i61t1h11': {
      'pt': '',
      'en': '',
    },
    'bwxlsh8i': {
      'pt': '',
      'en': '',
    },
    'd2d00it0': {
      'pt': '',
      'en': '',
    },
    'pqnake2s': {
      'pt': '',
      'en': '',
    },
    'lliawv1b': {
      'pt': '',
      'en': '',
    },
    '8o2cmfxv': {
      'pt': '',
      'en': '',
    },
    '7k2sj7je': {
      'pt': '',
      'en': '',
    },
    'mb0khpua': {
      'pt': '',
      'en': '',
    },
    'qvtv5e9b': {
      'pt': '',
      'en': '',
    },
    'vblxemzp': {
      'pt': '',
      'en': '',
    },
    'fs08dzzo': {
      'pt': '',
      'en': '',
    },
    'q4el8hnx': {
      'pt': '',
      'en': '',
    },
    '2gezn67w': {
      'pt': '',
      'en': '',
    },
    'mnx67rkx': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
