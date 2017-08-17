defmodule UpsertBug.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :text
      add :votes, :integer, default: 0

      add :user_id, references(:users)
      add :post_id, references(:posts)

      timestamps()
    end

  end
end
