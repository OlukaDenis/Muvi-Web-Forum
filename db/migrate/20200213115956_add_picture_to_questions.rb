class AddPictureToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :picture, :string
  end
end
