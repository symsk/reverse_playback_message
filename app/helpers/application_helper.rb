module ApplicationHelper
  def default_meta_tags
    {
      site: 'ちょっと何言ってるか分からない',
      title: '逆再生メッセージ「ちょっと何言ってるか分からない」',
      reverse: true,
      separator: '|',
      description: 'メッセージやキーワードなどを逆再生化して解読してもらうアプリです。',
      keywords: '逆再生,メッセージ,ちょっと何言ってるか分からない',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description, 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      }
    }
  end
end
