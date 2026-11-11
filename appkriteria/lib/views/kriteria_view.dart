import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kriteria_controller.dart';

class KriteriaView extends StatelessWidget {
  KriteriaView({super.key});

  final KriteriaController controller = Get.put(KriteriaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Kriteria"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Muat ulang',
            onPressed: controller.tangkapDataKriteria,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              // Sedang memuat data
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              // Gagal terhubung ke server
              if (controller.pesanError.value.isNotEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(controller.pesanError.value,
                            textAlign: TextAlign.center),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: controller.tangkapDataKriteria,
                          child: const Text('Coba lagi'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // Memastikan list kriteria telah terisi
              if (controller.kriteriaList.isEmpty) {
                return const Center(child: Text("Tidak ada data kriteria"));
              }

              return ListView.builder(
                itemCount: controller.kriteriaList.length,
                itemBuilder: (context, index) {
                  final kriteria = controller.kriteriaList[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kriteria.namaKriteria,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          Text("Prioritas ke-${kriteria.prioritas}"),
                          const SizedBox(height: 5),
                          Text("Sub kriteria (${kriteria.subKriterias.length}):"),
                          ...kriteria.subKriterias.map(
                            (sub) => Text("• ${sub.namaSubKriteria}"),
                          ),
                          const SizedBox(height: 10),
                          OverflowBar(
                            alignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('Hapus'),
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: 'Hapus Kriteria',
                                    middleText:
                                        'Hapus "${kriteria.namaKriteria}" beserta sub kriterianya?',
                                    textConfirm: 'Hapus',
                                    textCancel: 'Batal',
                                    onConfirm: () {
                                      controller.hapusKriteria(kriteria.id!);
                                      Get.back();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
