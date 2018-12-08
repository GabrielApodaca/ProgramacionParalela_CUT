Sequel.migration do
  up do
    create_table(:passwords) do
      String :password
    end
  end
end
