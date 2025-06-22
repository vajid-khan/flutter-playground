import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_application_1/store/dictionary_store.dart';
import 'package:flutter_application_1/presentation/dictionary/dictionary_phonetic_item.dart';

class DictionaryScreen extends StatefulWidget {

  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreen();
}

class _DictionaryScreen extends State<DictionaryScreen> {

  final dictionaryStore = GetIt.instance<DictionaryStore>();
  final TextEditingController _searchController = TextEditingController();
  bool searchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder:
          (context) => CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title:
                    !searchClicked
                        ? Text('Dictionary', style: TextStyle(fontSize: 20))
                        : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: _searchController,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                            ),
                            keyboardType: TextInputType.webSearch,
                            onSubmitted: (value) {
                              dictionaryStore.getData(value);
                            },
                          ),
                        ),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        searchClicked = !searchClicked;
                      });
                    },
                    icon:
                        searchClicked
                            ? const Icon(Icons.close)
                            : const Icon(Icons.search),
                  ),
                ],
              ),

              dictionaryStore.data['phonetics'] != null
                  ? SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    sliver: Observer(
                      builder: (context) {
                        if (dictionaryStore.data.isNotEmpty) {
                          final phonetics =
                              dictionaryStore.data['phonetics'] as List?;
                          if (phonetics != null && phonetics.isNotEmpty) {
                            return SliverList(
                              delegate: SliverChildBuilderDelegate((
                                context,
                                index,
                              ) {
                                // Check if index is valid
                                if (index >= phonetics.length) return null;

                                final phonetic = phonetics[index];

                                // Only render if text field exists and is not null
                                if (phonetic is Map &&
                                    phonetic['text'] != null) {
                                  return DictionaryPhoneticItem(
                                    phonetic: phonetic,
                                    // player: player,
                                  );
                                }
                                return Container();
                              }, childCount: phonetics.length),
                            );
                          }
                        }
                        return SliverToBoxAdapter(child: null);
                      },
                    ),
                  )
                  : SliverToBoxAdapter(child: null),

              dictionaryStore.data['meanings'] != null
                  ? SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    sliver: Observer(
                      builder: (context) {
                        if (dictionaryStore.data.isNotEmpty) {
                          final meanings =
                              dictionaryStore.data['meanings'] as List?;
                          if (meanings != null && meanings.isNotEmpty) {
                            return SliverList(
                              delegate: SliverChildBuilderDelegate((
                                context,
                                index,
                              ) {
                                // Check if index is valid
                                if (index >= meanings.length) return null;

                                final meaning = meanings[index];
                                if (meaning is Map &&
                                    meaning['definitions'] != null &&
                                    meaning['definitions'] is List &&
                                    (meaning['definitions'] as List)
                                        .isNotEmpty) {
                                  final definitions =
                                      meaning['definitions'] as List;
                                  final firstDefinition = definitions[0];

                                  if (firstDefinition is Map &&
                                      firstDefinition['definition'] != null) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: ListTile(
                                        title: Text(
                                          firstDefinition['definition'],
                                        ),
                                        subtitle:
                                            firstDefinition['example'] != null
                                                ? Text(
                                                  firstDefinition['example'],
                                                )
                                                : null,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey[300]!,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }
                                return Container();
                              }, childCount: meanings.length),
                            );
                          }
                        }
                        return SliverToBoxAdapter(child: null);
                      },
                    ),
                  )
                  : SliverToBoxAdapter(child: null),
            ],
          ),
    );
  }
}
