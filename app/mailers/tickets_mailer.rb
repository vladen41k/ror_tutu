class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user_id = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end
  def delete_ticket(user, ticket)
    @user_id = user
    @ticket = ticket
    mail(to: user.email, subject: 'Билет был удалён')
  end
end
