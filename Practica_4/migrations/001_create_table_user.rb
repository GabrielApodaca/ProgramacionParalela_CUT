Sequel.migration do
  up do
    create_table(:users) do
      primary_key :user_id, auto_increment: true
      String :name
      String :email
    end
  end
end
