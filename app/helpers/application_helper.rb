# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def luontiaika
    a = Time.now
    aika = ""+a.day.to_s + "." + a.month.to_s + "." + a.year.to_s+" " +a.hour.to_s+":" + a.min.to_s
    return aika
  end
end
