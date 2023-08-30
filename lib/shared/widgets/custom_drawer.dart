import 'package:flutter/material.dart';
import 'package:loginapp/pages/dados_cadastrais.dart';
import 'package:loginapp/pages/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Camera'),
                          leading: const Icon(Icons.photo_camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Galeria'),
                          leading: const Icon(Icons.photo),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.cyan.shade300),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        'https://avatars.githubusercontent.com/u/111465072?v=4')),
                accountName: const Text('Caio Bonalume'),
                accountEmail: const Text('abc@abc.com')),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Cadastrar'),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastrais()));
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Clientes'),
                  ],
                )),
            onTap: () {},
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Termos e Política de Privacidade'),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      child: const Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'Termos de uso e Privacidade',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            'Todas estas questões, devidamente ponderadas,levantam dúvidas sobre se o surgimento do comércio virtual desafia a capacidade de equalização do sistema de formação de quadros que corresponde às necessidades.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.construction),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Configurações'),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(color: Colors.grey, thickness: 2),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Sair'),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      title: const Text(
                        'Meu App',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(
                        children: [
                          Text('Deseja realmente sair da sua conta?'),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Não',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              'Sim',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
