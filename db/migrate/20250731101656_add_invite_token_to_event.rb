class AddInviteTokenToEvent < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :invite_token, :string
  end
end
