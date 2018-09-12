#!/usr/bin/ruby
#
# https://github.com/eljojo/telegram_bot
#
mytoken = ''

require 'telegram_bot'

bot = TelegramBot.new(token: mytoken, logger: Logger.new(STDOUT))
bot.get_updates(fail_silently: false, timeout: 5) do |message|
  #puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)
  
  # Main Loop
  message.reply do |reply|
    reply.reply_markup = TelegramBot::ReplyKeyboardMarkup
      .new(keyboard: [%w(ping date provision Power/Delete)], one_time_keyboard: false, resize_keyboard: true)
    # command match 
    case command
    
    ## Date:
    when /date/i
      reply.text = `date`
    
    ## PING
    when /ping/i
      reply.text = 'PONG!'
    
    ## Shut/delete
    when /Power\/Delete/i
      reply.text = "Not implemented yet."

    ## Provision
    when /provision/i
      reply.text = "Qual compute resource ?"
      reply.reply_markup = TelegramBot::ReplyKeyboardMarkup
        .new(keyboard: [%w(VMware AWS Google)], one_time_keyboard: false, resize_keyboard: true)
    
    when /(VMware|AWS|Google)/i
      reply.reply_markup = TelegramBot::ReplyKeyboardMarkup
        .new(keyboard: [%w(Firewall AD HAProxy)], one_time_keyboard: false, resize_keyboard: true)
      reply.text = "Role: "




    ## If none
    else
      reply.text = "#{message.from.first_name}, #{command.inspect} command not found." 
    end

    # Return:
    #puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)

  end
end

