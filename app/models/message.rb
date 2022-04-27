class Message < ApplicationRecord
  validates :message, presence: true, length: { minimum: 1, maximum: 50 }
  HIRAGANA_REGEXP = /\A[ぁ-んー－]+\z/
  validates :message, format: { with: HIRAGANA_REGEXP }
  validates :reverse_message, presence: true, length: { minimum: 1, maximum: 100 }
  
  def to_param
    uuid
  end

  def reverse_playback_text
    message.to_roma.reverse.
        gsub(/!|！|g$|m|t|y$|h$|b$|n|/, 
          "!|！" => "", 
          "g" => "gu", 
          "m" => "mu", 
          "t" => "tu", 
          "y" => "yu",
          "h" => "ti",
          "b" => "bu",
          "n" => "nn",
        ).to_kana.
        gsub(/g|r|k|h|ぢ|s|/,
          "g" => "ぐ", 
          "r" => "る",
          "k" => "く",
          "h" => "ひ",
          "ぢ" => "でぃ",
          "s" => "す",
        ).delete("a""b""c""d""e""f""g""h""i""j""k""l""m""n""o""p""q""r""s""t""u""v""w""x""y""z")
  end
end
