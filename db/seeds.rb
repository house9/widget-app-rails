def create_test_widgets
  100.times do |i|
    Widget.create!(
      name: "Widget #{i}",
      sku: "SKU-#{i}"
    )
  end
end

def production_seed
  # no-op
end

def staging_seed
  create_test_widgets
end

def development_seed
  create_test_widgets
end

eval("#{Rails.env}_seed")
