import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internationalization/internationalization.dart';
import 'package:petct/core/utils/theme.dart';
import 'package:petct/features/auth/presentation/pages/register_page.dart';
import 'package:petct/features/auth/presentation/pages/start_page.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/verify_email_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Internationalization.loadConfigurations();

  runApp(
    MultiProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.sl<AuthBloc>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      supportedLocales: suportedLocales,
      localizationsDelegates: [
        Internationalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      theme: theme.getTheme(),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => StartPage(),
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/verifyEmail': (BuildContext context) => VerifyEmailPage(),
      },
    );
  }
}
