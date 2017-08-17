defmodule UpsertBug.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias UpsertBug.Posts.Post
  alias UpsertBug.Users.User
  alias UpsertBug.Comments.Comment
  import Ecto.Query

  schema "posts" do
    field :body, :string
    field :title, :string
    field :votes, :integer

    has_many :comments, Comment
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
