import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CsvImportScreen extends StatefulWidget {
  const CsvImportScreen({Key? key}) : super(key: key);

  @override
  _CsvImportScreenState createState() => _CsvImportScreenState();
}

class _CsvImportScreenState extends State<CsvImportScreen> {
  String? _filePath;
  final List<List<String>> _importedData = [];

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        final fileBytes = result.files.first.bytes;
        _filePath = String.fromCharCodes(fileBytes!);
      });

      // Print the file content
      print("Selected File:");
      print(_filePath);
    }
  }

  Future<void> _importData() async {
    if (_filePath != null) {
      final csvData = LineSplitter().convert(_filePath!);
      setState(() {
        _importedData.clear();
        for (var line in csvData) {
          _importedData.add(line.split(','));
        }
      });
    }
  }

  void _deleteData() {
    setState(() {
      _importedData.clear();
    });
  }

  Widget _buildImportedDataList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _importedData.length,
        itemBuilder: (context, index) {
          final item = _importedData[index];
          return ListTile(
            title: Text(item.join(', ')),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSV Import'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _selectFile,
            child: const Text('Select CSV File'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _importData,
            child: const Text('Import Data'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Imported Data:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          _importedData.isNotEmpty
              ? _buildImportedDataList()
              : const Text('No data imported'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _deleteData,
            child: const Text('Delete Data'),
          ),
        ],
      ),
    );
  }
}
