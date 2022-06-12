[![Rails](https://img.shields.io/badge/Rails-v6.1.5-%23a72332)](https://rubygems.org/gems/rails/versions/6.1.5)

# 逆再生メッセージ「ちょっと何言ってるかわからない」
### https://www.chotto-wakaranai.com  
![ogp01](https://user-images.githubusercontent.com/85027739/167819606-3627e3d8-0a72-49e8-b146-6e2da75ad135.png)

## サービス概要
音声の「逆再生」と「録音」を活用したメッセージアプリです。  
逆再生後の「どんな意味か分からない言葉」を録音し、それをまた「逆再生」することで実際はどんな言葉だったかを知ることができます。  
普段のメッセージに一癖加えたり、クイズ感覚で遊んでいただくことを意図しています。

## メインのターゲットユーザー
- 10代〜20代前半の男女  
- TikTokやYouTubeを普段から見る属性の方  

## 画面：メイン機能について
|メッセージ入力画面|シェア画面|
| ------------------------------------------------------------------|--------------------------------------------------------------------|
| <img src="https://user-images.githubusercontent.com/85027739/173226761-b6eca294-d3d1-46a4-a6aa-d6ba6dec60ac.jpg">|<img src="https://user-images.githubusercontent.com/85027739/173226758-2fd44726-48e0-41c4-95a4-bc3c09118704.jpg">|
|・「ひらがな」で任意のメッセージを入力<br>・「保存して共有ページへ」を押下後、シェア画面へ遷移|・逆再生化された文字列を録音<br>・「逆再生」ボタンを押下後、変換前のメッセージ（今回は「ありがとう」）が聴こえます|

## 全体の機能
- 逆再生文字生成機能  
- 録音機能、音声の逆再生機能  
- Twitter、LINEへのシェア機能  
  ※動的にメッセージのOGP画像を生成  

## 苦労した点
ある文字列に対して「音声を逆再生した際に聴こえる言葉」へ変換する実装に苦労しました。  
結果的に下記の手順で変換することができました。
```
■「ありがとう」を逆再生化した文字列に変換する手順  
(1)「ありがとう」をローマ字化  
(2)「arigatou」に変換
(3)「arigatou」をreverseメソッドで反転  
(4)「uotagira」に反転  
(5)「uotagira」をひらがなに変換  
(6)「うおたぎら」※逆再生化した文字列の完成  
```
## こだわった点
「音声を逆再生した際に聴こえる言葉」に変換するGem `reverse_playback_word`を作成し、使用することでコードの記述量を削減しました。  
 [【Gem】GitHub：reverse_playback_word](https://github.com/symsk/reverse_playback_word)  
 [【Gem】RubyGems：reverse_playback_word](https://rubygems.org/gems/reverse_playback_word)

## 使用技術
### バックエンド
- Ruby 3.0.1  
- Rails 6.1.5  
### フロントエンド
- JavaScript  
### インフラ
- Heroku  
- PostgreSQL  
### API
- MediaStreamRecording API（録音機能）  

## ER図
<img width="843" alt="ER図" src="https://user-images.githubusercontent.com/85027739/170182022-c5f4a498-1215-42ab-9eac-7806933184e7.png">

## 画面遷移図
https://www.figma.com/file/ZBvJjiR69nUjkTuUjBEsX6/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA?node-id=0%3A1  
