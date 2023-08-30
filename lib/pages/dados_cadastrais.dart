import 'package:flutter/material.dart';
import 'package:loginapp/repositories/ling_repository.dart';
import 'package:loginapp/repositories/nivel_repository.dart';

import 'package:loginapp/shared/widgets/titulo_categoria.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  TextEditingController nomeController = TextEditingController(text: '');
  TextEditingController nascimentoController = TextEditingController(text: '');

  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var lingRepository = LinguagemRepository();
  var niveis = [];
  var lings = [];
  var nivelSelecionado = '';
  var lingSelecionadas = [];
  double salarioSelecionado = 1000;
  int tempoXP = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    lings = lingRepository.retornaLinguagem();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int qtdMax) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= qtdMax; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text('${i.toString()} anos'),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Dados'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const TituloCategoria(text: 'Nome'),
                    TextField(
                      controller: nomeController,
                    ),
                    const TituloCategoria(text: 'Data de Nascimento'),
                    TextField(
                      readOnly: true,
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2020, 1, 1),
                            firstDate: DateTime(1900, 5, 20),
                            lastDate: DateTime(2024, 10, 23));
                        if (date != null) {
                          nascimentoController.text =
                              '${date.day}-${date.month}-${date.year}';
                          dataNascimento = date;
                        }
                      },
                      controller: nascimentoController,
                    ),
                    const TituloCategoria(text: 'Nivel de XP'),
                    Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              title: Text(nivel.toString()),
                              selected: nivelSelecionado == nivel,
                              value: nivel,
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                setState(() {
                                  nivelSelecionado = value;
                                });
                              }))
                          .toList(),
                    ),
                    const TituloCategoria(text: 'Linguagens Preferidas'),
                    Column(
                      children: lings
                          .map((ling) => CheckboxListTile(
                              title: Text(ling.toString()),
                              value: lingSelecionadas.contains(ling),
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    setState(() {
                                      lingSelecionadas.add(ling);
                                    });
                                  } else {
                                    setState(() {
                                      lingSelecionadas.remove(ling);
                                    });
                                  }
                                });
                              }))
                          .toList(),
                    ),
                    const TituloCategoria(text: 'Tempo de XP'),
                    DropdownButton(
                        value: tempoXP,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            tempoXP = int.parse(value.toString());
                          });
                        }),
                    const TituloCategoria(text: 'Pretenção Salarial'),
                    Slider(
                        min: 1000,
                        max: 10000,
                        divisions: 50,
                        value: salarioSelecionado,
                        onChanged: (double value) {
                          setState(() {
                            salarioSelecionado = value;
                          });
                        }),
                    Text(
                      'R\$ ${salarioSelecionado.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            salvando = false;
                          });
                          if (nomeController.text.trim().length <= 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Digite um nome com mais de 3 caracteries')));
                            return;
                          }
                          if (dataNascimento == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Data de Nascimento Inválida')));
                            return;
                          }
                          if (nivelSelecionado.trim().length <= 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Selecione o nível de Experiência')));
                            return;
                          }
                          if (tempoXP == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Deve ter ao menos 1 ano de XP')));
                            return;
                          }

                          setState(() {
                            salvando = true;
                          });
                          Future.delayed(const Duration(seconds: 2), () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Cadastro Criado')));
                            setState(() {
                              salvando = false;
                            });
                            Navigator.pop(context);
                          });

                          debugPrint(nomeController.text);
                          debugPrint(
                              '${dataNascimento?.day}-${dataNascimento?.month}-${dataNascimento?.year}');
                          debugPrint(nivelSelecionado.toString());
                          debugPrint(lingSelecionadas.toString());
                          debugPrint(tempoXP.toString());
                          debugPrint(salarioSelecionado.toStringAsFixed(2));
                        },
                        child: const Text('Salvar')),
                  ],
                ),
        ));
  }
}
