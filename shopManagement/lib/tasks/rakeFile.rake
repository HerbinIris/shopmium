require 'csv'
namespace :update_shops do

desc "Import shops's informations from csv file"
task :import => [:environment] do

  file = "db/shopmium.csv"

  CSV.foreach(file, :headers => true) do |row|
    Shop.create! (row.to_hash)
  end

end
end
