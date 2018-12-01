Sequel.migration do
  up do
    create_table(:sites) do
      primary_key :site_id, auto_increment: true
      String :name
    end
  end
end
