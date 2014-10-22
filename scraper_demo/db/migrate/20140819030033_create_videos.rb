class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :contentid
      t.string :title
      t.string :hits
      t.string :updateTime
      t.string :image
      t.string :href
      t.string :swfurl
      t.string :playurl
      t.string :videourl

      t.timestamps
    end
  end
end
