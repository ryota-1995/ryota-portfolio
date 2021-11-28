require "open-uri"
require "mechanize"
require "active_support/all"

agent = Mechanize.new
agent.user_agent_alias = "iPad"
page = agent.get("https://eplus.jp/sf/live/idol/p5")

sleep 20

date = []
time = []
title = []
venue = []
url = []

date_elements = page.search('//div[@class="ticket-item__left"]')
time_elements = page.search('//div[@class="ticket-item__text"]')
title_elements = page.search('//h3[@class="ticket-item__title"]')
venue_elements = page.search('//div[@class="ticket-item__venue"]')
url_elements = page.search('//a[contains(@class,"ticket-item ticket-item--kouen")]/@href')

date_elements.each do |date_ele|
  date.push(date_ele.inner_text.strip)
end

time_elements.each do |time_ele|
  time.push(time_ele.inner_text.strip)
end

title_elements.each do |title_ele|
  if title_ele.inner_text.include?("先着")
    title.push(title_ele.inner_text.strip.delete!("先着"))
  else
    title.push(title_ele.inner_text.strip)
  end
end

venue_elements.each do |venue_ele|
  venue.push(venue_ele.inner_text.strip)
end

url_elements.each do |url_ele|
  url.push(url_ele.inner_text.strip)
end

date.zip(time, title, venue, url) do |dt, tm, tt, vn, ul|
  live = Live.find_or_create_by(date: dt, time: tm, title: tt, place: vn, href: "https://eplus.jp#{ul}")
  live.save

  page = agent.get("https://eplus.jp#{ul}")

  sleep 20

  performers = page.search('//span[contains(@class,"favorite-item__name")]')
  if performers.present?
    performers.each do |performer|
      performer = Performer.find_or_create_by(live_id: live.id, performer: performer.inner_text.strip)
      performer.save
    end
  end
end
