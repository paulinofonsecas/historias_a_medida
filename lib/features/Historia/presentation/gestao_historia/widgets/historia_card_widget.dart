import 'package:flutter/material.dart';
import 'package:historias_a_medida/features/Historia/domain/entities/historia_entity.dart';

class HistoriaCardWidget extends StatelessWidget {
  const HistoriaCardWidget({
    required this.historia,
    super.key,
    this.onTap,
  });
  
  final HistoriaEntity historia;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1645113614899-000bdab2bbcf?q=80&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    historia.nome,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    historia.personagemPrincipal,
                    style: const TextStyle(
                      fontSize: 18,
                      // color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    historia.coadjuvantes,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
