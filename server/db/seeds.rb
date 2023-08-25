raise 'Seeds are not allowed in production' if Rails.env.production?

100.times do |i|
  Widget.create!(
    name: "Widget #{i}",
    sku: "SKU-#{i}"
  )
end
