class AddEmailToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :email, :string
  end
end
