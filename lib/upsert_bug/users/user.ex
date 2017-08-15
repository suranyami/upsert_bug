defmodule UpsertBug.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias UpsertBug.Users.User
  alias UpsertBug.Posts.Post
  alias UpsertBug.Comments.Comment

  schema "users" do
    field :email, :string
    field :name, :string

    has_many :posts, Post
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
  end
end
