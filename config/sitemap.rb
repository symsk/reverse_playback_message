# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.chotto-wakaranai.com"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV["S3_BUCKET_KEY"]}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV["S3_BUCKET_KEY"],
  aws_access_key_id: ENV["S3_ACCESS_KEY"],
  aws_secret_access_key: ENV["S3_SECRET_KEY"],
  aws_region: "ap-northeast-1",
)

SitemapGenerator::Sitemap.create do
  add root_path
  add new_message_path
  add quizzes_path
  add guide_path
  add message_sample_path
end
