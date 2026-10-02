import 'package:flutter/material.dart';
import 'package:tutorial07/database.dart';
import 'package:tutorial07/model/filme_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Filme> filmes = Database.getFilmes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CineFlutter"),
          backgroundColor: const Color.fromARGB(255, 141, 190, 223),
        ),

        body: ListView.builder(
          itemCount: filmes.length,
          itemBuilder: (context, index) {
            final filme = filmes[index]; // pega o filme da posicao atual
            return ListTile(
              leading: Icon(Icons.movie, color: Colors.blue), //icone à esquerda
              title: Text(filme.titulo),
              subtitle: Text('Ano: ${filme.anoLancamento}'),
              trailing: Row(
                mainAxisSize:
                    MainAxisSize.min, // Ajusta o tamanho da linha ao conteudo
                children: [
                  Icon(
                    Icons.star,
                    color: filme.imdb >= 8.5 ? Colors.amber : Colors.grey,
                    size: 18,
                  ),
                  Text(filme.imdb.toString()),
                ],
              ),
              onTap: () {
                // Espaço reservado para a futura tela de detalhes
                print('Clicou em: ${filme.titulo}');
              },
              onLongPress: () {
                // 1. Exibe no console (opcional)
                print('Você clicou LongPress no filme ${filme.titulo}');

                // 2. Exibe a mensagem na tela usando um SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Você clicou LongPress no filme ${filme.titulo}',
                    ),
                    duration: const Duration(
                      seconds: 2,
                    ), // Tempo que fica visível
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
