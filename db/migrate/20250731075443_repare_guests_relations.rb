class RepareGuestsRelations < ActiveRecord::Migration[8.0]
  def change
    # 1. Rendre wishlist_id optionnel
    change_column_null :guests, :wishlist_id, true

    # 2. Rendre event_id et user_id obligatoires
    change_column_null :guests, :event_id, false
    change_column_null :guests, :user_id, false

    # 3. Supprimer la colonne gift_id si elle existe
    if column_exists?(:guests, :gift_id)
      remove_column :guests, :gift_id
    end

    # 4. Ajouter des contraintes de foreign key si absentes (sécurité)
    add_foreign_key :guests, :events unless foreign_key_exists?(:guests, :events)
    add_foreign_key :guests, :users unless foreign_key_exists?(:guests, :users)
    add_foreign_key :guests, :wishlists unless foreign_key_exists?(:guests, :wishlists)

  end
end
