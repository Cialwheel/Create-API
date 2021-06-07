namespace :dev do
  task :fetch_city => :environment do
    puts "Fetch city data..."
    response = RestClient.get"https://data.block.cc/api/v3/markets?api_key=NRL9HC7ZSIWQU4JKMFPGUIZJMZFTWAXNH38SSVL1&size=100"
    data = JSON.parse(response.body)
    $i = 0
    $num = 100
    while $i < $num
      City.create!(:block_id => $i, :fullname => data[$i]["fullname"], :slug => data[$i]["slug"], :websiteUrl => data[$i]["websiteUrl"], :status => data[$i]["status"], :volume => data[$i]["volume"])
      $i=$i+1
    end
  end
end
