import 'package:cloud_firestore/cloud_firestore.dart';

class FbTarea {
  final String id; // Agrega un campo para el ID
  final String titulo;
  final String descripcion;
  final DateTime fechaCreacion;
  bool completada;

  // Modifica el constructor para incluir el id. Puedes hacerlo requerido o proporcionar un valor por defecto.
  FbTarea({
    required this.id,
    required this.titulo,
    required this.descripcion,
    DateTime? fechaCreacion,
    this.completada = false,
  }) : this.fechaCreacion = fechaCreacion ?? DateTime.now().toUtc();

  // Modifica el método factory para extraer el ID del documento
  factory FbTarea.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final data = snapshot.data();
    return FbTarea(
      id: snapshot.id, // Usa el id del snapshot
      titulo: data?['titulo'] ?? 'Sin Título',
      descripcion: data?['descripcion'] ?? 'Sin Descripción',
      fechaCreacion: (data?['fechaCreacion'] as Timestamp?)?.toDate() ?? DateTime.now(),
      completada: data?['completada'] ?? false,
    );
  }

  // El método toFirestore permanece igual, ya que el id no se almacena dentro del documento
  Map<String, dynamic> toFirestore() {
    return {
      "titulo": titulo,
      "descripcion": descripcion,
      "fechaCreacion": Timestamp.fromDate(fechaCreacion),
      "completada": completada,
    };
  }
}