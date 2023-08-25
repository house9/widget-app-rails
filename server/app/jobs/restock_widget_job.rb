class RestockWidgetJob < ApplicationJob
  queue_as :default

  def perform(args)
    widget_id = args.fetch(:widget_id)
    widget = Widget.find(widget_id)
    widget.update(inventory_count: (1..1000).to_a.sample)
  end
end
