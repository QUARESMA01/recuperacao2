import 'package:flutter/material.dart';

void main() {
  runApp(const RockInRio());
}

class RockInRio extends StatelessWidget {
  const RockInRio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock in Rio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List <Atracao> _listaFavoritos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Atrações')),
      body: ListView.builder(
        itemCount: listaAtracoes.length,
        itemBuilder: (context, index) {
          final isFavorito = _listaFavoritos.contains(listaAtracoes[index]);
          return ListTile(
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: 
                (context) => AtracaoPage(
                  atracao: listaAtracoes[index]))
              );
            },
            title: Text(listaAtracoes[index].nome),
            subtitle: Wrap(
              spacing: 8,
              runSpacing: 4,
              children:
                  listaAtracoes[index].tags
                      .map((tag) => Chip(label: Text('#$tag')))
                      .toList(),
            ),
            leading: CircleAvatar(child: Text('${listaAtracoes[index].dia}')),
            trailing: IconButton(onPressed: () {
              setState(() {
                if (isFavorito) {
                  _listaFavoritos.remove(listaAtracoes[index]);
                } else {
                  _listaFavoritos.add(listaAtracoes[index]);
                }
              });
            }, 
            icon: isFavorito ? const Icon(Icons.favorite, color: Color.fromARGB(255, 255, 0, 0),) : const Icon(Icons.favorite_border),
          ),
          );
        },
      ),
    );
  }
}

class AtracaoPage extends StatelessWidget {
  final Atracao atracao;
  const AtracaoPage({Key? key, required this.atracao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(atracao.nome)),
      body: Padding(padding:const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var tag in atracao.tags) Chip(label: Text('#$tag')),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: (){Navigator.pop(context); }, child: const Text ('Voltar'))
        ],
      )),
    );
  }
}

class Atracao {
  final String nome;
  final int dia;
  final List<String> tags;

  const Atracao(this.nome, this.dia, this.tags);
}

const listaAtracoes = [
  Atracao("oruan", 1, ["Espetaculo", "Fas", "NovoAlbum"]),
  Atracao("poze", 2, ["Influente", "Top", "Show"]),
  Atracao("mc pipoquinha", 3, ["TopCharts", "Hits", "PríncipeDoPOP"]),
  Atracao("caneta azul", 4, ["Sucesso", "Espetáculo", "Fas"]),
  Atracao("roberto carlos", 5, ["2020", "Novo Álbum", "Fas"]),
  Atracao("will", 6, ["Sucesso", "Reconhecimento", "Show"]),
  Atracao("teto", 7, ["NovoAlbum", "Sucesso", "2011"]),
  Atracao("mc elias", 8, ["Unico", "Carreiras", "Fas", "Que isso fera"]),
  Atracao("dj nana", 9 ,["Hits", "Prêmios", "Respeito"]),
  Atracao("mc mochilão", 10, ["Estreia", "Sucesso", "Lançamento"]),
];
