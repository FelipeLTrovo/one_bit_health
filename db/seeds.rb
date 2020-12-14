seed_file = "#{Rails.root}/db/seeds/#{Rails.env}.rb"
puts "*** File #{seed_file} seed data"

if File.exists?(seed_file)
  puts "*** Loading #{Rails.env} seed data"
  require seed_file
end

puts "Adjust IDS sequence - #{Rails.env}"
ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end
