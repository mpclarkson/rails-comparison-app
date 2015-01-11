json.array!(@affiliate_programs) do |affiliate_program|
  json.extract! affiliate_program, :id, :name, :display_name, :description
  json.url affiliate_program_url(affiliate_program, format: :json)
end
