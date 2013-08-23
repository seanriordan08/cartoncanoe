class AddAcceptTermsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :accept_terms, :string
  end
end
