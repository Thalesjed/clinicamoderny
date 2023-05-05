import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

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
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

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
  // loginPage
  {
    '0ifq2zqv': {
      'en': 'Login',
      'pt': 'Login',
    },
    '6021f6ax': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'dp7dkd1g': {
      'en': 'Enter your email...',
      'pt': 'Digite seu e-mail...',
    },
    '739j2y4x': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'idp6dtpb': {
      'en': 'Enter your password...',
      'pt': 'Coloque sua senha...',
    },
    '5wv6pm2y': {
      'en': 'Login',
      'pt': 'Conecte-se',
    },
    'rfbs4vc1': {
      'en': 'Sign in with Google',
      'pt': 'Faça login no Google',
    },
    'l4czlviw': {
      'en': 'Forgot Password',
      'pt': 'Esqueceu sua senha',
    },
    'zm34wa6q': {
      'en': 'Continue as Guest',
      'pt': 'Continuar como convidado',
    },
    'pp3fy8b1': {
      'en': 'Register',
      'pt': 'Cadastro',
    },
    '7o5pi737': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'xg3j15im': {
      'en': 'Enter your email...',
      'pt': 'Digite seu e-mail...',
    },
    'mdaz1yhz': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'w11nnquo': {
      'en': 'Enter your password...',
      'pt': 'Coloque sua senha...',
    },
    'j4ohzjgj': {
      'en': 'Confirm Password',
      'pt': 'Confirme sua senha',
    },
    'gcxl1x7m': {
      'en': 'Enter your password...',
      'pt': 'Coloque sua senha...',
    },
    'wscsj6vo': {
      'en': 'Create Account',
      'pt': 'Criar uma conta',
    },
    'h240zhas': {
      'en': 'Continue as Guest',
      'pt': 'Continuar como convidado',
    },
    'shxip636': {
      'en': 'Sign in with Google',
      'pt': 'Faça login no Google',
    },
    'uxy785qf': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // completeProfile
  {
    'bylhkcsf': {
      'en': 'Complete Profile',
      'pt': 'Perfil Completo',
    },
    'dos2vqf3': {
      'en': 'Upload a photo for us to easily identify you.',
      'pt':
          'Carregue uma foto para que possamos identificá-lo facilmente na recpção',
    },
    'hzufnrwj': {
      'en': 'Your Name',
      'pt': 'Seu nome',
    },
    '0lnl1xb4': {
      'en': 'Please enter a valid name...',
      'pt': 'Por favor insira um nome válido...',
    },
    'cge36xva': {
      'en': 'Your Age',
      'pt': 'Sua idade',
    },
    'qlwhtd0y': {
      'en': 'i.e. 34',
      'pt': 'ou seja, 34',
    },
    'zkjlchm8': {
      'en': 'Allergies',
      'pt': 'Alergias',
    },
    'cph04i8i': {
      'en': 'What types of allergies do you have..',
      'pt': 'Que tipo de alergia você tem..',
    },
    'bri0utxx': {
      'en': 'Your Birth Sex',
      'pt': 'Seu sexo de nascimento',
    },
    '17t9zkr2': {
      'en': 'Male',
      'pt': 'Macho',
    },
    'yto9y5vl': {
      'en': 'Female',
      'pt': 'Fêmea',
    },
    '6vgcrdx6': {
      'en': 'Undisclosed',
      'pt': 'Não divulgado',
    },
    'gakcujvq': {
      'en': 'Add Another Profile',
      'pt': 'Adicionar outro perfil',
    },
    '8r40x1s6': {
      'en': 'Complete Profile',
      'pt': 'Perfil Completo',
    },
    'tufnpvss': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // forgotPassword
  {
    'e6rkuok9': {
      'en': 'Forgot Password',
      'pt': 'Esqueceu sua senha',
    },
    '7vb3uert': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'pt':
          'Digite o e-mail associado à sua conta e enviaremos um código de verificação.',
    },
    'ol8laorp': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'all56uwr': {
      'en': 'Enter your email...',
      'pt': 'Digite seu e-mail...',
    },
    'xnu1d6m6': {
      'en': 'Send Reset Link',
      'pt': 'Enviar link de redefinição',
    },
    '6l6df1rq': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // addAnotherProfile
  {
    'e2lkqu60': {
      'en': 'Add Another Profile',
      'pt': 'Adicionar outro perfil',
    },
    'uwe0wh7z': {
      'en': 'Upload a photo for us to easily identify this person.',
      'pt': 'Carregue uma foto para identificarmos facilmente essa pessoa.',
    },
    'gu0xsuwy': {
      'en': 'Persons Name',
      'pt': 'Nome da pessoa',
    },
    '3a3n76w9': {
      'en': 'Official name here...',
      'pt': 'Nome oficial aqui...',
    },
    'aihzc6p8': {
      'en': 'Persons Age',
      'pt': 'Pessoas Idade',
    },
    'gbiw507m': {
      'en': 'i.e. 34',
      'pt': 'ou seja, 34',
    },
    '1qftgnmz': {
      'en': 'Personal allergies',
      'pt': 'Alergias pessoais',
    },
    '40idm7sp': {
      'en': 'What types of allergies do they have..',
      'pt': 'Que tipos de alergias eles têm..',
    },
    'vtaomusg': {
      'en': 'Email',
      'pt': 'Email',
    },
    'bk2d3knp': {
      'en': 'Please enter a valid email...',
      'pt': 'Por favor digite um email válido...',
    },
    'cce8eipk': {
      'en': 'Persons Birth Sex',
      'pt': 'Pessoas Nascimento Sexo',
    },
    '3495yta9': {
      'en': 'Male',
      'pt': 'Macho',
    },
    'dbwqh7tf': {
      'en': 'Female',
      'pt': 'Fêmea',
    },
    'wk4h2mcs': {
      'en': 'Undisclosed',
      'pt': 'Não divulgado',
    },
    'djd2cjl9': {
      'en': 'Complete Profile',
      'pt': 'Perfil Completo',
    },
    'edz8mfte': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // onboarding
  {
    '2qzampb5': {
      'en': 'Stay in Touch',
      'pt': 'Manter contato',
    },
    '8uz7x74e': {
      'en': 'Always have your medical office at your fingertips.',
      'pt': 'Tenha sempre o seu consultório médico ao seu alcance.',
    },
    '0j40h5bw': {
      'en': 'Schedule Appointments',
      'pt': 'Agendar Compromissos',
    },
    'i9v14knc': {
      'en':
          'Easily schedule appointments for checkups,  routine procedures, etc.',
      'pt':
          'Agende facilmente consultas para exames, procedimentos de rotina, etc.',
    },
    'qfjmnptg': {
      'en': 'Doctor in your pocket',
      'pt': 'Doutor no seu bolso',
    },
    'gveeqc4e': {
      'en': 'Easily find symptoms and common factors that affect you daily.',
      'pt':
          'Encontre facilmente sintomas e fatores comuns que o afetam diariamente.',
    },
    'zh5kokct': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
    'lu8nyysd': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // homePage
  {
    'qu7hjdkw': {
      'en': 'Good Morning',
      'pt': 'Bom dia',
    },
    'pwtc8fef': {
      'en': 'Your next appointment',
      'pt': 'Seu próximo compromisso',
    },
    'eg60iny5': {
      'en': 'For',
      'pt': 'Para',
    },
    'xajmetne': {
      'en': 'Book Appointment',
      'pt': 'Anotação de livro',
    },
    'byhozu5x': {
      'en': 'Schedule an appointment with our licensed professional.',
      'pt': 'Agende uma consulta com nosso profissional licenciado.',
    },
    'tcodfur0': {
      'en': 'Call the Office',
      'pt': 'Ligue para o escritório',
    },
    's3rq41ta': {
      'en': 'Give us a call in order to schedule your appointment.',
      'pt': 'Ligue para nós para agendar seu horário.',
    },
    'l0v1pwsr': {
      'en': 'Email Us',
      'pt': 'Envia-nos um email',
    },
    '5i9spsgj': {
      'en': 'Send us an email and we will get back to you within 2 days.',
      'pt': 'Envie-nos um e-mail e retornaremos em até 2 dias.',
    },
    'lpqpkg99': {
      'en': '•',
      'pt': '•',
    },
  },
  // myAppointments
  {
    '6busbwr7': {
      'en': 'Appointments',
      'pt': 'Compromissos',
    },
    'kpg2w0jm': {
      'en': 'My Appointments',
      'pt': 'Meus compromissos',
    },
    'dyy2dhlp': {
      'en': '•',
      'pt': '•',
    },
  },
  // appointmentDetails
  {
    'rl38mvhg': {
      'en': 'Details',
      'pt': 'Detalhes',
    },
    'l329nlet': {
      'en': 'Type of Appointment',
      'pt': 'Tipo de compromisso',
    },
    '1uef921m': {
      'en': 'What’s the problem?',
      'pt': 'Qual é o problema?',
    },
    'g7jl8c33': {
      'en': 'For',
      'pt': 'Para',
    },
    'sa4fd2nj': {
      'en': 'When',
      'pt': 'Quando',
    },
    '8gx9op76': {
      'en': 'Reschedule',
      'pt': 'reagendar',
    },
    'i6135g6a': {
      'en': 'Cancel Appointment',
      'pt': 'Cancela o agendamento',
    },
    'cnewglmj': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // profilePage
  {
    '1mron0hx': {
      'en': 'Ailments',
      'pt': 'Doenças',
    },
    '3dfut72l': {
      'en': 'Next Appointment',
      'pt': 'Próximo compromisso',
    },
    'gwbuecc3': {
      'en': 'Aug 20, 2021',
      'pt': '20 de agosto de 2021',
    },
    'pxnx8w2l': {
      'en': 'Switch to Dark Mode',
      'pt': 'Alternar para o modo escuro',
    },
    'reou4og9': {
      'en': 'Switch to Light Mode',
      'pt': 'Alternar para o modo claro',
    },
    'jcuzpl8b': {
      'en': 'Past Appointments',
      'pt': 'Compromissos passados',
    },
    '8dyf7o0b': {
      'en': 'For',
      'pt': 'Para',
    },
    '35c1o73k': {
      'en': '•',
      'pt': '•',
    },
  },
  // editProfile
  {
    'gowktm51': {
      'en': 'Edit Profile',
      'pt': 'Editar Perfil',
    },
    '1puqb183': {
      'en': 'Change Photo',
      'pt': 'Mudar foto',
    },
    'tf0ub3qx': {
      'en': 'Your Name',
      'pt': 'Seu nome',
    },
    '8dcq497j': {
      'en': 'Please enter a valid number...',
      'pt': 'Por favor insira um número válido...',
    },
    '6uxi6ydm': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'o86n9qel': {
      'en': 'Your email',
      'pt': 'Seu email',
    },
    'bg9wzfe4': {
      'en': 'Your Age',
      'pt': 'Sua idade',
    },
    'l2eo7542': {
      'en': 'i.e. 34',
      'pt': 'ou seja, 34',
    },
    '9h691o1i': {
      'en': 'Ailments',
      'pt': 'Alergias',
    },
    'pnbts3j4': {
      'en': 'What types of allergies do you have..',
      'pt': 'Que tipo de alergia você tem..',
    },
    'jkwqfjdl': {
      'en': 'Your Birth Sex',
      'pt': 'Seu sexo de nascimento',
    },
    'tgf8cvo3': {
      'en': 'Male',
      'pt': 'Macho',
    },
    '3xh5aebm': {
      'en': 'Female',
      'pt': 'Fêmea',
    },
    'otbjb5pj': {
      'en': 'Undisclosed',
      'pt': 'Não divulgado',
    },
    '3gjm7bay': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
    'nmnvto6v': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // sintomasECuras
  {
    'ajlpe5we': {
      'en': 'Symptoms',
      'pt': 'Sintomas',
    },
    '62z9dwk5': {
      'en': '•',
      'pt': '•',
    },
  },
  // appointmentDetailsProfile
  {
    'mfkswdi1': {
      'en': 'Details',
      'pt': 'Detalhes',
    },
    'ud5w8a7c': {
      'en': 'Type of Appointment',
      'pt': 'Tipo de compromisso',
    },
    'x675liz5': {
      'en': 'What’s the problem?',
      'pt': 'Qual é o problema?',
    },
    'l651wy7a': {
      'en': 'For',
      'pt': 'Para',
    },
    '17thknpf': {
      'en': 'When',
      'pt': 'Quando',
    },
    '7g467f1n': {
      'en': 'Remove Appointment',
      'pt': 'Remover compromisso',
    },
    '5tk0h132': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // bookAppointment
  {
    'y2oy7ykc': {
      'en': 'Book Appointment',
      'pt': 'Anotação de livro',
    },
    'uozlphud': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'pt':
          'Preencha os dados abaixo para agendar sua consulta em nosso escritório.',
    },
    'ibosesf8': {
      'en': 'Emails will be sent to:',
      'pt': 'Os e-mails serão enviados para:',
    },
    '5oj0ab7h': {
      'en': 'Booking For',
      'pt': 'Reserva para',
    },
    'bur8g2qh': {
      'en': 'Doctors Visit',
      'pt': 'visita de médicos',
    },
    'zczqcl1n': {
      'en': 'Routine Checkup',
      'pt': 'Checagem de rotina',
    },
    'tajo15ug': {
      'en': 'Scan/Update',
      'pt': 'Escanear/atualizar',
    },
    'tikonvss': {
      'en': 'Type of Appointment',
      'pt': 'Tipo de compromisso',
    },
    'n9mbcl9b': {
      'en': 'What\'s the problem?',
      'pt': 'Qual é o problema?',
    },
    '96ayiiog': {
      'en': 'Choose Date & Time',
      'pt': 'Escolha Data e Hora',
    },
    '1z70uy4i': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'zekm0efb': {
      'en': 'Book Now',
      'pt': 'Agende agora',
    },
  },
  // bookingOld
  {
    '0dix2muz': {
      'en': 'Book Appointment',
      'pt': 'Anotação de livro',
    },
    '6bd3y9f9': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'pt':
          'Preencha os dados abaixo para agendar sua consulta em nosso escritório.',
    },
    'utqx47rq': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    '101i8dmf': {
      'en': 'Booking For',
      'pt': 'Reserva para',
    },
    '1gml79p9': {
      'en': 'Doctors Visit',
      'pt': 'visita de médicos',
    },
    '69eydvnj': {
      'en': 'Routine Checkup',
      'pt': 'Checagem de rotina',
    },
    '5knuip1p': {
      'en': 'Scan/Update',
      'pt': 'Escanear/atualizar',
    },
    'm5z96p8t': {
      'en': 'Type of Appointment',
      'pt': 'Tipo de compromisso',
    },
    't4kx24z9': {
      'en': 'What\'s the problem?',
      'pt': 'Qual é o problema?',
    },
    '3gemz2on': {
      'en': 'Choose Date',
      'pt': 'Escolha a data',
    },
    'ccj9jzrq': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    '8c4fnuop': {
      'en': 'Book Now',
      'pt': 'Agende agora',
    },
  },
  // editBooking
  {
    'mn0azwht': {
      'en': 'Edit Appointment',
      'pt': 'Editar compromisso',
    },
    'cp0728th': {
      'en': 'Edit the fields below in order to change your appointment.',
      'pt': 'Edite os campos abaixo para alterar seu agendamento.',
    },
    'nd16zpm5': {
      'en': 'Emails will be sent to:',
      'pt': 'Os e-mails serão enviados para:',
    },
    'hukj6ts7': {
      'en': 'Booking For',
      'pt': 'Reserva para',
    },
    'ffl2ttlc': {
      'en': 'Type of Appointment',
      'pt': 'Tipo de compromisso',
    },
    'cl1jujvr': {
      'en': 'Doctors Visit',
      'pt': 'visita de médicos',
    },
    'jixya9ro': {
      'en': 'Routine Checkup',
      'pt': 'Checagem de rotina',
    },
    'r5knkq2z': {
      'en': 'Scan/Update',
      'pt': 'Escanear/atualizar',
    },
    'gw093gaj': {
      'en': 'What\'s the problem?',
      'pt': 'Qual é o problema?',
    },
    'gxvkg4my': {
      'en': 'Choose Date',
      'pt': 'Escolha a data',
    },
    'jjjqxtte': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    'r1yorehi': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
  },
  // EmptyList
  {
    'jldyxnec': {
      'en': 'No Appointments!',
      'pt': 'Sem compromissos!',
    },
    'z5vjpjud': {
      'en':
          'You are all caught! No appointments scheduled, need an appointment? Schedule one now.',
      'pt':
          ' Nenhum compromisso agendado, precisa de um compromisso? Agende um agora.',
    },
    'gn7c2isn': {
      'en': 'Schedule',
      'pt': 'Agendar',
    },
  },
  // create
  {
    'j6g1g2gy': {
      'en': 'Nome',
      'pt': 'Nome',
    },
    'eo5df6bk': {
      'en': '[Some hint text...]',
      'pt': '',
    },
    '49nojjyo': {
      'en': 'Descprtion',
      'pt': 'Descrição',
    },
    'qsoca2z3': {
      'en': 'Cancel',
      'pt': '',
    },
    'pjewr4em': {
      'en': 'Create Task',
      'pt': '',
    },
  },
  // Miscellaneous
  {
    'x9wfgn1n': {
      'en': '',
      'pt': '',
    },
    '3nbos72u': {
      'en': '',
      'pt': '',
    },
    'erog7901': {
      'en': '',
      'pt': '',
    },
    'yoo92hwc': {
      'en': '',
      'pt': '',
    },
    'keobtyp6': {
      'en': '',
      'pt': '',
    },
    'xzluhh2n': {
      'en': '',
      'pt': '',
    },
    'hk6tlql6': {
      'en': '',
      'pt': '',
    },
    'mglu5fpk': {
      'en': '',
      'pt': '',
    },
    'fsdqajc5': {
      'en': '',
      'pt': '',
    },
    'smt6j59k': {
      'en': '',
      'pt': '',
    },
    'vomkpmq9': {
      'en': '',
      'pt': '',
    },
    '8a0fxd3d': {
      'en': '',
      'pt': '',
    },
    '6ee3xdw1': {
      'en': '',
      'pt': '',
    },
    'x2aus1dk': {
      'en': '',
      'pt': '',
    },
    'zdevtfy6': {
      'en': '',
      'pt': '',
    },
    '7o6oo25m': {
      'en': '',
      'pt': '',
    },
    'p72iaks6': {
      'en': '',
      'pt': '',
    },
    'uascxdf9': {
      'en': '',
      'pt': '',
    },
    'x8ik8l7l': {
      'en': '',
      'pt': '',
    },
    'ifnzlrhd': {
      'en': '',
      'pt': '',
    },
    'yamg39uj': {
      'en': '',
      'pt': '',
    },
    'fwxm8mna': {
      'en': '',
      'pt': '',
    },
    'xit6sf84': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
