require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp
# puts memo_type.class
# puts memo_type == "1"
# puts memo_type.inspect


if memo_type == "1"
    puts "拡張子を除いたファイル名を入力してください"

    file_name = gets.chomp
    
    puts "メモしたい内容を入力してください"
    puts "完了したら Ctrl + D を押してください"

    memo_values = readlines
    File.open("#{file_name}.csv", "w") do |file|
        file << memo_values.map(&:chomp).join(",")
        file << "\n"
    end

elsif memo_type == "2"
    puts "編集するファイル名を指定してください"

    file_name = gets.chomp
    
    file = File.open("#{file_name}.csv", "a")
    File.exist?("#{file_name}.csv")

    puts "編集内容を入力してください"
    puts "完了したら Ctrl + D を押してください"

    memo_values = readlines
    File.open("#{file_name}.csv", "a")
        file << memo_values.map(&:chomp).join(",")
        file << "\n"
else
    puts "1か2を入力してください"
end