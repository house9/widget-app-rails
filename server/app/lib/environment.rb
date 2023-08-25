module Environment
  def self.review_app?
    ENV['IS_PULL_REQUEST'].to_s == 'true'
  end
end
