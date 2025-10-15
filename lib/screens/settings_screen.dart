import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Notifications'),
            subtitle: Text('Recevez des mises à jour sur vos commandes.'),
            trailing: Switch(
              value: true,
              onChanged: null,
              activeColor: Color(0xFF00D1B2),
            ),
          ),
          const ListTile(
            title: Text('Types de notifications'),
            subtitle: Text('Choisissez ce que vous recevez.'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            title: Text('Langue'),
            subtitle: Text('Français'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            title: Text('Gestion des données'),
            subtitle: Text('Gérez vos données partagées.'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text('Permissions'),
            subtitle: Text('Contrôlez les autorisations de l\'app.'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const Divider(),
          const ListTile(
            title: Text('FAQ'),
            subtitle: Text('Trouvez des réponses rapides.'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text('Contact'),
            subtitle: Text('Contactez notre équipe de support.'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}