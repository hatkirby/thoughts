class Blog < Entry
  validates :title, :body, presence: true
end

