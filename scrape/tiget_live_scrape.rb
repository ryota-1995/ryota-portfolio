require "open-uri"
require "mechanize"
require "active_support/all"

agent = Mechanize.new
agent.user_agent_alias = "Windows IE 9"

date = []
time = []
title = []
venue = []
url = []

i = 1

loop do
  page = agent.get("https://tiget.net/events?categories=29&page=#{i}")

  if page.present?
    url_elements = page.search('//div[contains(@class,"event-image")]/a/@href')

    url_elements.each do |url_ele|
      url.push(url_ele.inner_text.strip)
    end

    i += 1
  else
    break
  end
end

url.each do |ul|
  page = agent.get("https://tiget.net#{ul}")

  sleep 10

  date = page.search('//dl[@class="pg-event__detail__section"][2]/dd[@class="pg-event__detail__contents"]')
  title = page.search('//p[@class="lead"][1]/text()[2]')
  venue = page.search('//dl[@class="pg-event__detail__section"][3]/dd[@class="pg-event__detail__contents"]')
  time = page.search('//p[@class="lead"][1]/text()[4]')
  performers = page.search('//dl[@class="pg-event__detail__section"][1]/dd[@class="pg-event__detail__contents"]')

  time.each do |tm|
    live = Live.find_or_create_by(date: date.inner_text.strip, time: tm.inner_text.strip, title: title.inner_text.strip, place: venue.inner_text.strip, href: "https://tiget.net#{ul}")
    live.save
    performers.each do |performers|
      performer = Performer.find_or_create_by(live_id: live.id, performer: performer.inner_text.strip)
    end
  end
end
