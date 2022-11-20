defmodule Pento.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:question) do
      add :content, :string
      add :upvote, :integer

      timestamps()
    end
  end
end
