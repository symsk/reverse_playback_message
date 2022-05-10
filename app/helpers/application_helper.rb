module ApplicationHelper
  def default_meta_tags
    {
      title: '逆再生メッセージ「ちょっと何言ってるかわからない」',
      description: 'メッセージやキーワードを逆再生化し、解読してもらうアプリです！',
      keywords: '逆再生,メッセージ,ちょっと何言ってるかわからない,ちょっと何言ってるか分からない',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
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
