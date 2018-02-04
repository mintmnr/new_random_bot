# frozen_string_literal: true

desc 'run'
task :run do
  create_chats
end

desc 'Create chats'
task :create_chats do
  Settings.chat_ids.each do |chat_id|
    Chat.create(chat_id: chat_id)
  end
end
