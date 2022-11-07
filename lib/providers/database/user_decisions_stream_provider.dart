import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decisionroll/models/decisions/decision_model.dart';
import 'package:decisionroll/providers/database/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDecisionsProvider = StreamProvider.autoDispose
    .family<List<DecisionModel>, String>((ref, ownerId) {
  final db = ref.watch(databaseProvider);
  final rawDecisionsQuery =
      db.collection('decisions').where('ownerId', isEqualTo: ownerId);

  final decisionsQuery = rawDecisionsQuery.withConverter<DecisionModel>(
      fromFirestore: (snapshot, _) => DecisionModel.fromMap(snapshot.data()!),
      toFirestore: (decision, _) => decision.toJson());

  final decisionListStream = decisionsQuery
      .snapshots()
      .map((_) => _.docs.map((_) => _.data()).toList());

  return decisionListStream;
});
