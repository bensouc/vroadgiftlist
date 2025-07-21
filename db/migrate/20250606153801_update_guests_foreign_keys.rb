class UpdateGuestsForeignKeys < ActiveRecord::Migration[8.0]
  def change
        # 1. Supprimer la foreign key vers events
        remove_foreign_key :guests, :events if foreign_key_exists?(:guests, :events)

        # 2. Supprimer la foreign key vers gifts (mais pas la colonne)
        remove_foreign_key :guests, :gifts if foreign_key_exists?(:guests, :gifts)

        # 3. Ajouter une colonne user_id + index + foreign key
        add_reference :guests, :user, foreign_key: true
  end
end
