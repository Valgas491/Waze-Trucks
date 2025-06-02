import 'package:flutter/material.dart';

class HomePrincipalScreen extends StatefulWidget {
  const HomePrincipalScreen({super.key});

  @override
  _HomePrincipalScreenState createState() => _HomePrincipalScreenState();
}

class _HomePrincipalScreenState extends State<HomePrincipalScreen> {
  bool _isSearching = false;

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtém a altura total da tela para posicionar elementos fora da tela
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // A cor de fundo pode ser ajustada dependendo do conteúdo do mapa
      backgroundColor: const Color(0xFF1C2129), // Usando a cor principal como fundo geral ou para áreas escuras
      // Removendo a AppBar para posicionar o menu sobre o mapa
      // appBar: AppBar(...),
      body: Stack(
        children: [
          // Placeholder para o mapa - pode ter um fundo escuro ou ser a imagem
          Positioned.fill(
             // Se estiver usando uma imagem, certifique-se de que ela combine com a paleta
            child: Image.asset(
              'assets/map_placeholder.jpg', // Você precisará adicionar esta imagem
              fit: BoxFit.cover,
               // Adiciona um colorFilter para escurecer o mapa levemente, se desejar
              // colorBlendMode: BlendMode.darken,
              // color: Colors.black.withOpacity(0.3),
            ),
          ),
          // Menu hambúrguer flutuante - visível em ambos os estados
          AnimatedPositioned(
             duration: const Duration(milliseconds: 300), // Duração da animação
             curve: Curves.easeInOut, // Curva da animação
            top: _isSearching ? -80 : 40, // Move para cima e fora da tela quando buscando
            left: 20, // Ajuste a posição horizontal conforme necessário
            child: Container(
               decoration: BoxDecoration(
                color: const Color(0xFF1C2129).withOpacity(_isSearching ? 0 : 0.8), // Fundo semitransparente com cor principal
                shape: BoxShape.circle,
               ),
               child: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white), // Cor branca para o ícone
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // Abre o Drawer (menu lateral)
                    },
                  );
                },
               ),
            ),
          ),

          // Interface de busca ativa (dois campos) - animação de entrada e saída pelo topo
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300), // Duração da animação
            curve: Curves.easeInOut, // Curva da animação
            top: _isSearching ? 0 : -screenHeight, // Entra pelo topo quando buscando, sai para cima
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF1C2129), // Cor principal
              padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: SafeArea(
                child: Column(
                  children: [
                    // Botão de voltar/fechar e título (opcional, pode ser um ícone)
                     Row(
                      children: [
                         IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white), // Ícone de voltar
                          onPressed: _stopSearch, // Sai da busca ao tocar
                        ),
                        // Adicionar texto ou outro elemento se necessário
                      ],
                    ),
                     const SizedBox(height: 10),
                    // Campo de localização atual
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E2E4A), // Mantendo uma cor escura similar
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const TextField(
                        readOnly: true, // Localização atual geralmente não é editável
                         style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Localização atual',
                          hintStyle: TextStyle(color: Color(0xFF80F17E)), // Cor secundária
                           prefixIcon: Icon(Icons.my_location, color: Colors.grey), // Ícone opcional
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Campo para onde ir
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E2E4A), // Mantendo uma cor escura similar
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const TextField(
                         style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Para onde?',
                          hintStyle: TextStyle(color: Colors.grey),
                           prefixIcon: Icon(Icons.location_on_outlined, color: Colors.grey), // Ícone opcional
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Barra de pesquisa inicial (campo único) - animação de entrada e saída pela parte inferior
          AnimatedPositioned(
             duration: const Duration(milliseconds: 300), // Duração da animação
             curve: Curves.easeInOut, // Curva da animação
            left: 0,
            right: 0,
            bottom: _isSearching ? -150 : 60, // Sai para baixo quando buscando, entra pela parte inferior
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                 onTap: _startSearch, // Inicia a busca ao tocar
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0), // Adiciona padding vertical
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E2E4A), // Mantendo uma cor escura similar
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Row(
                    children: [ 
                      Icon(Icons.search, color: Colors.grey), // Ícone de pesquisa
                      SizedBox(width: 10),
                      Text(
                        'Insira o destino',
                         style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C2129), // Cor principal
        selectedItemColor: const Color(0xFF80F17E), // Cor secundária
        unselectedItemColor: Colors.grey, // Mantendo cinza para não selecionados
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map), // Ícone de mapa
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on), // Ícone de localização
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ícone de perfil
            label: '',
          ),
        ],
        // Adicione a lógica para mudar de tela ao tocar nos ícones, se necessário
        // onTap: (index) {
        //   // Implementar navegação ou troca de conteúdo aqui
        // },
      ),
       // Adiciona um Drawer vazio por enquanto para o ícone do menu funcionar
      drawer: Drawer(),
    );
  }
} 