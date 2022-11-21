defmodule Pento.Repo.Migrations.UpdateQuestion do
  use Ecto.Migration

  def change do
    alter table(:question) do
      add :answer, :string
    end
  end
end
