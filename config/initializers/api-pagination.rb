ApiPagination.configure do |config|
  config.paginator = :kaminari
  config.total_header = 'X-Pagination-Total'
  config.per_page_header = 'X-Pagination-Per-Page'
  config.page_header = 'X-Pagination-Page'
  config.page_param = :page
  config.per_page_param = :per_page
end
