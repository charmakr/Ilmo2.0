# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

if ENV['maara']==nil or ENV['poistetaan']==nil
puts "Kaytto: rake db:seed maara=XXX poistetaan=X \n"
puts "maara: XXX: Kuinka monta kurssia lisataan \n"
puts poistetaan" 1: Poistetaan vanhat kurssit ta 0: sailytetaan vanhat kurssit"
puts "esim  rake db:seed maara=10 poistetaan=1        poistaa kaikki vanhat kurssit ja lisää 10 uutta "
return
end
if ENV['poistetaan']=="1"
  puts "Poistetaan kaikki aikaisemmat kurssit"
  Course.destroy_all
end
  i=0
  puts "Lisataan "+ ENV['maara']+ " kurssia"
  ENV['maara'].to_i.times{
    i=i+1    
  Course.create(:name=>"Kurssi "+i.to_s, :description=> "Kurssin "+i.to_s+" kuvaus selityksineen")
  }