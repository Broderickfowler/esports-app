class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :gamertag
      t.string :name
    end
  end
end
