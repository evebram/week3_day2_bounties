require('pry')
require_relative('./models/bounty.rb')

#Bounties.delete_all()

bounty1 = Bounties.new({
  'name' => 'Boba Fett',
  'bounty_value' => 100000,
  'danger_level' => 'youdeadboi',
  'favourite_weapon' => 'Carbine Rifle',
  })

  bounty1.save()

bounty2 = Bounties.new({
  'name' => 'Bossk',
  'bounty_value' => 75000,
  'danger_level' => 'high',
  'favourite_weapon' => 'Relby-v10',
  })
bounty2.save()
bounty2.danger_level = 'medium'
bounty2.update()
#Bounties.delete(9)
  binding.pry
  nil
