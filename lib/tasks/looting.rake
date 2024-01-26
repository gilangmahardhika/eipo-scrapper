namespace :looting do
  desc "Bootstrapping"
  task loot: :environment do
    Loot.looting
  end

  desc "Completing all details"
  task all_details: :environment do
    Loot.update_all_details
  end

end
