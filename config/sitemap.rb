SitemapGenerator::Sitemap.default_host = 'http://styly.herokuapp.com/'
if Rails.env.production?
  SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
    fog_provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    fog_directory: ENV['S3_BUCKET_NAME'],
    fog_region: 'ap-northeast-1')
  SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['S3_BUCKET_NAME']}.s3.amazonaws.com/"
  SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
end

SitemapGenerator::Sitemap.create do
  add root_path, priority: 0.9, changefreq: 'daily'

  Owner.find_each do |owner|
    add owner_path(owner), lastmod: owner.updated_at, priority: 0.9
  end

  Coordinate.find_each do |coordinate|
    add coordinate_path(coordinate), lastmod: coordinate.updated_at, priority: 0.9
  end
end
