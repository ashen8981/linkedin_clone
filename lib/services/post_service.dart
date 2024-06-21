import '../models/profile_model.dart';


class PostService {
  List<PostModel> getPosts(List<ProfileUserModel> users) {
    return [
      PostModel(
        user: users[0],
        content: "Creating opportunity for every member of the global workforce...",
        postImageUrl: "lib/assets/post_images/post_img_1.jpg",
        likes: 98,
        comments: 77,
        commentsT: "comments",
        likesT: "Liked by Budi and 87 others"
      ),
      PostModel(
        user: users[1],
        content: "Just finished a new project!",
        postImageUrl: "lib/assets/post_images/post_img_2.webp",
        likes: 45,
        comments: 34,
        likesT: "Liked by Tony and 23 others",
        commentsT: "comments",
      ),
      PostModel(
        user: users[2],
        content: "Creating opportunity for every member of the global workforce...",
        postImageUrl: "lib/assets/post_images/post_img_3.jpeg",
        likes: 98,
        comments: 77,
        commentsT: "comments",
        likesT: "Liked by Tony and 23 others",
      ),
      PostModel(
        user: users[3],
        content: "Just finished a new project!",
        postImageUrl: "lib/assets/post_images/post_img_4.jpeg",
        likes: 45,
        comments: 34,
        commentsT: "comments",
        likesT: "Liked by Tony and 23 others",
      ),
      PostModel(
        user: users[4],
        content: "Creating opportunity for every member of the global workforce...",
        postImageUrl: "lib/assets/post_images/post_img_5.jpeg",
        likes: 98,
        comments: 77,
        commentsT: "comments",
        likesT: "Liked by Tony and 23 others",
      ),
    ];
  }
}


