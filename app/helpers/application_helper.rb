# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def luontiaika
    a = Time.now
    hour = a.hour.to_s
    min = a.min.to_s
    if a.hour < 10
      hour = "0"+hour
      end
    if a.min <10
      min = "0"+min
    end
    aika = ""+a.day.to_s + "." + a.month.to_s + "." + a.year.to_s+" " +hour+":" + min
    return aika
  end
end
