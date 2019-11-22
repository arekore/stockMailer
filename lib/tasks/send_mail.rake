namespace :send_mail do
    desc "メールを送信する"
    task :send => :environment do

        users = User.where(sendFlag: 1)

        users.each do |user|
            SendMailMailer.send(user.mail).deliver
            update_lastSend(user.id)
        end

        private
            def update_lastSend(id)
                user = User.find(id)
                user.update_attributes(lastSend: Time.now)
            end
    end
end
