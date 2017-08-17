#     mix run priv/repo/seeds.exs

alias UpsertBug.Repo
alias UpsertBug.Users.User
alias UpsertBug.Posts.Post
alias UpsertBug.Comments.Comment

defmodule Seeds do
  def random_text(num_paragraphs \\ 2) do
    %Range{first: 1, last: num_paragraphs}
    |> Faker.Lorem.paragraphs
    |> Enum.map(fn para ->
      "<p>#{para}</p>"
    end)
    |> Enum.join("\n")
  end

  def post_votes(posts) do
    Enum.map(posts, fn post ->
      %{
        title: post.title,
        user_id: post.user_id,
        votes: :rand.uniform(100)
      }
    end)
  end
end

Repo.delete_all(Comment)
Repo.delete_all(Post)
Repo.delete_all(User)

0..20
|> Enum.map(fn _ ->
  %User{
    email: Faker.Internet.email,
    name: Faker.Name.name
  }
end)
|> Enum.each(fn user ->
  Repo.insert!(user)
end)

users = Repo.all(User)

0..10
|> Enum.map(fn _ ->
  user = Enum.random(users)
  %Post{
    title: Faker.Lorem.sentence(),
    body: Seeds.random_text(4),
    user_id: user.id
  }
end)
|> Enum.each(fn post ->
  Repo.insert!(post)
end)

posts =
  Post
  |> Repo.all
  |> Repo.preload(:user)
  |> Repo.preload(:comments)

posts
|> Enum.each(fn post ->
  0..2
  |> Enum.map(fn _ ->
    user = Enum.random(users)
    %Comment{
      comment: Seeds.random_text(2),
      post_id: post.id,
      user_id: user.id
    }
  end)
  |> Enum.each(fn comment ->
    Repo.insert!(comment)
  end)
end)

post_votes = Seeds.post_votes(posts)
Repo.insert_all(Post, post_votes, on_conflict: :replace_all, conflict_target: [:user_id, :title])
