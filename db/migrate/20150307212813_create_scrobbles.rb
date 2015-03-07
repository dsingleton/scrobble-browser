class CreateScrobbles < ActiveRecord::Migration
  def change
    create_table :scrobbles do |t|
      t.references :user, index: true
      t.references :track, index: true
      t.datetime :listened_at

      t.timestamps
    end
  end
end
