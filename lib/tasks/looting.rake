namespace :looting do
  desc "Bootstrapping"
  task loot: :environment do
    Loot.looting
  end

  desc "Completing all details"
  task all_details: :environment do
    Loot.update_all_details
  end

  desc "Looting all"
  task all: :environment do
    loop do
      Loot.looting
      sleep 3600
      Loot.update_all_details
      sleep 3600
    end
  end

end
