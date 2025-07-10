import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../../../core/components/loading_indicator.dart';
import '../../../localization/extensions.dart';
import '../../../product/constants/constants.dart';
import '../../../remote/repositories/comment/commet_model.dart';
import '../../../remote/repositories/comment/commet_service.dart';

class CommentsBottomSheet extends StatefulWidget {
  const CommentsBottomSheet({
    super.key,
    required this.itemId,
    required this.itemType,
    required this.initialCommentCount,
  });
  final String itemId;
  final String itemType;
  final int initialCommentCount;

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  late final CommentService _commentService;
  late Future<List<Comment>> _commentsFuture;
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();
  String? _replyingToCommentId;
  final Map<String, bool> _showReplies = {};
  final Map<String, bool> _isEditing = {};
  final Map<String, TextEditingController> _editControllers = {};

  @override
  void initState() {
    super.initState();
    _commentService = CommentService();
    _loadComments();
  }

  void _loadComments() {
    setState(() {
      _commentsFuture = _commentService.getComments(
        id: widget.itemId,
        type: widget.itemType,
      );
    });
  }

  String formatDate(String dateStr) {
    final date = DateTime.tryParse(dateStr);
    if (date == null) return dateStr;
    return DateFormat('dd.MM.yyyy, HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          Expanded(child: _buildCommentsList()),
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(
        children: [
          Text(
            context.translation.comments,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 34, 34, 34),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsList() {
    return FutureBuilder<List<Comment>>(
      future: _commentsFuture,
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
                Assets.icons.icNoComment
                    .svg(package: 'gen', height: 43.44, width: 46),
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
                    onPressed: () {
                      FocusScope.of(context).requestFocus(_commentFocusNode);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      context.translation.write_comment,
                      style: const TextStyle(
                        color: Color.fromRGBO(36, 36, 36, 1),
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return _buildCommentItem(snapshot.data![index]);
          },
        );
      },
    );
  }

  Widget _buildCommentItem(Comment comment) {
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
      padding: EdgeInsets.only(left: isReply ? 30 : 0, bottom: 5),
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
                          _replyingToCommentId = comment.id;
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
                  const SizedBox(width: 12),
                  if (!isOwner && !isReply)
                    GestureDetector(
                      onTap: () => _replyToComment(comment.id),
                      child: Assets.icons.icChat.svg(
                        package: 'gen',
                        height: 13,
                        width: 12,
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
            if (!isReply && hasReplies)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showReplies[comment.id] =
                        !(_showReplies[comment.id] ?? false);
                  });
                },
                child: Text(
                  (_showReplies[comment.id] ?? false)
                      ? context.translation.jog_giz
                      // ignore: lines_longer_than_80_chars
                      : '${context.translation.jog_gor} (${comment.replies.length})',
                  style: TextStyle(
                    color: (_showReplies[comment.id] ?? false)
                        ? Colors.grey
                        : const Color.fromARGB(255, 113, 113, 113),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            if (hasReplies && (_showReplies[comment.id] ?? false))
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: comment.replies.map(_buildCommentItem).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentInput() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 242, 242, 242),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _commentController,
                focusNode: _commentFocusNode,
                decoration: InputDecoration(
                  hintText: _replyingToCommentId != null
                      ? '${context.translation.write_comment}...'
                      : context.translation.write_comment,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 96, 96, 96),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            GestureDetector(
              onTap: _submitComment,
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFF2979FF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Assets.icons.senCommet.svg(package: 'gen'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitComment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    try {
      if (_replyingToCommentId != null &&
          _isEditing[_replyingToCommentId] == true) {
        await _updateCommentContent(_replyingToCommentId!, text);
      } else {
        await _commentService.addComment(
          comment: text,
          commentableId: widget.itemId,
          commentType: widget.itemType,
          parentId: _replyingToCommentId,
        );
      }

      _loadComments();

      // Input'u temizle
      _commentController.clear();

      // Eğer düzenleme modundaysa state'i sıfırla
      if (_replyingToCommentId != null) {
        setState(() {
          _isEditing.remove(_replyingToCommentId);
          _editControllers.remove(_replyingToCommentId);
          _replyingToCommentId = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yorum gönderilemedi: ${e.toString()}')),
      );
    }
  }

  void _replyToComment(String commentId) {
    if (_replyingToCommentId == commentId) {
      setState(() {
        _replyingToCommentId = null;
        _commentFocusNode.unfocus();
      });
    } else {
      setState(() {
        _replyingToCommentId = commentId;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FocusScope.of(context).requestFocus(_commentFocusNode);
        });
      });
    }
  }

  Future<void> _deleteComment(String commentId) async {
    try {
      await _commentService.deleteComment(commentId);
      _loadComments();
      // ignore: empty_catches
    } catch (e) {}
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
