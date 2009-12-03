xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Ilmo2.0 Newsfeed"
    xml.description "Ilmo2.0 Newsfeed"
    xml.link courses_url

    for feed in @newsfeed
      xml.item do
        xml.title feed.message
        xml.pubDate feed.created_at.to_s(:rfc822)
      end
    end
  end
end
