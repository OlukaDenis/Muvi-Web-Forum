class RemoveUserIdFromQuestions < ActiveRecord::Migration[6.0]
  def change

    remove_column :questions, :user_id, :integer
  end
end
