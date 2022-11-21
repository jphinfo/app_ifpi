import 'package:app_working/models/contac_models.dart';
import 'package:app_working/pages/ui/contact_page.dart';
import 'package:flutter/material.dart';

class ContactListWidget extends StatefulWidget {
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  State<ContactListWidget> createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  ContactHelper helper = ContactHelper();

  List contacts = [];

  @override
  void initState() {
    super.initState();
    _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return _contactCard(context, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        tooltip: 'Adicionar Contato',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        //_showContactPage(contact: contacts[index]);
        _showOptions(context, index);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).canvasColor,
                backgroundImage: const AssetImage('assets/images/person.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contacts[index].name ?? "",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].email ?? "",
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOptions(BuildContext context, int index) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          backgroundColor: Colors.white,
          onClosing: () {},
          builder: (context) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ligar',
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showContactPage(contact: contacts[index]);
                    },
                    child: const Text(
                      'Editar',
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      helper.deleteContact(contacts[index].id);
                      setState(() {
                        contacts.removeAt(index);
                        Navigator.pop(context);
                      });
                    },
                    child: const Text(
                      'Excluir',
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showContactPage({Contact? contact}) async {
    final recContact = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(contact: contact),
      ),
    );
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
      } else {
        await helper.saveContact(recContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts() {
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }
}
