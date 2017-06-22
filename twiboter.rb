# require "twitter"
require "nokogiri"
require "open-uri"

# twitter API
=begin
client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'Your API'
  config.consumer_secret = 'Your API'
  config.access_token = 'Your API'
  config.access_token_secret = 'Your API'
end
=end


puts "為替チェッカー"
puts "調べたい為替を入力してください。（海外→日本にする場合のみ調べられます)"
name = gets.chomp

# Nokogiri
if name == "ドル"
  url = 'https://info.finance.yahoo.co.jp/fx/detail/?code=USDJPY=FX'
elsif name == "ユーロ"
  url = 'https://info.finance.yahoo.co.jp/fx/detail/?code=EURJPY=FX'
elsif name == "ポンド"
  url = 'https://info.finance.yahoo.co.jp/fx/detail/?code=GBPJPY=FX'
end
doc = Nokogiri::HTML(open(url))

case name
when "ドル"
  bid = doc.xpath("//*[@id='USDJPY_detail_bid']").text
  ask = doc.xpath("//*[@id='USDJPY_detail_ask']").text
  puts "売値:#{bid} 買値#{ask}"
when "ユーロ"
  bid = doc.xpath("//*[@id='EURJPY_detail_bid']").text
  ask = doc.xpath("//*[@id='EURJPY_detail_ask']").text
  puts "売値:#{bid} 買値#{ask}"
when "ポンド"
  bid = doc.xpath("//*[@id='GBPJPY_detail_bid']").text
  ask = doc.xpath("//*[@id='GBPJPY_detail_ask']").text
  puts "売値:#{bid} 買値#{ask}"
else
  puts "現在登録されてません。"
end

=begin
clinet.text("今の株価")
client.update("売値:#{bid} 買値:#{ask}")
=end
