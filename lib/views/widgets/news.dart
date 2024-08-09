// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:newsapp/Apis/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatelessWidget {
  final News news;
  const NewsWidget({
    super.key,
    required this.news,
  });

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(news.url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchUrl();
      },
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: news.urlToImage != null
                      ? CachedNetworkImage(
                          height: 190,
                          width: double.infinity,
                          imageUrl: news.urlToImage!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  // colorFilter: ColorFilter.mode(
                                  //     Colors.red, BlendMode.colorBurn),
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(

                              ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : Image.asset(
                          "assets/images/loading.gif",
                          fit: BoxFit.cover,
                          height: 190,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/loading.gif",
                              fit: BoxFit.cover,
                              height: 190,
                              width: double.infinity,
                            );
                          },
                        ),
                  // ? Image.network(
                  //     news.urlToImage!,
                  //     fit: BoxFit.cover,
                  //     height: 190,
                  //     width: double.infinity,
                  //     filterQuality: FilterQuality.low,
                  //     errorBuilder: (context, error, stackTrace) {
                  //       return Image.asset(
                  //         "assets/images/loading.gif",
                  //         fit: BoxFit.cover,
                  //         height: 190,
                  //         width: double.infinity,
                  //
                  //       );
                  //       // Container(
                  //       //   height: 190,
                  //       //     width: double.infinity,
                  //       //   color: Colors.grey,
                  //       // );
                  //     },
                  //   )
                  // : Image.asset(
                  //     "assets/images/loading.gif",
                  //     fit: BoxFit.cover,
                  //     height: 190,
                  //     width: double.infinity,
                  //     errorBuilder: (context, error, stackTrace) {
                  //       return Image.asset(
                  //         "assets/images/loading.gif",
                  //         fit: BoxFit.cover,
                  //         height: 190,
                  //         width: double.infinity,
                  //       );
                  //     },
                  //   ),
                ),
                const SizedBox(height: 5),
                Text(
                  news.title ?? "No Title",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  news.description ?? "loading ... ",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.right,
                  news.publishedAt!,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
