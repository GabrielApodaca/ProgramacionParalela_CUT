Sequel.migration do
  up do
    alter_table(:passwords){add_foreign_key :user_id, :users}
    alter_table(:passwords){add_foreign_key :site_id, :sites}
  end
end
