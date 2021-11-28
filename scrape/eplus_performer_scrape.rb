require "open-uri"
require "mechanize"

agent = Mechanize.new
agent.user_agent_alias = "Windows IE 9"
page = agent.get("https://eplus.jp/sf/live/idol")

#コンテンツの数を抽出
contents_counter = page.search('//*[@id="js-block-filter-modal"]/div/input/@value').inner_text

sleep 10
#ページの枚数を計算(1ページには50コンテンツしか出せない)
pages_counter = contents_counter.to_i / 50

#最後のページだけ、コンテンツ数を数える
last_page_content_counter = contents_counter.to_i % 50

i = 0
n = 1
count = 0

loop do
  #遷移
  date = page.search('//div[@class="ticket-item__left"]')[i]
  time = page.search('//div[@class="ticket-item__text"]')[i]
  title = page.search('//h3[@class="ticket-item__title"]')[i]
  place = page.search('//div[@class="ticket-item__venue"]')[i]
  href_str = page.search('//a[contains(@class,"ticket-item ticket-item--kouen")]/@href')[i].text
  page = page.link_with(:href => href_str).click

  #先着を消す、DBに入れる、空白を消す
  sleep 15

  #出演者を抽出
  performers = page.search('//span[contains(@class,"favorite-item__name")]')

  sleep 10

  if performers.empty?
  else
    performers.each do |performer|
      performer = Performer.find_or_create_by(live_id: live.id, performer: performer.inner_text.strip)
      performer.save
    end
  end
  #元の画面に戻る
  page = agent.get("https://eplus.jp/sf/live/idol/p#{n}")

  sleep 15

  #上の処理を50回繰り返した後は、コンテンツが50コリストされている次のページに遷移する。
  if i % 49 == 0 and i != 0
    href_str = page.search('//a[contains(@class,"block-paginator__nextprev--next")]/@href').text
    page = page.link_with(:href => href_str).click

    sleep 60

    #50コリストされている次のページに遷移したときは、iの値が0から始まるように数値調整
    i = -1
    n += 1
  end
  i += 1

  count += 1

  puts count

  if count == contents_counter
    break
  end
end
