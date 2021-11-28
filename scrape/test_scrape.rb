require "open-uri"
require "mechanize"

agent = Mechanize.new
agent.user_agent_alias = "Windows IE 9"

date = []
time = []
title = []
venue = []
url = []

i = 41

loop do
  page = agent.get("https://tiget.net/events?categories=29&page=#{i}")

  sleep 10
  last = page.search('//div[@class="hidden-xs"]//nav[@class="pagination"]/span[@class="last"]/a/@href')

  url_elements = page.search('//div[contains(@class,"event-image")]/a/@href')

  url_elements.each do |url_ele|
    url.push(url_ele.inner_text.strip)
  end
  if last.present?
    i += 1
    puts i
  else
    puts "最後の行に到達したので、ループを抜けます。"
    break
  end
end

puts url
