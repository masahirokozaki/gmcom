json.extract! comm, :id, :name, :image, :content, :created_at, :updated_at
json.url comm_url(comm, format: :json)