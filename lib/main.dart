import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reaproveita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF527A35)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            const Text(
              'REAPROVEITA',
              style: TextStyle(
                color: Color(0xFF527A35),
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Reutilizar é transformar',
              style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class AppInfo {
  final String nome;
  final String descricao;
  final IconData icone;

  const AppInfo({
    required this.nome,
    required this.descricao,
    required this.icone,
  });
}

final List<AppInfo> meusApps = [
  AppInfo(
    nome: 'Calculadora de Gasolina',
    descricao: 'Calcula litros e custo de uma viagem',
    icone: Icons.local_gas_station,
  ),

  AppInfo(
    nome:'Calculador de churrasco',
    descricao: 'descricao',
    icone: Icons.outdoor_grill,
  )
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reaproveita')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Central de Apps',
                  style: TextStyle(color:Colors.white, fontSize: 20),
                ),
              ),
            ),

             ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () => Navigator.pop(context),
            ),
             ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => Navigator.pop(context),
            ),
             ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Fim'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.95,
        ),
        itemCount: meusApps.length,
        itemBuilder: (context,indice){
          final app = meusApps[indice];
          return Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    app.icone,
                    size: 36,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: 8,),
                  Text(
                    app.nome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,  
                    )
                  ),
                  SizedBox(height: 4,),
                  Text(
                    app.descricao,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}