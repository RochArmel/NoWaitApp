import 'package:flutter/material.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:app/screens/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Sophie Dubois'),
            accountEmail: Text('sophie.dubois@email.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('S'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Modifier le profil'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Adresses de livraison'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Méthodes de paiement'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historique des commandes'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Restaurants favoris'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.reviews),
            title: const Text('Mes avis'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Se déconnecter'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}