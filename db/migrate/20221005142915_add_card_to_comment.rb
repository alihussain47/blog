class AddCardToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :card, foreign_key: true
  end
end
