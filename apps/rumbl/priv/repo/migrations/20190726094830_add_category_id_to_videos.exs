defmodule Rumbl.Repo.Migrations.AddCategoryIdToVideos do
  use Ecto.Migration

  def change do
    alter table(:videos) do
      add :category_id, references(:categories)
    end
  end
end
