class Notifier < ActionMailer::Base
  default from: "customer_service@cartoncanoe.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order, cartPrice)
    @order = order
	@cartPrice = cartPrice

    mail :to => order.email, :subject => 'Order Received'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order

    mail :to => order.email, :subject => 'Your Groceries Are Enroute'
  end
end
