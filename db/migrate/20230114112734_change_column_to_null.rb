class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :comments, :text, true
    change_column_null :users, :name, true
    change_column_null :users, :email, true
  end
end