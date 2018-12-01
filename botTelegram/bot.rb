require 'telegram/bot'
require_relative 'descarga'

token = '791523852:AAFiIx3_RHO0DJLDcD77VWTxqBja-p9gSrU'

#file = descarga('https://www.youtube.com/watch?v=BfSAvH2fGkEL')

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    #case message.text
    # when '/start'
    #   bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    # when '/audio'
      file = descarga(message)
      bot.api.send_audio(chat_id: message.chat.id, audio: Faraday::UploadIO.new("#{file}", 'audio/mp3'))
      borrar
    #end
  end
end
