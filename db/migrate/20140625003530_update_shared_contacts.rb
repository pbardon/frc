class UpdateSharedContacts < ActiveRecord::Migration
  def change
    add_column :contact_shares, :favorite, :boolean, default: false, null: false
  end
end
