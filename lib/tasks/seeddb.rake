namespace :seeddb do
  desc "Seeds blog database with data"
  task seed_data: :environment do
    user_data = [{name: "User1", email: "user1@email.com"},
                 {name: "User2", email: "user2@email.com"},
                 {name: "User3", email: "user3@email.com"}]
    User.delete_all
    User.create!(user_data)

    post_data = [{title: "title1", body: "post text text", user: User.all.sample},
                 {title: "title2", body: "post text text", user: User.all.sample},
                 {title: "title3", body: "post text text", user: User.all.sample}]
    Post.delete_all
    Post.create!(post_data)

    # comment_data = [{body: "comment text text", user: User.all.sample, post: Post.all.sample},
    #                 {body: "comment text text", user: User.all.sample, post: Post.all.sample},
    #                 {body: "comment text text", user: User.all.sample, post: Post.all.sample}]
    # Comment.delete_all
    # Comment.create!(comment_data)
    # С комментариями не справился, тут выдает ошибку, почему так и не понял... *(где там он нашел метод text?)
    # rake aborted!
    # NoMethodError: undefined method `text' for #<Comment:0x00007fbfbc00d880>
  end
end
