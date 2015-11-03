json.array!(@texts) do |text|
  json.extract! text, :id, :name, :content, :author, :date
  json.url text_url(text, format: :json)
end
