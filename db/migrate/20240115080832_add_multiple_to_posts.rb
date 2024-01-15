class AddMultipleToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :start_date, :datetime, null: false
    add_column :posts, :end_date, :datetime, null: false
    add_column :posts, :recruiting_count, :bigint, null: false
    add_column :posts, :status, :string, default: 'open', null: false
  end
end
