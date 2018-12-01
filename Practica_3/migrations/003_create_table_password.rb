Sequel.migration do
  up do
    create_table(:passwords) do
      String :user_name
      String :email
      String :password
      String :site_name
    end
  end
end
