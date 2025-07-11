import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:intl/intl.dart';

import '../../../remote/repositories/comment/commet_model.dart';
import '../../../remote/repositories/comment/commet_service.dart';
import '../../core/components/app_text.dart';
import '../../core/components/loading_indicator.dart';
import '../../localization/extensions.dart';
import '../../product/constants/constants.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({
    super.key,
  });

  static const routePath = '/comments-view';
  static const routeName = 'comments-view';

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  final CommentService _commentService = CommentService();
  late Future<List<Comment>> _commentsForMeFuture;
  late Future<List<Comment>> _myCommentsFuture;
  bool _showCommentsForMe = true;
  final FocusNode _commentFocusNode = FocusNode();
  final Map<String, bool> _showReplies = {};
  final Map<String, bool> _isEditing = {};
  final Map<String, TextEditingController> _editControllers = {};
  final TextEditingController _commentController = TextEditingController();
  String? _replyingToCommentId;
  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  void _loadComments() {
    setState(() {
      _commentsForMeFuture = _commentService.getMyPostComments();
      _myCommentsFuture = _commentService.getMyComments();
    });
  }

  String formatDate(String dateStr) {
    final date = DateTime.tryParse(dateStr);
    if (date == null) return dateStr;
    return DateFormat('dd.MM.yyyy, HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4D8BBF),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Assets.icons.icBackImage.svg(package: 'gen'),
        ),
        title: AppText.s14w400BdM(
          context.translation.comments,
          fontWeight: FontWeight.w400,
          fontFamily: StringConstants.roboto,
          fontSize: 16.sp,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          _buildToggleButtons(),
          Expanded(
            child: _showCommentsForMe
                ? _buildCommentsList(_commentsForMeFuture)
                : _buildCommentsList(_myCommentsFuture),
          ),
          // _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _showCommentsForMe = true;
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).r,
                border: Border.all(
                  width: 1.sp,
                  color: _showCommentsForMe
                      ? const Color(0xFFE5F6FE)
                      : const Color(0xFFEEEEEE),
                ),
                color: _showCommentsForMe ? const Color(0xFFE5F6FE) : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6).h,
                child: AppText.s14w400BdM(
                  context.translation.my_inbox,
                  fontWeight:
                      _showCommentsForMe ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: StringConstants.roboto,
                  color: _showCommentsForMe
                      ? const Color(0xFF3A8BCF)
                      : const Color(0xFF6A6A6A),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showCommentsForMe = false;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).r,
                border: Border.all(
                  width: 1.sp,
                  color: !_showCommentsForMe
                      ? const Color(0xFFE5F6FE)
                      : const Color(0xFFEEEEEE),
                ),
                color: !_showCommentsForMe ? const Color(0xFFE5F6FE) : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6).h,
                child: AppText.s14w400BdM(
                  context.translation.my_comments,
                  fontWeight:
                      !_showCommentsForMe ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: StringConstants.roboto,
                  color: !_showCommentsForMe
                      ? const Color(0xFF3A8BCF)
                      : const Color(0xFF6A6A6A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList(Future<List<Comment>> commentsFuture) {
    return FutureBuilder<List<Comment>>(
      future: commentsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingIndicator.circle(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.icons.com.svg(package: 'gen'),
                  const SizedBox(height: 15),
                  Text(
                    context.translation.no_comments,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 34, 34, 34),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 208,
                    child: TextButton(
                      onPressed: _loadComments,
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        context.translation.try_again,
                        style: const TextStyle(
                          color: Color.fromRGBO(36, 36, 36, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.com.svg(package: 'gen', height: 43.44, width: 46),
                const SizedBox(height: 15),
                Text(
                  context.translation.no_comments,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 34, 34, 34),
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final comment = snapshot.data![index];
            if (comment.parentId != null) {
              return _buildReplyCard(comment);
            }
            return _buildCommentCard(comment);
          },
        );
      },
    );
  }

  Widget _buildCommentCard(Comment comment) {
    final isReply = comment.parentId != null;
    final isOwner = comment.isOwner;
    final isActive = comment.status == 'active';
    final hasReplies = comment.replies.isNotEmpty;
    final isEditing = _isEditing[comment.id] ?? false;

    if (isEditing && !_editControllers.containsKey(comment.id)) {
      _editControllers[comment.id] =
          TextEditingController(text: comment.content);
    }

    return Padding(
      padding: EdgeInsets.only(left: isReply ? 10 : 0, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: isReply ? const Color(0xFFF6F6F6) : Colors.transparent,
          borderRadius: isReply
              ? const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                )
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  comment.user.username,
                  style: TextStyle(
                    fontFamily: StringConstants.roboto,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 106, 106, 106),
                    fontSize: 12.sp,
                  ),
                ),
                if (isOwner)
                  Text(
                    context.translation.eyesi,
                    style: TextStyle(
                      fontFamily: StringConstants.roboto,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 13, 149, 233),
                      fontSize: 12.sp,
                    ),
                  ),
                if (!isActive)
                  Text(
                    context.translation.verifying,
                    style: TextStyle(
                      fontFamily: StringConstants.roboto,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 13, 149, 233),
                      fontSize: 12.sp,
                    ),
                  ),
                if (!isActive)
                  PopupMenuButton<String>(
                    icon: Assets.icons.icDotsVertical.svg(package: 'gen'),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4).r,
                      side: BorderSide(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Text(
                          context.translation.delete,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringConstants.roboto,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'edit',
                        child: Text(
                          context.translation.edit,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: StringConstants.roboto,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'edit') {
                        setState(() {
                          _isEditing[comment.id] = true;
                          _commentController.text = comment.content;
                        });
                        _commentFocusNode.requestFocus();
                      } else if (value == 'delete') {
                        _deleteComment(comment.id);
                      }
                    },
                  ),
              ],
            ),
            Text(
              comment.content,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: StringConstants.roboto,
                color: const Color.fromARGB(255, 34, 34, 34),
              ),
            ),
            const SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    DateFormat('dd.MM.yyyy • HH:mm', 'tr_TR')
                        .format(comment.createdAt),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: StringConstants.roboto,
                      fontSize: 12.sp,
                      color: const Color.fromARGB(255, 106, 106, 106),
                    ),
                  ),
                ]),
                const SizedBox(width: 12),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final wasLiked = comment.userReaction == 1;

                        setState(() {
                          if (wasLiked) {
                            comment.userReaction = null;
                          } else {
                            comment.userReaction = 1;
                          }
                        });

                        try {
                          await _commentService.sendReaction(
                            model: 'UserComment',
                            modelId: comment.id,
                            type: wasLiked ? 'remove' : 'like',
                          );
                          _loadComments();
                        } catch (e) {}
                      },
                      icon: comment.userReaction == 1
                          ? Assets.icons.icSelectedLike
                              .svg(width: 20, height: 20, package: 'gen')
                          : Assets.icons.icLike.svg(
                              width: 20,
                              height: 20,
                              package: 'gen',
                              color: const Color.fromARGB(255, 140, 140, 140),
                            ),
                    ),
                    Text('${comment.likeCount}',
                        style: const TextStyle(fontSize: 10)),
                    const SizedBox(width: 12),
                    IconButton(
                      onPressed: () async {
                        final wasDisliked = comment.userReaction == -1;

                        setState(() {
                          if (wasDisliked) {
                            comment.userReaction = null;
                          } else {
                            comment.userReaction = -1;
                          }
                        });

                        try {
                          await _commentService.sendReaction(
                            model: 'UserComment',
                            modelId: comment.id,
                            type: wasDisliked ? 'remove' : 'dislike',
                          );
                          _loadComments();
                        } catch (e) {
                          setState(() {});
                        }
                      },
                      icon: comment.userReaction == -1
                          ? Assets.icons.icSelectedDislike
                              .svg(width: 20, height: 20, package: 'gen')
                          : Assets.icons.icDislike.svg(
                              width: 20,
                              height: 20,
                              package: 'gen',
                              color: const Color.fromARGB(255, 140, 140, 140),
                            ),
                    ),
                    Text('${comment.dislikeCount}',
                        style: const TextStyle(fontSize: 10)),
                  ],
                )
              ],
            ),
            if (hasReplies && (_showReplies[comment.id] ?? false))
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: comment.replies.map(_buildCommentCard).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyCard(Comment comment) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 4),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7.sp),
              topRight: Radius.circular(7.sp),
              bottomLeft: Radius.circular(7.sp),
            ),
            color: const Color(0xFFF6F6F6),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.s14w400BdM(
                comment.user.username,
                fontFamily: StringConstants.roboto,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
                color: Colors.black,
              ),
              AppText.s14w400BdM(
                DateFormat('dd.MM.yyyy • HH:mm', 'tr_TR')
                    .format(comment.createdAt),
                fontFamily: StringConstants.roboto,
                fontWeight: FontWeight.w400,
                fontSize: 9.sp,
                color: Colors.black,
              ),
              AppText.s14w400BdM(
                comment.content,
                fontFamily: StringConstants.roboto,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              _buildLikeDislikeRow(comment),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLikeDislikeRow(Comment comment) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final wasLiked = comment.userReaction == 1;

            setState(() {
              if (wasLiked) {
                comment.userReaction = null;
              } else {
                comment.userReaction = 1;
              }
            });

            try {
              await _commentService.sendReaction(
                model: 'UserComment',
                modelId: comment.id,
                type: wasLiked ? 'remove' : 'like',
              );
              _loadComments();
            } catch (e) {}
          },
          icon: comment.userReaction == 1
              ? Assets.icons.icSelectedLike
                  .svg(width: 20, height: 20, package: 'gen')
              : Assets.icons.icLike.svg(
                  width: 20,
                  height: 20,
                  package: 'gen',
                  color: const Color.fromARGB(255, 140, 140, 140),
                ),
        ),
        Text('${comment.likeCount}', style: const TextStyle(fontSize: 10)),
        const SizedBox(width: 12),
        IconButton(
          onPressed: () async {
            final wasDisliked = comment.userReaction == -1;

            setState(() {
              if (wasDisliked) {
                comment.userReaction = null;
              } else {
                comment.userReaction = -1;
              }
            });

            try {
              await _commentService.sendReaction(
                model: 'UserComment',
                modelId: comment.id,
                type: wasDisliked ? 'remove' : 'dislike',
              );
              _loadComments();
            } catch (e) {
              setState(() {});
            }
          },
          icon: comment.userReaction == -1
              ? Assets.icons.icSelectedDislike
                  .svg(width: 20, height: 20, package: 'gen')
              : Assets.icons.icDislike.svg(
                  width: 20,
                  height: 20,
                  package: 'gen',
                  color: const Color.fromARGB(255, 140, 140, 140),
                ),
        ),
        Text('${comment.dislikeCount}', style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Future<void> _deleteComment(String commentId) async {
    try {
      await _commentService.deleteComment(commentId);
      _loadComments();
    } catch (e) {}
  }

  Future<void> _submitComment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty || _replyingToCommentId == null) return;

    // ignore: use_if_null_to_convert_nulls_to_bools
    if (_isEditing[_replyingToCommentId] == true) {
      await _updateCommentContent(_replyingToCommentId!, text);

      setState(() {
        _isEditing.remove(_replyingToCommentId);
        _editControllers.remove(_replyingToCommentId);
        _replyingToCommentId = null;
        _commentController.clear();
      });

      _loadComments();
    }
  }

  Future<void> _updateCommentContent(
    String commentId,
    String newContent,
  ) async {
    try {
      await _commentService.updateComment(
        commentId: commentId,
        comment: newContent,
      );

      // ignore: empty_catches
    } catch (e) {}
  }
}
