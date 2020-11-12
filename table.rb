# require "tty-prompt"
# require "tty-font"
# require "tty-table"
# require "pastel"
# require "pry"

# $font = TTY::Font.new(:doom)
# $table_emojis = ["💰", "💪", "🪓", "🦆", "🛒"]

# $table_boar = TTY::Table.new do |t|
#     t << ["🐗", "🐗", "🐗"]
#     t << ["b1", "b2", "b3"]
#     t << ["c1", "c2", "c3"]
#     t << ["d1", "d2", "d3"]
#     t << ["e1", "e2", "e3"]
#     t << [nil, "BEGIN", nil]
#   end

# $table_turkey = TTY::Table.new do |t|
#   t << ["🦃", "🦃", "🦃"]
#   t << ["b1", "b2", "b3"]
#   t << ["c1", "c2", "c3"]
#   t << ["d1", "d2", "d3"]
#   t << ["e1", "e2", "e3"]
#   t << [nil, "BEGIN", nil]
# end



# def random_table(table)
#   new_row1 = table[1].map! {|spot| spot = $table_emojis.sample}
#   new_row_2 = table[2].map! {|spot| spot = $table_emojis.sample}
#   new_row_3 = table[3].map! {|spot| spot = $table_emojis.sample}
#   new_row_4 = table[4].map! {|spot| spot = $table_emojis.sample}
#   $new_table = table.render(:ascii, padding: [3, 5]) do |renderer|
#     renderer.border.separator = :each_row
#   end
# end

# k = random_table($table_turkey)

# puts k[1][1]

# # $new_table = $table_turkey.render(:ascii, padding: [3, 5]) do |renderer|
# #     renderer.border.separator = :each_row
# #   end

# # puts $new_table


# # def game_header
# #   puts $font.write("LEVEL 1", letter_spacing: 2)
# # end

# def game_map
#   puts $font.write("LEVEL 1", letter_spacing: 2)
#   puts $new_table
#   # binding.pry
# end

# # game_map

# # 👾 = $table_turkey.map do |row|
# #   row.map {|spot| spot = $table_emojis.sample}
# #   end
# # puts 👾

# # 👾 = $table_turkey[1].map {|spot| spot = $table_emojis.sample}
# # puts  👾
# # puts $table_emojis.sample

# # def sample_table(table)
# #   table.map do |row|
# #     row.map! {|spot| spot = $table_emojis.sample}
# #   end
# #   puts table
# # end

# # def random_table(table)
# #   new_spots = table.map do |row|
# #     row.map {|spot| spot << $table_emojis.sample}
# #   end
# # end

# # sample_table($table_turkey)
