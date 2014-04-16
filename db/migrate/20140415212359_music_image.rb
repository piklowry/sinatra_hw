class MusicImage < ActiveRecord::Migration
  def change
  	create_table :music_photos do |t|
  		t.string :description
  		t.text :title
  		t.timestamps
  	end
  		MusicPhoto.create(description: "Jimi Hendrix", title: "http://t1.gstatic.com/images?q=tbn:ANd9GcRaizGEeIk3WXaoGcs9VCFpEVq_wXbMR8nPSRKgv3-xl8aW6xtY0g")
      MusicPhoto.create(description: "Woodstock", title: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSLWs6u_UkwdZ1MO4bf69xGcx1DXmjMlzFyDV8Lfjs99JLe4YGd")
      MusicPhoto.create(description: "Lynard Skynard", title: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQL_8PEeZrH_DT4jZe1M5La3j6vUAA-TkU5CBG7IYqM-deVfNc_")
      MusicPhoto.create(description: "Jefferson Airplane", title: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTXjfsrm4EFB6QCeLZlsvSgO4UpRBc2Lg_VWvM5C99x4VyWugUG")
  	end
end

