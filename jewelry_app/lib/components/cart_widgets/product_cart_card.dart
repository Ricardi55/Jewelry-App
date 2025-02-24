import 'package:flutter/material.dart';
import 'package:jewelry_app/models/producto.dart';

class ProductCartCard extends StatelessWidget {
  final Producto producto;
  final int cantidad;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ProductCartCard({
    super.key,
    required this.producto,
    required this.cantidad,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(producto.imagenUrl), // Cambia a NetworkImage si es una URL
                  fit: BoxFit.cover,
                ),
              ),
              width: 80, // Ancho del contenedor
              height: 80, // Altura del contenedor
            ),
          ),
          const SizedBox(width: 10),
          // Detalles del producto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Nombre del producto
                    Expanded(
                      child: Text(
                        producto.nombre,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Botón de eliminación
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: onRemove,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  producto.descripcion,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Botón para disminuir la cantidad
                    _buildQuantityButton(Icons.remove, onDecrease),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "$cantidad",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // Botón para aumentar la cantidad
                    _buildQuantityButton(Icons.add, onIncrease),
                    // Quitamos Spacer para evitar conflictos de layout
                    // const Spacer(),
                    // Precio del producto
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "\$${producto.precio.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}