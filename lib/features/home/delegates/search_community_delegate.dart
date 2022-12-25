import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/community/controller/community_controller.dart';
import 'package:reddit_clone/models/community_model.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';

class SearchCommunityDelegate extends SearchDelegate {
  final WidgetRef ref;

  SearchCommunityDelegate(this.ref);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const SizedBox();
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ref.watch(searchCommunityProvider(query)).when(
        data: (communities) => ListView.builder(
              itemCount: communities.length,
              itemBuilder: (BuildContext context, int index) {
                final community = communities[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(community.avatar),
                  ),
                  title: Text('r/${community.name}'),
                  onTap: () => navigateToCommunity(context, community.name),
                );
              },
            ),
        error: (error, stackTrace) => ErrorText(
              error: error.toString(),
            ),
        loading: () => const Loader());
    throw UnimplementedError();
  }

  void navigateToCommunity(BuildContext context, String communityName) {
    Routemaster.of(context).push('/r/$communityName');
  }
}
