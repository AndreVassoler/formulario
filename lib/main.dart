import 'package:flutter/material.dart';

void main() {
  runApp(BancoApp());
}

// StatelessWidget para a estrutura principal do aplicativo
class BancoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BancoHomePage(),
    );
  }
}

// StatefulWidget para manter e atualizar o estado do formulário
class BancoHomePage extends StatefulWidget {
  @override
  _BancoHomePageState createState() => _BancoHomePageState();
}

class _BancoHomePageState extends State<BancoHomePage> {
  // Controladores de texto para os campos do formulário
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _saldoController = TextEditingController();

  // Lista dinâmica para armazenar as contas bancárias
  List<Map<String, String>> contas = [];

  // Função para adicionar uma conta à lista
  void _adicionarConta() {
    setState(() {
      contas.add({
        'nome': _nomeController.text,
        'saldo': _saldoController.text,
      });
      _nomeController.clear();
      _saldoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do Titular'),
            ),
            TextField(
              controller: _saldoController,
              decoration: InputDecoration(labelText: 'Saldo Inicial'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarConta,
              child: Text('Adicionar Conta'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contas[index]['nome']!),
                    subtitle: Text('Saldo: R\$ ${contas[index]['saldo']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
