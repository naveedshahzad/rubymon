class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end

    create_table :monsters_teams, :id=>false do |t|
      t.integer :monster_id
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
