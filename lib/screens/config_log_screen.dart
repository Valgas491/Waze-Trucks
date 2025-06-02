import 'package:flutter/material.dart';

class CofnigLogScreen extends StatelessWidget {
  const CofnigLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2129), // Cor principal
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color(0xFF2E2E4A), // Mantendo uma cor escura similar para o "modal"
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Permitir que o "App" use sua localização?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Sua localização precisa é usada para mostrar sua posição no mapa, obter direções, estimar tempos de viagem e melhorar os resultados da pesquisa',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                // Placeholder para o mapa
                Container(
                  height: 150,
                  color: Colors.grey[800],
                  child: Center(
                    child: Text(
                      'Mapa Placeholder',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Botões de permissão
                SizedBox( // Adiciona um SizedBox para limitar a largura dos botões
                  width: double.infinity, // Faz os botões ocuparem a largura total do container pai
                  child: TextButton(
                    onPressed: () {
                      // Navegar para a tela principal ao permitir uma vez
                      Navigator.pushNamed(context, '/homePrincipal');
                    },
                    child: const Text(
                      'Permitir uma vez',
                      style: TextStyle(fontSize: 16, color: Color(0xFF80F17E)), // Cor secundária
                    ),
                  ),
                ),
                SizedBox(
                   width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      // Navegar para a tela principal ao permitir durante o uso
                      Navigator.pushNamed(context, '/homePrincipal');
                    },
                    child: const Text(
                      'Permitir durante o uso do aplicativo',
                       style: TextStyle(fontSize: 16, color: Color(0xFF80F17E)), // Cor secundária
                    ),
                  ),
                ),
                 SizedBox(
                   width: double.infinity,
                   child: TextButton(
                    onPressed: () {
                      // Navegar para a tela principal mesmo ao não permitir (exemplo)
                       Navigator.pushNamed(context, '/homePrincipal');
                    },
                    child: const Text(
                      'Não permita',
                       style: TextStyle(fontSize: 16, color: Color(0xFF80F17E)), // Cor secundária
                    ),
                  ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 