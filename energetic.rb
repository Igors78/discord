#!/usr/bin/env ruby
# frozen_string_literal: true

require 'discordrb'
require 'httparty'

bot = Discordrb::Commands::CommandBot.new token: 'ODgzNjQ0NjE3MTMwNjQ3NTYy.YTM8Lg.ZVuWbG2o1T2jgQyO5KUiwlSqrII',
                                          prefix: '!'

bot.mention { |event| event.respond 'Кто-то звал меня на помощь? Попробуй !help' }

bot.command :joke do |event|
  url = 'http://rzhunemogu.ru/RandJSON.aspx?CType=11'
  response = HTTParty.get(url)
  event << response.body.split('{"content":').last.chomp('}')
end

bot.command :insult do |event|
  url = 'https://evilinsult.com/generate_insult.php?lang=ru&type=text'
  response = HTTParty.get(url)
  event << response.parsed_response
end

bot.message(with_text: 'help') do |event|
  event.respond 'Бог поможет!'
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
