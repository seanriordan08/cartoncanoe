atom_feed do |feed|
	feed.title "ReciPower: Product Orders"
	
	latest_order = @orders.sort_by(&:updated_at).last
	feed.updated( latest_order && latest_order.updated_at )
	
	@orders.each do |order|
		feed.entry(order) do |entry|
			entry.title "#{order.prefix} #{order.first_name} #{order.last_name}"
			entry.summary :type => 'xhtml' do |xhtml|
				xhtml.br "Deliver to: #{order.address} "
				xhtml.br "Phone #:"+"#{order.phone_number}"
				xhtml.br "Email: #{order.email}"
				
				xhtml.table do
					xhtml.tr do
						xhtml.th 'Product'
						xhtml.th 'Brand'
						xhtml.th 'Description'
						xhtml.th 'Quantity'
						xhtml.th 'Price'
					end
					order.line_items.each do |item|
						xhtml.tr do
							xhtml.td item.product.title
							xhtml.td item.product.brand
							xhtml.td item.product.description
							xhtml.td item.quantity
							xhtml.td number_to_currency item.total_price
						end
					end
					xhtml.tr do
						xhtml.th 'Total', :colspan => 4
						xhtml.th number_to_currency(order.line_items.map(&:total_price).sum)
					end
				end
				
				xhtml.p "Payment Selection: #{order.pay_type}"
				end
				entry.author do |author|
					entry.name order.first_name
					entry.email order.email
				end
			end
		end
	end