json.extract! item, :id, :name, :description, :issue_date, :net, :total_iva, :amount, :created_at, :updated_at
json.url item_url(item, format: :json)
