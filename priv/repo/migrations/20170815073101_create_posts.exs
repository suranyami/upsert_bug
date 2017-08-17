defmodule UpsertBug.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :votes, :integer, default: 0

      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:posts, [:user_id, :title])
  end
end
