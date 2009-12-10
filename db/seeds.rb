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
  Course.last.exams.create(:name => "Koe Kurssiin "+i.to_s, :start_time=>0.hour.from_now, :end_time=>5.hour.from_now)
  Course.last.exams.create(:name => "Uusintakoe Kurssiin "+i.to_s, :start_time=>200.hour.from_now, :end_time=>204.hour.from_now)
  Course.last.course_instances.create(:name => "Kevät 2010", :multiple_exercise_groups =>true, :min=>0 ,:max=>4)
  Course.last.course_instances.create(:name => "Syksy 2010", :multiple_exercise_groups =>false, :min=>0 ,:max=>3)
  Course.last.course_instances.first.exercise_groups.create(:name => "Ryhmä 1", :classroom=>"A1", :begins_at => 0.hour.from_now, :ends_at =>1.hour.from_now )
  Course.last.course_instances.first.exercise_groups.create(:name => "Ryhmä 2", :classroom=>"B2", :begins_at => 0.hour.from_now, :ends_at =>2.hour.from_now)
  Course.last.course_instances.last.exercise_groups.create(:name => "Ryhmä 1", :classroom=>"C3", :begins_at => 0.hour.from_now, :ends_at =>3.hour.from_now)
  Course.last.course_instances.last.exercise_groups.create(:name => "Ryhmä 2", :classroom=>"D4", :begins_at => 0.hour.from_now, :ends_at =>4.hour.from_now)
  }