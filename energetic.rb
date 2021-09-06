#!/usr/bin/env ruby
# frozen_string_literal: true

require 'discordrb'
require 'httparty'
require 'dotenv'

Dotenv.load

bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'],
                                          prefix: '!'

bot.mention { |event| event.respond 'Кто-то звал меня на помощь? Попробуй !help' }

bot.command :help do |event|
  event << '!weather = Погода в доме'
  event << '!joke = Похабная шутка'
  event << '!soft = Просто шутка'
  event << '!lyrics = Стишок'
  event << '!apho = Афоризм/История'
  event << '!quote = История/Цитата'
  event << '!tost = Тост/Здравица'
  event << '!status = (ДЕ)Мотиватор'
  event << '!oldstory = Похабная Афоризм/История'
  event << '!oldlyrics = Похабный Стишок'
  event << '!oldapho = Похабная История'
  event << '!oldcyto = Похабная Цитата'
  event << '!oldtost = Похабная Тост/Здравица'
  event << '!oldstat = Похабный (ДЕ)Мотиватор'
  event << '!insult = Оскорби меня!'

  # Here we don't have to worry about the return value because the `event << line` statement automatically returns nil.
end

bot.command :weather do |event|
  url = 'https://api.openweathermap.org/data/2.5/weather?q=Wolfsburg&lang=ru&appid=ec8a036c5345c0a48bf07fd7e218878c'
  response = HTTParty.get(url)
  event << response.name
  event << response.country
  event << response.value
end

bot.command(:joke, description: 'Похабная шутка...') do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=11'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :soft do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=1'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :lyrics do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=3'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :apho do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=4'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :quote do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=5'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :tost do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=6'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :status do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=8'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :oldstory do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=12'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :oldlyrics do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=13'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :oldapho do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=14'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :oldcyto do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=15'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :oldtost do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=16'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :oldstat do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=18'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :insult do |event|
  url = 'https://evilinsult.com/generate_insult.php?lang=ru&type=text'
  response = HTTParty.get(url)
  event << response.parsed_response
end

bot.message(with_text: 'help') do |event|
  event.respond 'Научи меня, и Я помогу!'
end

bot.message(with_text: 'help!') do |event|
  event.respond 'Зайдите на неделе!'
end

bot.message(with_text: 'help!!') do |event|
  event.respond 'Ушёл на базу!'
end

bot.message(with_text: 'help!!!') do |event|
  event.respond 'Без формы 0978-345х не обслуживаем!'
end

# This method call has to be put at the end of your script, it is what makes the bot actually connect to Discord. If you
# leave it out (try it!) the script will simply stop and the bot will not appear online.
bot.run
