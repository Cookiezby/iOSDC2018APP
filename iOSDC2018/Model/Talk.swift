//
//  Talk.swift
//  iOSDC2018
//
//  Created by cookie on 2018/8/11.
//  Copyright © 2018 zhubingyi. All rights reserved.
//

import Foundation

enum Track: String {
    case A = "A"
    case B = "B"
    case C = "C"
    case D = "D"
    case E = "E"
    case F = "F"
}

struct Proposal {
    let id: Int
    let speaker: String
    let profileImageURL: String
    let track: Track
    let title: String
    let abstract: String
    let startTime: Int
    let seconds: Int
    let twitterLink: String
    let twitterName: String
    
    static let all: [Proposal] = [
        Proposal(id: 0,
                speaker: "西谷圭介",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/a671c733-f784-4e63-847d-6688a7521f62.jpeg",
                track: Track.C,
                title: "リアルタイム革命",
                abstract: """
チャットに代表されるリアルタイムなアプリケーションを皆さんはどのように開発していますか？リアルタイムな双方向通信をサポートするソリューションを利用したり、Socket.ioなどを用いてWebSocketで自前で構築するなどあると思います。本セッションでは新たなクエリ言語として注目されるGraphQLのSubscriptionを用いる方法をGraphQLのマネージドサービスであるAWS AppSyncとあわせてご紹介します。
""",
                startTime: 1535682000,
                seconds: 1800,
                twitterLink: "https://twitter.com/Keisuke69",
                twitterName: "Keisuke69"),


        Proposal(id: 1,
                speaker: "Kazumasa Kumamoto",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/df547841-ac92-48c4-951a-46efad4b4563.jpg",
                track: Track.C,
                title: "Charles でネットワークデバッギング",
                abstract: """
「API から何が返ってきているかわからない」「色々なパターンの返り値の表示を見てみたい」といった経験はないでしょうか？

Charles なら、通信の中身を確認することができるだけでなく、リクエスト/レスポンスの編集、リクエスト先の変更など、アプリ開発のデバッグに便利な機能を使うことができます。

この記事では Charles を使ったことがない人向けに、 Charles の基本的な使いかたと使いどころについてご紹介します。
""",
                startTime: 1535776200,
                seconds: 900,
                twitterLink: "https://twitter.com/kumamo_tone",
                twitterName: "kumamo_tone"),


        Proposal(id: 2,
                speaker: "ezura",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/253157d3-c224-4947-b479-f49aa9af262a.jpg",
                track: Track.B,
                title: "気遣いの iOS programming",
                abstract: """
ちょっとした気遣いの積み重ねが人に優しく美しいコードを支えます。
「Swift という素晴らしい言語の力を存分に使い、人を導くコードを書く」「UIKit の癖とうまく付き合う」
これらを実現する、今すぐ小さく始められる、コード上での気遣いのテクニックをお話しします。
(iOS 開発における初級者向けセッションです)
""",
                startTime: 1535786400,
                seconds: 900,
                twitterLink: "https://twitter.com/eduraaa",
                twitterName: "eduraaa"),


        Proposal(id: 3,
                speaker: "taitodada",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/f69c0b90-4feb-4ed6-8636-c0c73f70da58.jpg",
                track: Track.A,
                title: "App Reviewの不確実性に向き合う",
                abstract: """
Kyash社でのリリースサイクルについて、下記を交えてながら話ができればと思っています

- リリース日が明確に決められているビッグリリースがある時の方針
- AppleのReviewerがどういうタイミングでログインしているかログを取っているので、その開示
- ひどいReviewerにあたってしまった時のやり取りログ
""",
                startTime: 1535878200,
                seconds: 300,
                twitterLink: "https://twitter.com/taitodada4",
                twitterName: "taitodada4"),


        Proposal(id: 4,
                speaker: "ken0nek",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/6902c1df-f1d1-474e-a246-d6ba72aa68c9.jpg",
                track: Track.B,
                title: "あなたの知らないMeasurementとUnitの世界",
                abstract: """
MeasurementとUnitは、iOS10からFoundationフレームワークに追加された、数量と単位を扱う仕組みです。
これらを使うことで、国や地域ごとに単位の表示を気にすることなくアプリを開発できるようになります。
特に、世界展開してるアプリやヘルスケア・ワークアウト系のアプリと相性が良いです。
このトークでは、MeasurementとUnitの基本から発展的なカスタマイズ方法まで紹介します。
""",
                startTime: 1535789700,
                seconds: 300,
                twitterLink: "https://twitter.com/ken0nek",
                twitterName: "ken0nek"),


        Proposal(id: 5,
                speaker: "Keisuke Tada",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/d2f9e9f9-8a69-47f0-84c2-6fc3753b39a7.jpeg",
                track: Track.D,
                title: "Haptic Feedback による効果的なマイクロインタラクション",
                abstract: """
登場から早2年、もはや Haptic Feedback も含めた UI が必須と言っても過言ではありませんが、効果的に用いている事例もまだ多くないのが現状です。このトークでは、具体的な事例や HIG などから、効果的な Haptic Feedback のための考え方や、具体的なガイドライン、また、実装の tips も取り上げます。このトークを聞けば、誰でもすぐに効果的な	 Haptic Feedback を組み込むことができるはずです。
""",
                startTime: 1535706000,
                seconds: 900,
                twitterLink: "https://twitter.com/tdksk",
                twitterName: "tdksk"),


        Proposal(id: 6,
                speaker: "Yutaro Muta",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/d8bb3476-ff17-4fab-b313-ceae253e749c.jpg",
                track: Track.A,
                title: "weak vs unowned",
                abstract: """
Swiftを扱う上で度々議論となるweakとunownedによるキャプチャ。「確実にクラッシュを防げるweakの方がよい」、「unownedの方がパフォーマンスが優位である」よく聞く意見ではありますが、それは本当なのでしょうか。なぜメモリリークが起こるのかを復習して、両者のメリット/デメリットを再整理し、実コードにおける使い分け方を考え直してみようと思います。
""",
                startTime: 1535873100,
                seconds: 300,
                twitterLink: "https://twitter.com/yutailang0119",
                twitterName: "yutailang0119"),


        Proposal(id: 7,
                speaker: "Takezawa Toshiki",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/b31ce1a9-6f90-48ad-b798-c8202f7e1440.jpg",
                track: Track.A,
                title: "(続)カンファレンスアプリを改善した！！",
                abstract: """
昨年度のLTで話したカンファレンスアプリをアップデートしました。
https://iosdc.jp/2017/node/1545

本LTでは下記の内容を話します
- 数々のカンファレンスアプリをパり、いや参考にし必要な機能、不要な物を洗い出し機能を研ぎ澄ました
- 顧客が求めているカンファレンスアプリとは一体何だろうか
- POとの色々(認識のずれ、譲れないお互いの意見)
""",
                startTime: 1535872800,
                seconds: 300,
                twitterLink: "https://twitter.com/to4iki",
                twitterName: "to4iki"),


        Proposal(id: 8,
                speaker: "大西 正恭",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/645fa4cd-e5e0-427a-ab29-8ee576fa0c48.jpeg",
                track: Track.D,
                title: "教育・企業におけるデバイス管理手法について",
                abstract: """
情報端末は会社にとって大切な資産であり、大切な情報も取り扱うため、適切に管理を行う必要があります。
端末管理を適切に行うことで、
・情報セキュリティ対策
・ライセンス管理
・コスト削減につながる端末の稼働状況の確認および棚卸業務の最適化
などが可能となります。

中々世に出てこないiOS(Android)のデバイスをどのように管理・運用していくと良いのかをご紹介します。
""",
                startTime: 1535865600,
                seconds: 900,
                twitterLink: "https://twitter.com/kenchan0130",
                twitterName: "kenchan0130"),


        Proposal(id: 9,
                speaker: "にわタコ",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/d2e4a086-aec2-4274-b34d-5771d27afae1.jpg",
                track: Track.C,
                title: "スマホアプリエンジニアだから知ってほしいブロックチェーンと分散型アプリケーション",
                abstract: """
数年以内に、皆さんのうちの何割かは、WebやクラウドのAPIを叩くのではなく、ブロックチェーンを叩くアプリケーションを開発するようになるでしょう。そして皆さんのうちほぼ全員が、そのようなアプリケーションを利用するようになるでしょう。
分散型アプリケーションクライアントとしてのiOSアプリの未来を、実際にブロックチェーンサイドとクライアントサイドでプログラムを見ながらご紹介します。
""",
                startTime: 1535689800,
                seconds: 1800,
                twitterLink: "https://twitter.com/niwatako",
                twitterName: "niwatako"),


        Proposal(id: 10,
                speaker: "tummy",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/cbe7eec3-3279-42a9-b041-ab9d0134b1b5.jpg",
                track: Track.C,
                title: "GraphQL on Swift",
                abstract: """
apollo-ios や GraphQLSwift/GraphQL といったライブラリを使うと、GraphQL を使ったクライアントアプリや GraqhQL サーバを実装することができます。
このトークでは、クライアントとサーバの両面から GraphQL について触れつつ、ライブラリを利用した実装方法や実際にプロジェクトで利用した際の注意点などをお話できればと思います。
""",
                startTime: 1535704800,
                seconds: 1800,
                twitterLink: "https://twitter.com/bird_tummy",
                twitterName: "bird_tummy"),


        Proposal(id: 11,
                speaker: "cokaholic",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/1d38d33a-3817-4d28-8d6e-83cebda1039f.jpg",
                track: Track.D,
                title: "とある端末の触覚技術 -フィードバック-",
                abstract: """
iPhoneの画面上で3DTouchを行うと、ブルッと端末が震えるフィードバックを返してくれます。
フィードバックが返ってくると、なんとなく気持ち良いですよね笑
その気持ち良いフィードバックは、iPhoneに搭載されている「Taptic Engine」によって実現されています。
このトークでは「Taptic Engine」とはどういった技術で、
どのような場面で使用すれば良いのかという話をします。
""",
                startTime: 1535694000,
                seconds: 900,
                twitterLink: "https://twitter.com/TK_u_nya",
                twitterName: "TK_u_nya"),


        Proposal(id: 12,
                speaker: "aboy",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/6ef6e1f9-5ff6-446c-8508-86f8be946896.jpg",
                track: Track.A,
                title: "＠cosmeアプリにおけるTextureの活用",
                abstract: """
＠cosmeアプリではAutolayoutやUIStackViewをゴリゴリ使って画面を作成しています。そんな＠cosmeアプリに部分的にTextureを導入し、画面のパフォーマンスを改善しましたので、その知見を共有します。
""",
                startTime: 1535791800,
                seconds: 300,
                twitterLink: "https://twitter.com/suxisuxido",
                twitterName: "suxisuxido"),


        Proposal(id: 13,
                speaker: "Takatsu Youichi",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/74df2073-6f27-4732-9b69-86158bce6cdc.jpg",
                track: Track.B,
                title: "作ってわかるレンダリングパイプライン　CPUで3D描画",
                abstract: """
ある人は言いました。「基本は理解・分解・再構築だ」と。

あなたは玩具や機械の仕組みを知るために分解してみたことはありませんか？
一見不思議で魔法のように見える仕組みも、基本要素に分解すれば理解しやすくなります。
そして理解したかどうか確認する最も良い手段は自分で作ってみることです。

ここでは普段Metalなどの3D描画APIがGPUで行っている処理をあえてCPUで実装し、期待通りに描画されるのかを検証してみます。
""",
                startTime: 1535865600,
                seconds: 1800,
                twitterLink: "https://twitter.com/ta_ka_tsu",
                twitterName: "ta_ka_tsu"),


        Proposal(id: 14,
                speaker: "paper_and_paper",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/e1185a7a-78ff-422c-aa04-9a51356a995d.png",
                track: Track.C,
                title: "TextKitから表現が広がる",
                abstract: """
TextKitはiOS7から導入されたテキスト用のレンダリングエンジンです。これのおかげによって、低レベルのAPIを格闘することなく、開発でも難しいテキストでも比較的容易にレイアウトを描画できるようになっています。本トークでは、実際にデザイナーとあった話をもとに、文字列デザインをフォーカスして行きます。
""",
                startTime: 1535853000,
                seconds: 900,
                twitterLink: "https://twitter.com/paper_and_paper",
                twitterName: "paper_and_paper"),


        Proposal(id: 15,
                speaker: "Kimi",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/223cd44a-7c1d-435d-9803-3b78af69d407.jpg",
                track: Track.A,
                title: "Working in a multi-cultural environment with a global app",
                abstract: """
There are many difficulties and fun when providing on code base of iOS app to serve for many countries with different features, and communicating with colleagues in different locales...
""",
                startTime: 1535622000,
                seconds: 900,
                twitterLink: "https://twitter.com/KimiNg7",
                twitterName: "KimiNg7"),


        Proposal(id: 16,
                speaker: "仲裕介",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ff65ea04-7c47-44f4-92b1-2c009b341d24.jpeg",
                track: Track.D,
                title: "あえてWebエンジニア以外の人に聞いてほしいWebRTCの話",
                abstract: """
WebRTCはWebの領域にとどまらず、リアルタイムコミュニケーションの標準技術として、サーバサイド、VR、IoTなど、新しいシーンで活用されるようになってきています。本セッションでは技術的な観点から、WebRTCをそれら新しいシーンに適用するにあたっての課題や、それを解決するための手法について話をします。
""",
                startTime: 1535868600,
                seconds: 1800,
                twitterLink: "https://twitter.com/Tukimikage",
                twitterName: "Tukimikage"),


        Proposal(id: 17,
                speaker: "Ryo Usami",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ca965dae-c6c2-4346-96d6-57933607fc2e.jpg",
                track: Track.B,
                title: "標準アプリから学ぶ、HIGが教えてくれないiOSデザインのこと",
                abstract: """
Apple Human Interface Guideline (HIG) では、iOS App をデザインする上での考え方を学ぶことができます。それ以外にも Apple がデザインをした標準アプリから知れることが数多くあります。このトークでは、Large Title や 新しいモーダルビューなど HIG を読むだけでは分からない具体的な UI の考え方についてご紹介します。
""",
                startTime: 1535620800,
                seconds: 900,
                twitterLink: "https://twitter.com/usa619_",
                twitterName: "usa619_"),


        Proposal(id: 18,
                speaker: "takashings",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ca80e126-9acd-413c-8543-6d653820b8a8.jpg",
                track: Track.A,
                title: "iOS技術本を出版した時の失敗談",
                abstract: """
先日、iOSの技術本を出版社から出版しました。
あまり失敗談をメインにした発表はないかと思うので、今回の出版で得た知見を失敗談をメインに発表します。

昨今はクラウドファンディング、自費出版など本を出版する敷居も下がっているかと思います。
これから技術本を書いてみたい、出版してみたいと少しでも思われている方に対しても知見を共有できればと思います。
""",
                startTime: 1535789400,
                seconds: 300,
                twitterLink: "https://twitter.com/takashings",
                twitterName: "takashings"),


        Proposal(id: 19,
                speaker: "GotouReiko",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/b44751f4-d68a-46c9-876c-39b1072ad904.jpg",
                track: Track.B,
                title: "タイムアタック！5分でiOSアプリ作ります",
                abstract: """
5分という時間でiOSアプリを１つ作ります。
厳密にはStoryBoardはもう組まれている状態で、VCのコーディングの部分をやります。
iosdcで起きた面白かった事に関するクイズアプリとか。やること自体は非常に簡単な事をしますので、バタバタしながら作って会場を盛り上げられればと思います。
パニックにならなければできるくらいの内容を考えてますが、パニックになったらできないくらいのところを攻めたいです。
""",
                startTime: 1535792100,
                seconds: 300,
                twitterLink: "https://twitter.com/burakon",
                twitterName: "burakon"),


        Proposal(id: 20,
                speaker: "Jiro Nagashima",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/61a9e25c-f5f9-487b-b17c-b16de37f3f15.jpeg",
                track: Track.D,
                title: "UIViewPropertyAnimatorで実現するリッチなアニメーション表現",
                abstract: """
UIKitのアニメーション表現は、UIViewPropertyAnimatorの登場により自由度が向上しました。UIViewPropertyAnimatorを画面遷移のアニメーションに応用することで、インタラクティブなアニメーションが実現できるだけでなく、複数のアニメーションを連動させることも可能となります。このトークでは、UIViewPropertyAnimatorを利用した画面遷移のアニメーションの実装例をご紹介しします。
""",
                startTime: 1535866800,
                seconds: 900,
                twitterLink: "https://twitter.com/hedjirog",
                twitterName: "hedjirog"),


        Proposal(id: 21,
                speaker: "Nagado",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/3e602196-6d5e-42bc-afbb-4987e4acc8dc.jpg",
                track: Track.C,
                title: "MusicアプリのTransitionを再現する",
                abstract: """
iPhone にプリインストールされているアプリの中でも、 Music アプリの Modal Transition が良い感じですね。Githubなどで探してみると、ほぼ完全に再現してみせているライブラリやサンプルコードがいくつかあるのですが、コードを見てみるとすごく難しそうな印象が…。そこで、Musicアプリのような Modal Transition をより簡単に再現する方法を模索してみて、得られた知見をお話します。
""",
                startTime: 1535695800,
                seconds: 1800,
                twitterLink: "https://twitter.com/kzmsngd",
                twitterName: "kzmsngd"),


        Proposal(id: 22,
                speaker: "Kishikawa Katsumi",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/70bea3f2-bced-4eed-85a0-6d48e746d8ec.jpg",
                track: Track.A,
                title: "デバイス・OSバージョンの依存が少なく、メンテナンスしやすいビューを作る",
                abstract: """
iOSアプリにおいてビューに関する変更をテスト・レビューすることは負荷の高い作業のひとつです。現在のiOSアプリにおいてレイアウトのバッドプラクティスは、デバイスを判定する、contentInsetを自分で操作する、動的に制約を変更する、の３つです。このトークでは、実際のアプリのコードを用いて、壊れやすかったレイアウトを良いAutoLayoutの原則に従って修正した例を示し、堅牢でメンテナンスしやすいレイアウトとは何かを解説します。
""",
                startTime: 1535862600,
                seconds: 1800,
                twitterLink: "https://twitter.com/k_katsumi",
                twitterName: "k_katsumi"),


        Proposal(id: 23,
                speaker: "Hato Yuji",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/f70ce412-d09d-4c45-b0cf-941f762fe031.jpg",
                track: Track.B,
                title: "動画アプリをなめらかに動かす技術",
                abstract: """
近年、動画サービスが盛り上がりを見せています。
単に動画を再生するだけなら簡単ですが、なめらかなUI/UXの実現や複数動画再生の制御、エラーハンドリングなど
実際のサービスでは考慮すべきことが多々あります。
iOSでAVPlayerを使った動画再生の知見についてお話したいと思います。
""",
                startTime: 1535701800,
                seconds: 900,
                twitterLink: "https://twitter.com/dekatotoro",
                twitterName: "dekatotoro"),


        Proposal(id: 24,
                speaker: "所友太",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/8faab7c8-45c9-429b-b605-cb92d114bfe5.jpg",
                track: Track.D,
                title: "tvOSアプリUIの勘所",
                abstract: """
tvOSアプリはUIKitを利用してiOSアプリと同じ感覚で実装できます。ただ、実際に実装していくとフォーカスの考え方など、tvOSアプリ独自の概念を考慮しつつUI設計を進めていかならければならないことがわかってきます。そのあたり、実際に業務としてtvOSアプリを作りながら得られた知見を、WWDC 2018で発表されたtvOS 12で加わったTVUIKitなどを絡めて紹介できればと思います。
""",
                startTime: 1535701800,
                seconds: 900,
                twitterLink: "https://twitter.com/tokorom",
                twitterName: "tokorom"),


        Proposal(id: 25,
                speaker: "竹田光佑",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/26fd8448-1734-4be8-8617-6fc8a1b3d53f.jpg",
                track: Track.A,
                title: "WebSocketによるビデオ通話",
                abstract: """
ビデオ通話を実装するにあたり、一般的なWebRTCを用いる代わりに、WebScoketを用いて実装した例をアーキテクチャを示します。WebSocketを用いることで手軽に複数人のビデオ通話が実現できます。また、ビデオ通話をWebRTCとWebSocketで実装した時の利点と欠点を比較します。
""",
                startTime: 1535875800,
                seconds: 300,
                twitterLink: "https://twitter.com/daketake",
                twitterName: "daketake"),


        Proposal(id: 26,
                speaker: "k_miyasaka",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/6fb0eaa7-7a4c-46c8-8892-d960314edc56.jpg",
                track: Track.B,
                title: "LLDBを最大限活用してみる。",
                abstract: """
XCODEのデバッグ機能は便利で、スタックトレースとpoコマンドの入力だけでもゴリゴリとデバッグできる方が多くいらっしゃると思いますが、
それらはLLDBの機能の氷山の一角です。
不具合の原因検知、修正だけでなく、
リビルドせずにコンソールからUIを変更するなど新規コーディングでも活用できる方法を発表致します。
""",
                startTime: 1535868600,
                seconds: 900,
                twitterLink: "https://twitter.com/k_miyasaka_",
                twitterName: "k_miyasaka_"),


        Proposal(id: 27,
                speaker: "へんてこ",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/1fad4821-53b5-47e8-91e4-af38ec8a1968.jpg",
                track: Track.C,
                title: "iOSでSwitchの複数ディスプレイ配置調整を実装してみた",
                abstract: """
先日任天堂から発表されたマリオパーティーのゲーム内で実装されている、複数のSwitchを並べた時にディプレイ間の位置を調整する素晴らしい機能を、iOSでも実装した結果を発表します。
リリースするアプリでこの技術を使おうとすると既に任天堂が特許を持っているので注意が必要です。
""",
                startTime: 1535766600,
                seconds: 900,
                twitterLink: "https://twitter.com/henteko07",
                twitterName: "henteko07"),


        Proposal(id: 28,
                speaker: "六々",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/865f0036-3b77-41b6-b08f-8147ecb2da84.gif",
                track: Track.B,
                title: "UIViewとUITextInputで作る縦書きのTextView",
                abstract: """
UITextViewを使わずにUITextViewのようなViewを作ることで縦書きテキストエディタを作った話。

UITextViewのあの機能が実はUITextInput由来だったりといった話や、IME周りの挙動をAndroidやUWP, Windows / macOS / Gtkで同様の縦書きエディタを作った経験を交えてお話しします。
""",
                startTime: 1535785200,
                seconds: 900,
                twitterLink: "https://twitter.com/496_",
                twitterName: "496_"),


        Proposal(id: 29,
                speaker: "こにふぁー",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/88e0af65-bfab-4e94-91ca-0a065ec67a20.jpg",
                track: Track.A,
                title: "DroidKaigi 2018 iOS appのApple審査が通るまで",
                abstract: """
DroidKaigi 2018のiOSアプリをリリースしました。DroidくんアイコンやAndroid文字列が含まれることによるReject、初めての特急申請など、iOSアプリエンジニアにとっては日常茶飯事かもしれないことに面食らいつつも奇跡的に当日までに審査が通った時の話をしたいと思います。
""",
                startTime: 1535875200,
                seconds: 300,
                twitterLink: "https://twitter.com/konifar",
                twitterName: "konifar"),


        Proposal(id: 30,
                speaker: "加賀江 優幸",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/e9877728-470c-4a69-a186-229abe9134c0.jpg",
                track: Track.B,
                title: "Auto-Renewable Subscriptionsを5年間運用した歴史から学ぶ注意点",
                abstract: """
私の担当するアプリでは、Auto-Renewable Subscriptionsを長らく運用してきました。
しかし、その運用を続ける上でぶつかった問題も多くありました。
Auto-Renewable Subscriptionsの運用事例を元に、ユーザにとって最高の形でプレミアムな機能を提供するために学んだことについてお話します。
""",
                startTime: 1535776200,
                seconds: 1800,
                twitterLink: "https://twitter.com/yuutetu",
                twitterName: "yuutetu"),


        Proposal(id: 31,
                speaker: "Yusuke Hosonuma",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/c16a074b-5227-402d-8ba1-f469f6be3b06.jpg",
                track: Track.B,
                title: "Swift 4.2 はどのような進化をしているのか",
                abstract: """
Xcode 10 から Swift 4.2 に変更となりますが、変更点のチェックはお済みでしょうか？
CfPを出す現時点で Swift 4.2 には 18個の Proposal が実装されています。
本トークでは時間の許す限りで、すべての Proposal についてその解説を努めていきたいと思います。
""",
                startTime: 1535682000,
                seconds: 1800,
                twitterLink: "https://twitter.com/tobi462",
                twitterName: "tobi462"),


        Proposal(id: 32,
                speaker: "satoshi0212",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/a8448cc4-ba72-4d02-8373-3ee206868d1e.jpg",
                track: Track.B,
                title: "ARKit Maniacs",
                abstract: """
私はこの半年、ARの使用事例を集めると共にその拡張した使い方を検討してきました。その中で得たTipsを共有するとともにAREnvironmentProbeAnchor、ARWorldMapなどの効果的な使い方、空間共有の実例などをデモを交え熱く深く語りたいと思います。
""",
                startTime: 1535779200,
                seconds: 900,
                twitterLink: "https://twitter.com/shmdevelop",
                twitterName: "shmdevelop"),


        Proposal(id: 33,
                speaker: "kameike",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/307da237-fb61-4206-9b83-1b98c026bb48.png",
                track: Track.A,
                title: "サポートを求めてAppleに電話をするまでの道のり",
                abstract: """
アプリのリリース時、消費型課金アイテムが公開後消費型課金が30時間以上反映されなかった際、Appleに直接電話を試してみました。いざという時にAppleに電話のサポートを受けるとどのような効能があるのか？！思ったよりも大変だったAppleに国際電話が通じるまでの道のりも含めご紹介します。
""",
                startTime: 1535788800,
                seconds: 300,
                twitterLink: "https://twitter.com/kameike",
                twitterName: "kameike"),


        Proposal(id: 34,
                speaker: "Hiroshi Shikata",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ff94a431-1a56-4607-bc11-04b9cfd4e185.png",
                track: Track.A,
                title: "不摂生で救急搬送されたiOSアプリ開発者がiPhoneとAppleWatchをフル活用して健康を取り戻した話",
                abstract: """
こんなことを話そうと思っています。

- iPhoneとAppleWatchをフル活用して生活習慣を立て直したこと
- iOSアプリでユーザに行動を継続させるための仕組み作り
- ヘルスケア系アプリや、それらで使われているiOS/watchOSの機能や事例の紹介
""",
                startTime: 1535873400,
                seconds: 300,
                twitterLink: "https://twitter.com/dotrikun",
                twitterName: "dotrikun"),


        Proposal(id: 35,
                speaker: "FromAtom",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/53e47a25-0f33-4361-b596-8e6244e1b1f9.jpg",
                track: Track.C,
                title: "複数のライブ映像を同期再生するのが大変だったので知見をお伝えします",
                abstract: """
ライブ配信サービスが流行っている中、WWDC2017で `EXT-X-PROGRAM-DATE-TIME` タグのサポートが発表されました。
これにより、複数のAVPlayerに表示されるライブ映像を同期することが可能になりました。

このトークでは、
・複数のライブ映像をズレなく同期再生するノウハウ
・ハマりどころ
・設計のコツ
を実際にプロダクション環境で運用した経験をもとにお話します。
""",
                startTime: 1535680200,
                seconds: 900,
                twitterLink: "https://twitter.com/FromAtom",
                twitterName: "FromAtom"),


        Proposal(id: 36,
                speaker: "こりん",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/0546bed7-c6f4-49e3-ba66-c8bd993e6db9.jpg",
                track: Track.A,
                title: "明日から使えるViewControllerのMemory Leak検出",
                abstract: """
クロージャやRxSwiftを利用していると循環参照によるMemory Leakが発生してしまうことがあります。
実装時やレビュー等で気をつけるのはもちろんのことですが、それでも起きてしまう事があると思います。
その対策としてすぐに検出するための実装についてお話できればと思います。
""",
                startTime: 1535877900,
                seconds: 300,
                twitterLink: "https://twitter.com/corin8823",
                twitterName: "corin8823"),


        Proposal(id: 37,
                speaker: "kobaken",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/5f95c5f3-ad50-4ea7-a715-6b0552e474ac.png",
                track: Track.A,
                title: "Androidエンジニアが1週間でiOSアプリ開発を学び、1ヶ月で大規模アプリ開発にJOINした話",
                abstract: """
Java, Kotlin, Android Studio, adb, Gradle...
Androidの決別、Xcodeとの出会い、Data Bindingの不在、立ちふさがるAutoLayoutの壁
これは、とあるAndroidエンジニアが如何にしてiOSエンジニアにジョブチェンジし、それぞれの違いに苦しみ、時に喜びを感じてきた物語である
""",
                startTime: 1535790000,
                seconds: 300,
                twitterLink: "https://twitter.com/koba_dog",
                twitterName: "koba_dog"),


        Proposal(id: 38,
                speaker: "ikkan_chin",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/d6a1c12b-f815-464d-b2bb-f3edd0743275.jpg",
                track: Track.D,
                title: "多言語対応のススメ",
                abstract: """
グローバル展開のため、多言語対応は必須です。
・構文エラーがある時、早めにエラーを見つける方法は？
・十数週類の言語の中に、まだ対応されてなかった文字列がある時、早めに見つける方法は？
・iOS 12から、多言語対応のワークフローは変わりました、どんな風に対応すべきか？
・・・
""",
                startTime: 1535863800,
                seconds: 900,
                twitterLink: "https://twitter.com/Ckitakishi",
                twitterName: "Ckitakishi"),


        Proposal(id: 39,
                speaker: "Hanawa Takuro",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/dfa08d83-5891-4fc1-bc61-0bda0a6be923.png",
                track: Track.C,
                title: "LIFULL HOME'S「かざして検索」リリースの裏側",
                abstract: """
LIFULL HOME'S「かざして検索」は建物をかざすだけでその建物の物件情報を閲覧できるUXを提供する機能です。この機能は新たな住まいの探し方として話題となり、各種メディアで取り上げていただいています。

機能の提案からリリースに至るまでのプロジェクトの話だけでなく、物体検出機能をCoreML+Visionで実装する方法、ARKitと併用する方法、実際のプロダクトに組み込む為のテクニックなどの技術的な要素も交えてお話しします。
""",
                startTime: 1535779200,
                seconds: 900,
                twitterLink: "https://twitter.com/HanawaTakuro",
                twitterName: "HanawaTakuro"),


        Proposal(id: 40,
                speaker: "monoqlo",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/7149f0b9-8d6f-44c2-89df-c626f8dd773e.jpg",
                track: Track.B,
                title: "「QRコード読み取り？楽勝ですよ😙」=>「AVFoundationを信じたおれがバカだった😇」",
                abstract: """
iOS 11から標準カメラアプリでQRコードが読み取れるようになり、
今まで以上にQRコードを活用してプロモーションを打ちやすくなりました。

ところで、標準カメラアプリはおろかAVFoundationでも正しく読み取れないQRコードがあるのをご存知ですか？
このトークでは、車検証に記載されたQRコードを読み取るために調べて実践したことを、サンプルを交えてお伝えします。
""",
                startTime: 1535780400,
                seconds: 900,
                twitterLink: "https://twitter.com/monoqlo",
                twitterName: "monoqlo"),


        Proposal(id: 41,
                speaker: "こばやしさとし",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/c389e629-1e07-40eb-98ac-63b8bcebc8cd.jpg",
                track: Track.A,
                title: "Swiftで始めるRaspberry Pi",
                abstract: """
元iOSエンジニアがRaspberry Pi初心者なのに公式言語のPythonではなくわざわざSwiftでRaspberry Piに入門した話。
そして、Raspberry Piプログラミングに用いられている代表的なSwiftのライブラリSwiftyGPIOにPRを出して、初めてOSSにコントリビュートした話をしようと思います。
""",
                startTime: 1535878500,
                seconds: 300,
                twitterLink: "https://twitter.com/gucchisk",
                twitterName: "gucchisk"),


        Proposal(id: 42,
                speaker: "huin",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/4e729c2a-019a-40b3-aafd-23dfd24851ea.png",
                track: Track.A,
                title: "State of the Union ~2018年のアプリ開発事情~",
                abstract: """
ObjC/Swift、アプリケーションアーキテクチャ、リアクティブ、テスト、CI/CDなど、2018年のアプリ開発環境は多くの情報とトレンドにあふれており、キャッチアップするだけでも一苦労です。
　本セッションではこれら多くの情報を整理し、現在のアプリ開発環境全体を俯瞰します。アプリ開発初心者でどこから勉強すればいいかわからない方、経験者だけど開発環境をもっと良くできないかと考えている方の手助けになれば幸いです。
""",
                startTime: 1535785200,
                seconds: 1800,
                twitterLink: "https://twitter.com/huin",
                twitterName: "huin"),


        Proposal(id: 43,
                speaker: "堤 修一",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ca7f6662-f1a9-4709-a044-19360c53c9bb.jpg",
                track: Track.A,
                title: "Depth in Depth",
                abstract: """
原始のiPhoneからカメラは搭載されていましたが、深度センサが搭載されたのは比較的最近のことです。カメラやGPSが、デジタルの世界と我々が生きる現実世界を繋ぐ重要な役割を担い、アプリ開発者に多くの創造性を与えてくれたのと同様に、「奥行き」がわかるようになったというのはアプリ開発の次元がひとつ増えたようなものです。本トークではiOSでの深度の扱いについて、取得方法だけではなく、細かいパラメータの意味やMetalでの処理まで詳解します。
""",
                startTime: 1535776200,
                seconds: 1800,
                twitterLink: "https://twitter.com/shu223",
                twitterName: "shu223"),


        Proposal(id: 44,
                speaker: "栗山徹",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/8e8bc8b1-e88d-4394-bdce-d8360aabcdf6.jpg",
                track: Track.A,
                title: "グラフィックス以外の分野でのMetalの可能性",
                abstract: """
WWDC2018でOpenGL(ESも含む)がDeprecatedなるとのアナウンスにより、Metalへの注目が高まってきました。MetalはiOS端末のGPUを活用できるという意味で、3DCG以外の分野でも実用の可能性がある技術です。
本セッションでは、グラフィックス以外の分野におけるMetalを活用するメリットや可能性、Metal導入や注意点について紹介します。
""",
                startTime: 1535874600,
                seconds: 300,
                twitterLink: "https://twitter.com/kotetu",
                twitterName: "kotetu"),


        Proposal(id: 45,
                speaker: "Ryo Aoyama",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/9f99f776-493b-4d3a-b999-cbc3f3a7d19b.jpg",
                track: Track.C,
                title: "Plasma - gRPC streamを利用したリアルタイムなユーザー体験",
                abstract: """
時は2018年未だに定期ポーリングを使った画面更新でリソースを無駄遣いしていませんか？
FRESHではgRPC streamを利用し、サーバープッシュ方式でイベントを受け取る事ができるミドルウェアPlasmaを開発し、リアルタイムで快適なユーザー体験を提供しています。
このトークでは、Plasmaについて実際の利用例を紹介しながらお話します。
""",
                startTime: 1535777400,
                seconds: 900,
                twitterLink: "https://twitter.com/ra1028fe5",
                twitterName: "ra1028fe5"),


        Proposal(id: 46,
                speaker: "行木 千春",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/b3c64e62-d1a2-422a-a15e-b523ea1feeb4.png",
                track: Track.B,
                title: "マスタリング CGAffineTransform",
                abstract: """
撮影した映像の向きがおかしい？Viewの位置計算で困ってる？
とても良い機会です。5分でCGAffineTransformをマスターしましょう！
CGAffineTransformはちっぽけなstructですが、使いこなせば非常に強力なAPIです。
基本知識から組み合わせて掛けるときの考え方のコツなどを具体例と共にお話しします。
もう座標計算に悩んで時間を使うことはありません！
""",
                startTime: 1535791500,
                seconds: 300,
                twitterLink: "https://twitter.com/Ridwy",
                twitterName: "Ridwy"),


        Proposal(id: 47,
                speaker: "Naomichi Okada",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/f95041c1-841c-4deb-9ae1-87b84ce4b3ee.jpg",
                track: Track.A,
                title: "NoSQLの歴史にみる、Cloud Firestoreとの正しい付き合い方",
                abstract: """
2017年10月に発表されたCloud Firestoreは、非常に高い水平スケーリング性能、柔軟で直感的なスキーマレス等の特徴が話題のドキュメント指向NoSQLデータベースです。
しかし、その特性を理解せずに利用すると予期せぬ辛みや開発コストの増大を招くこともあります。このトークでは、NoSQLデータベースの歴史についても整理しながらFirestoreを利用する際のプラクティスについて考えていきます。
""",
                startTime: 1535791200,
                seconds: 300,
                twitterLink: "https://twitter.com/na0m1chikun",
                twitterName: "na0m1chikun"),


        Proposal(id: 48,
                speaker: "Kenta Nakai",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/4362172e-f050-473e-a39d-1b9bf395f6fa.jpg",
                track: Track.B,
                title: "プッシュ通知はどのような進化をたどってきたか",
                abstract: """
プッシュ通知はさまざまな進化を遂げてきました。かつてはテキストだけしか表示できなかったものが、画像やカスタムアクションを付けられるようになり、iOS 12でも様々な機能が追加されています。
このトークでは、プッシュ通知でどのようなことができるようになったか、iOSのバージョンごとに時系列を追って紹介していきます。開発時に混乱しがちな「どのバージョンからどのようなプッシュ通知の機能が使えるのか」を整理できるようお伝えできればと思います。
""",
                startTime: 1535853000,
                seconds: 900,
                twitterLink: "https://twitter.com/urouro_n",
                twitterName: "urouro_n"),


        Proposal(id: 49,
                speaker: "nakajijapan",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ded6d4b5-34d0-49f6-8ca6-52c3fe44a2fc.png",
                track: Track.B,
                title: "Markdownをリアルタイムに解析する",
                abstract: """
Markdownを解析する時にGitHubで探せば簡単にライブラリを何個も見つけることができます。しかし、をそれをリアルタイムとなるとなかなかみつけることができません。私は端末間で同期できるメモアプリを作成し、機能の一つに入力しながらMarkdown形式に色付けをする機能を実装しました。本トークではリアルタイムに文章を解析し、リッチな表現をどのようにして行っているのかを解説します。
""",
                startTime: 1535680200,
                seconds: 900,
                twitterLink: "https://twitter.com/nakajijapan",
                twitterName: "nakajijapan"),


        Proposal(id: 50,
                speaker: "bannzai",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/a122c43f-cf15-4b7e-b1aa-115466f29892.jpg",
                track: Track.A,
                title: "~~ †††† 漆黒の魔法 Objecitve-C Runtime API †††† ~~",
                abstract: """
やめて！Objective-Cの黒魔術でRuntime APIで色々されたら、闇のコードと繋がっているiOSアプリエンジニアの精神まで燃え尽きちゃう。お願い、機能してXcode。あなたがここで倒れちゃうとマネージャーや社長との約束はどうなっちゃうの。ライフはまだ残っている。ここを耐えれば納期に間に合うんだから。次回「城n(ry

Objective-Cの黒魔術を用いて闇のコードを紹介していきます。
""",
                startTime: 1535680200,
                seconds: 900,
                twitterLink: "https://twitter.com/_bannzai_",
                twitterName: "_bannzai_"),


        Proposal(id: 51,
                speaker: "Kuniwak",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/c7100dfb-9404-4ca6-8cea-bcb7cdc79513.png",
                track: Track.A,
                title: "iOS アプリの開発速度を70%高速化したデバッグノウハウ",
                abstract: """
開発時間に占めるデバッグ時間の割合は少なくないため、この時間の短縮は開発速度を上げるためにとても重要です。この発表では、実際の中規模なアプリ開発で70%増もの開発速度向上を支えたデバッグノウハウを初心者にもわかりやすく紹介します。

このノウハウには、効果が高いデバッグの5W1Hの解説や、リビルドなしでデバッグする方法、便利なライブラリの紹介を含みます。開発速度が気になっている方はぜひ聞いてみてください！
""",
                startTime: 1535865600,
                seconds: 1800,
                twitterLink: "https://twitter.com/orga_chem",
                twitterName: "orga_chem"),


        Proposal(id: 52,
                speaker: "TachibanaKaoru",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/3b64c636-3aa4-42c7-8ab4-4fe6dbb16556.jpg",
                track: Track.B,
                title: "Synchronized iPhones!",
                abstract: """
複数のiPhoneを、連携させたことがありますか？
一面にならんだ数十台のiPhoneにシンクロナイズドスイミングのような全く同じ表示をさせる……単純に見えますが、実は技術的にはとても高度なテクニックを必要とします。
フレームレート60fpsのiPhoneで、ぴったりあった動作を実現するためには端末間に許されたずれは、16ミリ秒以下。
これを実現するには、どんな要素技術、どんな設計、どんなテクニックを使えばよいでしょうか。
""",
                startTime: 1535782200,
                seconds: 1800,
                twitterLink: "https://twitter.com/TachibanaKaoru",
                twitterName: "TachibanaKaoru"),


        Proposal(id: 53,
                speaker: "Mizuko Aoyagi",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/e9a67cb2-cd7b-4d45-9774-8013956f5815.jpg",
                track: Track.A,
                title: "派遣で事務職が開発未経験でもiOSDCで登壇したくて、アプリ作りました！",
                abstract: """
昼は派遣で事務職、定時後は夜な夜なSwift関連の勉強会に出没。そんな私がカンファレンスで登壇してみたいなぁと思ったら、自作のアプリがなかった！登壇するのにアプリがないのはよろしくないので、１年以上の孤独なSwift学習生活の集大成として、個人開発アプリをAppleの審査に出します（現在進行形）。その結果次第でトークのオチが変わります。開発未経験者が登壇ドリブン開発で得た経験、未経験者ならではのハマりどころなどをお伝えします。
""",
                startTime: 1535789100,
                seconds: 300,
                twitterLink: "https://twitter.com/mizu_gako",
                twitterName: "mizu_gako"),


        Proposal(id: 54,
                speaker: "Kyohei Ito",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/9f7a89fe-60bc-4e4e-813b-5a44a863060f.jpg",
                track: Track.C,
                title: "grpc-swiftを使ってiOSアプリでも快適なgRPC通信を行う",
                abstract: """
Swiftで記述されたiOSアプリでも、grpc-swiftを利用してgRPC通信をある程度手軽に利用可能になります。
gRPCを利用すると、通常の通信を行うよりも通信速度は速く通信量も少なく済み、更には双方向での通信を行うことができます。
今回は、gRPCの概要、grpc-swiftの導入方法、実際にプロジェクトで利用する際の応用的なことや、grpc-swiftにコントリビュートしたときの経験談などをお話させていただきます。
""",
                startTime: 1535692800,
                seconds: 1800,
                twitterLink: "https://twitter.com/KyoheiG3",
                twitterName: "KyoheiG3"),


        Proposal(id: 55,
                speaker: "海川和弥",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/2394c61e-bb86-4a66-a3b7-26ea21b9f6ee.jpg",
                track: Track.A,
                title: "Create ML で  マッチングアプリのサクラを判定しよう！",
                abstract: """
WWDC 2018 で発表されたものの一つに、 Create ML がありました。 Core ML で使うモデルを簡単に作れるフレームワークです。画像をある程度用意すれば簡単に作れます。
弊社マッチングアプリ「タップル誕生」では日々ユーザーの体験向上のために、24時間監視体制でサクラを撲滅しています。しかし、何かしら行動を起こしてからじゃないと判定するのは難しいのが現状です。そこで、顔写真をあげた段階で見つけ出そう、という試みです。
""",
                startTime: 1535877600,
                seconds: 300,
                twitterLink: "https://twitter.com/sun54907",
                twitterName: "sun54907"),


        Proposal(id: 56,
                speaker: "古屋 広二",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/7c59af85-dcd1-4cf3-a954-710ea0cebd00.jpg",
                track: Track.A,
                title: "サーバーの状態に応じて画面遷移させるための設計",
                abstract: """
DeNAのタクシー配車アプリ「タクベル」では、画面をタップする等のユーザー操作以外による画面遷移が非常に多くあります。
このようなアプリを作る上でどのような設計にしたのかや、辛かった点などを実例を交えながら紹介します。
""",
                startTime: 1535791500,
                seconds: 300,
                twitterLink: "https://twitter.com/furuyan325",
                twitterName: "furuyan325"),


        Proposal(id: 57,
                speaker: "Sho IKEDA",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/4177207c-733c-4b65-aecb-e108a46ba249.jpg",
                track: Track.A,
                title: "The latest info of Carthage",
                abstract: """
iOSアプリ開発に欠かせないパッケージマネージャーのCarthageですが、その新機能になかなか気付かないこともあるでしょう。本LTでは、昨年のiOSDC Japanからの1年分のアップデートの中から要注目の箇所をピックアップして紹介することで、開発者の皆様の日々の開発体験の向上に寄与したいと思います。
""",
                startTime: 1535872500,
                seconds: 300,
                twitterLink: "https://twitter.com/ikesyo",
                twitterName: "ikesyo"),


        Proposal(id: 58,
                speaker: "Ray Fix",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/7054c967-9903-424b-84a8-f14d12e3e20b.jpg",
                track: Track.B,
                title: "アルゴリズムを通じてよりよいアプリを",
                abstract: """
アルゴリズムはコーディング面接以外にも使います。適切なアルゴリズムとデータ構造を使用して、アポイントスケジューラまたはコレクションビューの画像コラージュを実装しているかどうかは、優れたユーザーエクスペリエンスの鍵です。 この講演では、WWDC2018でSwiftでアルゴリズムを使用する際の主要なポイントをいくつか見直します。また、SwiftらしいSwiftで、アプリでアルゴリズムを効果的に適用する方法についても説明します。
""",
                startTime: 1535628000,
                seconds: 900,
                twitterLink: "https://twitter.com/rayfix",
                twitterName: "rayfix"),


        Proposal(id: 59,
                speaker: "kobakei",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/3b12161c-1bbb-4054-b440-9c443229c520.jpg",
                track: Track.A,
                title: "iOSアプリ内で不正なSSL証明書を検知する",
                abstract: """
「HTTPS化していればセキュリティ対策は十分」などと思っていませんか？
HTTPS化していても、無線LANやネットワーク機器にセキュリティ対策がなされていないと、中間者攻撃によって通信が盗聴・改ざんされるリスクがあります。これを防ぐ方法として、不正なSSL証明書を検知するピン留めという手法があります。
本発表ではピン留めを実装する手順、またSSL証明書の更新の際に気をつけることを紹介します。
""",
                startTime: 1535692800,
                seconds: 1800,
                twitterLink: "https://twitter.com/kobakei122",
                twitterName: "kobakei122"),


        Proposal(id: 60,
                speaker: "Yusuke Kita",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/c6c4bf20-19b6-4176-8a0a-fff3efa8702b.png",
                track: Track.B,
                title: "Swift Compilerの最適化入門 - AllocBoxToStack編",
                abstract: """
varとletはSwiftコードを書く上で頻繁に使い、それぞれの特徴を理解してコードを書くことが重要です。しかし、実は適切な使い方をしていなくてもSwift Compilerがあるべき姿に最適化しています。このトークでは、Swift Compilerの最も重要な役割のひとつであるSIL(Swift Intermediate Language)を見ながらどのような最適化が行われているか紹介します。
""",
                startTime: 1535689800,
                seconds: 1800,
                twitterLink: "https://twitter.com/kitasuke",
                twitterName: "kitasuke"),


        Proposal(id: 61,
                speaker: "まりーな",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/3f4f7e91-502a-413d-b01e-de7dc645828a.jpg",
                track: Track.B,
                title: "Apple製品のアニメーションはなぜ気持ちいいのか考える",
                abstract: """
ふだん当たり前のように使っているiPhoneやiPad、どうしてこんなに気持ちのいい使い心地になるのでしょうか
コントロールセンターのアイコンたちのアニメーションやUIのパーツに着目し、AfterEffectsでアニメーショントレースを行い、得た知見を共有します。
""",
                startTime: 1535791800,
                seconds: 300,
                twitterLink: "https://twitter.com/marina10172013",
                twitterName: "marina10172013"),


        Proposal(id: 62,
                speaker: "taiki komaba",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/b6543fb2-c20a-4a72-9c12-98a41e6b1d0c.jpg",
                track: Track.B,
                title: "東急ハンズのP2Pレジ間通信2018",
                abstract: """
東急ハンズのレジは内製開発のiPadアプリで動いています。
そんなレジ用アプリはアプリ間で様々な情報を交換しています。

レジ間を飛び交う通信内容や通信方式の現在に至るまでの変遷を紹介します。
""",
                startTime: 1535768400,
                seconds: 1800,
                twitterLink: "https://twitter.com/r_plus",
                twitterName: "r_plus"),


        Proposal(id: 63,
                speaker: "Noritaka Kamiya",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/e165b4c1-4644-4566-a2f1-fbc0a45034bf.jpeg",
                track: Track.B,
                title: "キラリと光るテクニック、アプリをデモするときの心構え",
                abstract: """
ついにきた、あなたが心血を注いで開発したアプリのお披露目の日、プレスも来てハンズオンもある。
このデモでビジネスの結果が変わる！重大な1日。
そんな日に向けて、どんな準備をしておけばいいでしょうか？わずかの準備の差が、印象を大きく変えるのです。
iPhoneを使ったメディアアートの展示会で裏方を長年務めてきたスピーカーが、そのテクニックを語ります。
""",
                startTime: 1535622000,
                seconds: 900,
                twitterLink: "https://twitter.com/nolili",
                twitterName: "nolili"),


        Proposal(id: 64,
                speaker: "Yuta Koshizawa",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/1e6c86df-19a5-409f-870d-158b272593bf.gif",
                track: Track.C,
                title: "iOSエンジニアのための、SwiftからPythonのライブラリを使って機械学習する方法",
                abstract: """
Swift 4.2では他言語のAPIをSwiftから簡単に呼び出せるようになります。これ自体は汎用的な仕組みですが、最大の目的はSwiftからPythonの資産を活用できるようにし、Python並の機械学習を実現することのようです。日々Swiftを書いているiOSエンジニアにとってこれは大きなチャンスです。このトークではiOSエンジニアに向けて、SwiftのコードでPythonのライブラリを使って機械学習する方法を紹介します。
""",
                startTime: 1535862600,
                seconds: 1800,
                twitterLink: "https://twitter.com/koher",
                twitterName: "koher"),


        Proposal(id: 65,
                speaker: "takopom",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/337f87e1-1d9d-49fd-b541-2f4c2503d07b.jpg",
                track: Track.B,
                title: "AVAudioUnitEffect実演　〜もっと音を楽しもう♪〜",
                abstract: """
いつも聞き慣れた音楽にエフェクトを掛けてみると、また一味違った聞こえ方をするので、オッ！となります。
イコライザーだけでなく、AVAudioUnitにある様々なエフェクトを組み合わせるとどんな音になるのか、実演をメインにしてみます。
肩の力を抜いて、iOSオーディオのことを楽しんでもらえるトークにしたいと思います♪
""",
                startTime: 1535788500,
                seconds: 300,
                twitterLink: "https://twitter.com/takopom55",
                twitterName: "takopom55"),


        Proposal(id: 66,
                speaker: "ばんじゅん🍓",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/78a1a52e-e834-454b-a9ce-245822a43b26.png",
                track: Track.A,
                title: "5000行のUITableViewを差分更新する",
                abstract: """
差分更新のテクニックを使うと，IndexPathを持ち回ることなく，UITableViewの必要な箇所のみ挿入・削除できるようになります。
これはいつでも採用できる手法なのでしょうか？ 0～5000行で変化するテーブルビューにも使えるでしょうか？

このトークでは主にトータルの更新パフォーマンスにフォーカスして，5000行規模の差分更新を実用的な速度にするために必要な，ボトルネックの解析と遭遇するトレードオフについて紹介します。
""",
                startTime: 1535779200,
                seconds: 1800,
                twitterLink: "https://twitter.com/banjun",
                twitterName: "banjun"),


        Proposal(id: 67,
                speaker: "いたる",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/5a45c7f3-fb76-4802-bab4-5a1a4ffe697a.png",
                track: Track.A,
                title: "iOSDC2019を福岡に招致したい！",
                abstract: """
iOSDC2019を福岡に招致したいため、福岡の魅力をお伝えいたします！
福岡でiOSエンジニアをやることの魅力を存分にお伝えいたします！
福岡市はIT・IoTにフルサポートをしています！メルチャリもあるし！
2018年は、「キャッシュレス」に関する実証実験プロジェクトを開始し、iOSDCに参加することで体感していただくことが可能です。
Ruby kaigi 2019も福岡で行われます。
iOSDCも福岡でやるっきゃない！
""",
                startTime: 1535792400,
                seconds: 300,
                twitterLink: "https://twitter.com/itaru_sugimoto",
                twitterName: "itaru_sugimoto"),


        Proposal(id: 68,
                speaker: "Masayuki Iwai",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/1056ef15-a4e5-4cda-91fb-4d939f4f7c40.png",
                track: Track.A,
                title: "Code PushとReact Nativeで緊急OTAリリース！了解！",
                abstract: """
Visual Studio App Centerに統合されたCode Push。
Code PushとReact Nativeを使うと、Over the Airでアプリの変更点を即座にユーザーの手元に届けることができます。
実際にCode Pushを使用してみて得られた知見を紹介します。
""",
                startTime: 1535625000,
                seconds: 900,
                twitterLink: "https://twitter.com/myb",
                twitterName: "myb"),


        Proposal(id: 69,
                speaker: "akatsuki174",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/5b5f4cff-51bb-4963-8e2c-9088884e14f6.jpg",
                track: Track.B,
                title: "AutoLayoutエラー診断所 ~発狂しないためのデバッグ手法~",
                abstract: """
「どうされましたか？」
「いろいろ頑張ってはみたんですが、うちの子全然治らないんです。顔が黄色くなったり赤くなったり、あとはいろいろ吐いてしまっていて。もうどうしたらいいのか…。」
「ふむ。デバッグ方法がわからないわけですね。症状によって見るべきポイントは異なりますし、そもそも症状は正確に判断しないといけません。私と一緒に症例とその対処方法を見てみましょう。」

キャスト
医者：私
親：開発者
子：AutoLayout
""",
                startTime: 1535862600,
                seconds: 1800,
                twitterLink: "https://twitter.com/akatsuki174",
                twitterName: "akatsuki174"),


        Proposal(id: 70,
                speaker: "muukii",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/81c3f3ba-6fb7-40a1-b065-e9f504b0dd94.jpg",
                track: Track.A,
                title: "安定したチャットを実現するためのアプリとAPI設計",
                abstract: """
SNS系のアプリのほとんどはチャット機能を持っています。
しかし、チャット機能の実装はUXを求め始めると難しく、複雑になっていきます。
「順番が狂う」「送信完了までメッセージが表示されない」「受信されない」「重い」など
データが蓄積されていくチャットのような機能はどのように実装すべきなのかをお話しします。
""",
                startTime: 1535689800,
                seconds: 1800,
                twitterLink: "https://twitter.com/muukii0803",
                twitterName: "muukii0803"),


        Proposal(id: 71,
                speaker: "taminif",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/5e076ea3-b67e-404b-8ab1-922b3549c03a.jpg",
                track: Track.C,
                title: "WebSocketをiOSに持ち込んで辛い思いをした経験がありますか！？",
                abstract: """
はい！そこのあなた！
Firebaseの話かと思った？あれもWebSocket使ってるもんね！
違います！自社でWebSocket通信用サーバーを立てて、WebとiOSアプリで同時対応した話です！
HTTP通信じゃだめなんです！WebSocketでやる必要があるんです！
決して正解ではないかもしれないですけど、プロダクトに導入して大変な思いをした経験を話します！！
""",
                startTime: 1535785200,
                seconds: 900,
                twitterLink: "https://twitter.com/sbntaminif",
                twitterName: "sbntaminif"),


        Proposal(id: 72,
                speaker: "Kazuya Ueoka",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/5d65d6e6-14b1-4f09-9404-2d5d03fa1a19.png",
                track: Track.A,
                title: "ツールとして利用するUIテスト",
                abstract: """
Xcode 9よりXCTestにスクリーンショット撮影機能が実装されました。XCTestはテストコードから地域や言語を指定する事が可能で、xcodebuildで複数のシミュレーターでテストが実行可能なので、様々な画面サイズと条件のスクリーンを集める事が出来るのです。デザイン崩れ等はUIテストでも判別が難しい物の一つですが、半自動的にデザイン崩れを解消する事が可能になったので発表したいと思います。
""",
                startTime: 1535626800,
                seconds: 900,
                twitterLink: "https://twitter.com/fromkk",
                twitterName: "fromkk"),


        Proposal(id: 73,
                speaker: "rockname",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/c7278a10-c49c-433f-bc0b-f7a83e6dc434.jpg",
                track: Track.B,
                title: "Playground駆動開発のすすめ",
                abstract: """
ほとんどのiOSエンジニアは、デザイナーさんからデザインを受け取り、その仕様通りに実装すると思います。
が、それでもやはりデザイン調整は入ります。
その度にSwiftの長いコンパイルを待ってUI調整を確認するのは、さぞツライ作業です。

そこで、デザイン調整の工程をPlaygroundでやってしまおうというわけです
...それが「Playground駆動開発」です！
""",
                startTime: 1535626800,
                seconds: 900,
                twitterLink: "https://twitter.com/_rockname",
                twitterName: "_rockname"),


        Proposal(id: 74,
                speaker: "slightair",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/e3dd0dc1-fa42-4511-b8c2-0ac19cfee42a.png",
                track: Track.C,
                title: "動作確認のための社内アプリ配信サービスを新たに作った話",
                abstract: """
アプリの開発中にビルドしたアプリをCrashlyticsBetaやDeployGateなどにアップロードし、手元で動作確認できるようにしているチームは多いと思います。僕たちもそういったサービスを使ってきましたが、様々な課題が出てきたため自分たちの使い方にあったシステムを新しく作りました。どういった課題がありどういうツールを用意したのか、そしてどうリリースフローが改善されたか話します。
""",
                startTime: 1535786400,
                seconds: 900,
                twitterLink: "https://twitter.com/slightair",
                twitterName: "slightair"),


        Proposal(id: 75,
                speaker: "ぎぎにゃん",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/620fe353-7403-41bc-86a5-5a2acf435397.png",
                track: Track.A,
                title: "🀄",
                abstract: """
Swiftの様々な言語機能を使って麻雀を遊んでみましょう！
Swiftyな麻雀ライブラリの実装や、和了判定のアルゴリズムなどについてお話しします
""",
                startTime: 1535872200,
                seconds: 300,
                twitterLink: "https://twitter.com/giginet",
                twitterName: "giginet"),


        Proposal(id: 76,
                speaker: "ぎぎにゃん",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/620fe353-7403-41bc-86a5-5a2acf435397.png",
                track: Track.A,
                title: " 詳解Fastfile",
                abstract: """
プロジェクトが大規模化していくと、さまざまな業務を自動化したくなってきます。同時にロジックが増え、特定の人しかメンテできなくなったFastfileにお悩みの方も多いでしょう。

このトークでは、実際の活用事例を交えながら、大規模プロジェクトにおける効果的なFastfileの書き方、プロジェクトの雑務自動化についてをお話しします。
そのほか、fastlaneコミッターによる明日から使える実践的なtipsも数多くお伝えします。
""",
                startTime: 1535768400,
                seconds: 1800,
                twitterLink: "https://twitter.com/giginet",
                twitterName: "giginet"),


        Proposal(id: 77,
                speaker: "kumabook",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/f4c2212f-3bb0-4f75-aeb8-4af0595efe74.jpg",
                track: Track.C,
                title: "プロトコルを使って複数サービスを跨いだmusic playerを実装する",
                abstract: """
iOSでは曲を再生する方法としてAVAudioPlayerやMediaPlayerなどがあります。しかし、それぞれのplayerごとに再生キューやライフサイクルを持っており、player間を跨いで連続再生をするのは直感的には実装できません。今回は上記2つ加えてyoutube iframe player・SpotifyPlayerのplayer間を跨いで連続再生できるmusic playerをprotocolを利用して実装した話をします。
""",
                startTime: 1535854800,
                seconds: 1800,
                twitterLink: "https://twitter.com/kumabook",
                twitterName: "kumabook"),


        Proposal(id: 78,
                speaker: "馬場南実",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/af6acda8-c0a9-4b4b-bb4f-e80d9b0b0e3d.jpg",
                track: Track.B,
                title: "Visionフレームワークのリアルタイム顔検出を使えば、ウインクするときゃるん♪と音が鳴る二次元美少女になれる！",
                abstract: """
iOS11から、Visionという画像認識フレームワークが利用可能になりました。その中の機能を使えば、iPhoneのカメラで顔を写すことで、リアルタイムで顔の各パーツの動きを取得することができます。それを使えば、ウインクするときゃるんと音が鳴ったり、目と口を見開いた時に爆発音が鳴ったり、そんなアニメの世界みたいなことが簡単に実現できます。そんなお話をしようと思います！
""",
                startTime: 1535790000,
                seconds: 300,
                twitterLink: "https://twitter.com/minami1389",
                twitterName: "minami1389"),


        Proposal(id: 79,
                speaker: "fumito-ito",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/1a5b862a-ed4b-4db9-af7c-eb5d7ee367b5.jpeg",
                track: Track.B,
                title: "差分計算アルゴリズムを用いた高速なUITableView描画",
                abstract: """
UITableViewをいかに高速に描画、更新するかはiOSアプリケーションの実装において頻繁に遭遇する問題です。

本セッションでは単純な reloadData を用いた場合と差分計算アルゴリズムを用いた場合で実際にどの程度の差が生じるのか検証した結果を提示します。
また、複数の差分計算アルゴリズムとその実装を比較することで、それぞれの実装が適しているケースを提示します。
""",
                startTime: 1535703000,
                seconds: 900,
                twitterLink: "https://twitter.com/fumito_ito",
                twitterName: "fumito_ito"),


        Proposal(id: 80,
                speaker: "須藤将史",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/cda6b3fe-b7bc-4a3a-be34-fb9afe5848d4.jpg",
                track: Track.A,
                title: "iOSでグラフを描くために必要な知識について",
                abstract: """
グラフを簡単に表示するライブラリはたくさんあります。しかし、表示したいグラフのデザインに合ったライブラリがなかったり、デザインを柔軟に変更したい理由から、グラフの表示を自作する方も多いのではないでしょうか。最近はフィンテックやライフログのサービスが注目され、グラフを表示するアプリが増えたように感じます。今回のトークでは、有名なライブラリの実装を参考にしながら、グラフの描画方法の紹介と、実務でどのように活用したのかを話します。
""",
                startTime: 1535868600,
                seconds: 900,
                twitterLink: "https://twitter.com/kurotyann9696",
                twitterName: "kurotyann9696"),


        Proposal(id: 81,
                speaker: "Tsukagoshi Keisuke",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/640f07d9-2cb7-4576-8bd0-97248407d565.jpg",
                track: Track.C,
                title: "がっつりやるリアルタイムキャンペーン分析",
                abstract: """
単純にプッシュを打つだけでは意味がありません。カスタマーエンゲージを目指すならばカスタマーの分析を行う必要があり、さらに言うならばリアルタイム性の高い情報を使った分析が必要となります。Amazon Pinpointを利用するとEvent Streamを利用して簡単にリアルタイム分析を行えます。本セッションではリアルタイムな分析を行うためのアーキテクチャとそれを使ったマーケティングを行うためのベストプラクティスを紹介します。
""",
                startTime: 1535865600,
                seconds: 1800,
                twitterLink: "https://twitter.com/ktsukago",
                twitterName: "ktsukago"),


        Proposal(id: 82,
                speaker: "Satoshi Nagasaka",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/5e17dc35-9615-4633-ad7b-cd03d701f421.jpeg",
                track: Track.A,
                title: "レガシーなアプリケーションの60fps化を目指す為にやっていること",
                abstract: """
私の現在担当しているアプリケーションはファーストリリースから早5年が経過しようとしています。
しかし、ユーザの求めるサービス、そして何よりUI/UXへの期待値は5年前とは比べ物にならないくらいに上がりました。
ユーザの期待を裏切らない為に、我々iOSチームがfpsを一つの指標に置いてUI/UX改善の為に行っている事、またこれから改善していきたい事についてお話します。
""",
                startTime: 1535704800,
                seconds: 1800,
                twitterLink: "https://twitter.com/satoshin21",
                twitterName: "satoshin21"),


        Proposal(id: 83,
                speaker: "八十嶋祐樹",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/bd5e1ee0-a53d-42e7-adf6-1f17a6952cc7.png",
                track: Track.A,
                title: "Swiftコードから状態遷移図を自動で生成し、継続的にメンテナンスしやすくする",
                abstract: """
アプリの中の複雑な状態はステートマシンなどを導入することで管理しやすくなります。
しかし、コードだけを見ても流れが分かりにくかったり、状態遷移図を作ってもコードに合わせて更新していくのが面倒だったり、継続したメンテナンスは大変です。
このトークでは、シンプルなステートマシンとSourceKit・Graphvizなどのツールを使ってコードから状態遷移図を自動で生成する仕組みを作り、継続的にメンテナンスしやすくする方法をお話しします。
""",
                startTime: 1535698800,
                seconds: 1800,
                twitterLink: "https://twitter.com/yaso_san",
                twitterName: "yaso_san"),


        Proposal(id: 84,
                speaker: "小田島",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/1591663a-b174-46b2-ae8b-858c369d3639.jpg",
                track: Track.A,
                title: "手品師がWeb業界に入るとこうなる",
                abstract: """
お客様の中に手品師の方はいませんか…？

手品業界からWeb業界に華麗なる転身を遂げた結果、こんな毎日を過ごしています…という技術とは無縁のネタトークです。
""",
                startTime: 1535877300,
                seconds: 300,
                twitterLink: "https://twitter.com/shimataro999",
                twitterName: "shimataro999"),


        Proposal(id: 85,
                speaker: "S_Shimotori",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/688c10c8-3b42-451e-bb6d-0541a5a77b63.jpg",
                track: Track.C,
                title: "フォントと組版の30分入門",
                abstract: """
フォントや組版について気にしたことはありますか？
奥深く興味深い世界ですが、そのぶん難しい用語や規則がたくさん。間違えるとこわーい人にツッコミを入れられてしまうかも！
本セッションでは、日頃TextKitと親しくしている皆様、技術同人誌に興味のある皆様を対象に、基礎とちょっとした雑学を学びます。
""",
                startTime: 1535698800,
                seconds: 1800,
                twitterLink: "https://twitter.com/S_Shimotori_pub",
                twitterName: "S_Shimotori_pub"),


        Proposal(id: 86,
                speaker: "ひろん",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/20bbb736-e03d-4004-8165-ec39a690bd8f.jpg",
                track: Track.A,
                title: "全部iOSにしゃべらせちゃえ！",
                abstract: """
いっけなーい💦トークトーク🗣私、ひろん。今年もiOSDCのLTに応募したの✨でもiOSDCは競技LT🏅オーディエンスもいっぱいいるから緊張してしゃべれないよー🙀あ、そうだ💡AVSpeechSynthesizerちゃんとPDF Kitくんに頼めば、代わりに発表してくれるんじゃない？💕私あったまいいー…って本当に採択されたらどうしよう🆘次回「全部iOSにしゃべらせちゃえ！」お楽しみに
""",
                startTime: 1535871900,
                seconds: 300,
                twitterLink: "https://twitter.com/hironytic",
                twitterName: "hironytic"),


        Proposal(id: 87,
                speaker: "吉田 \"sonson\" 悠一",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/3cbf2b84-f6b0-406e-91f6-5d3b1fa3eba5.png",
                track: Track.A,
                title: "Swift Playgrounds Bookの作り方と配り方〜カメラからの画像をリアルタイムにいじるPlayPixels",
                abstract: """
iPadで，コーディングをしたり，プログラミングの教科書のような使い方ができるSwift Playgrounds．最近では，カメラやBluetoothのAPIが解放され，Swift Playgrounds Bookを個人でアプリを通じて配布できるようにもなりました．この発表では，カメラの画像をリアルタイムに処理できるサンプルを例に，Swift Playgroundsのおもしろさ，Bookの開発および公開方法について解説します．
""",
                startTime: 1535782200,
                seconds: 1800,
                twitterLink: "https://twitter.com/sonson_twit",
                twitterName: "sonson_twit"),


        Proposal(id: 88,
                speaker: "南波 寛直",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/6c921821-edb2-471d-9ee4-9c3272903100.jpg",
                track: Track.C,
                title: "すべては「サクサク感」のために！ QUICで早くなる？インターネットの世界と，周辺プロトコルの話",
                abstract: """
「サクサク感」がUXに直結することはよく知られているかと思います。
サーバーとの通信を高速化するために，広く利用されているHTTPの改善を目指したHTTP/2が標準化されました。
一方で，そもそもHTTPの下のレイヤを担うTCPが遅いことから，その課題を解決するQUICというプロトコルが開発され，また標準化が進んでいます。
このQUICの基本的な概念やモバイルに関連する特徴などをお話しします。
""",
                startTime: 1535782200,
                seconds: 1800,
                twitterLink: "https://twitter.com/brownbro",
                twitterName: "brownbro"),


        Proposal(id: 89,
                speaker: "Koichi Tanaka",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/5cf34ead-e967-479a-a363-23aea2ac6952.jpg",
                track: Track.B,
                title: "iOSエンジニアの為のgrpc-swift入門",
                abstract: """
gRPCはGoogleが開発したハイパフォーマンスなRPC（Remote Procedure Call）プロトコルです。
Firebase SDKにも組み込まれていて、間接的に使った方も多いと思います。
トークでは、アプリからの通信の選択肢として、RESTやGraphQLに加えてgRPCも選べるように、
gRPC自体の解説、grpc-swiftの開発状況や現状の課題をデモを交えお伝えします。
""",
                startTime: 1535623800,
                seconds: 900,
                twitterLink: "https://twitter.com/tikidunpon",
                twitterName: "tikidunpon"),


        Proposal(id: 90,
                speaker: "ohayoukenchan",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ef7701da-e0d0-411d-a9a5-abb517a0f04f.jpg",
                track: Track.D,
                title: "フロントエンドエンジニアからみたiOS開発",
                abstract: """
最近のWebフロントエンドとiOS開発は似ているところが多いと思います。それぞれ比較してみて何がイケてるのか見ていけたらと思います
内容
仮）
- SwiftとTypesctipt
- ReSwiftとRedux
- async/await
- AutoLayoutとCSS
""",
                startTime: 1535695800,
                seconds: 1800,
                twitterLink: "https://twitter.com/ohayou_kenchan",
                twitterName: "ohayou_kenchan"),


        Proposal(id: 91,
                speaker: "辰濱健一",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/6a4719ad-e814-4525-ba29-66787f5a5623.jpg",
                track: Track.A,
                title: "インドのインターネット環境との戦い方",
                abstract: """
「ギガが足りない？メガが足りないんだ！」

昨年、日本で公開してきたアプリをインドにも公開しました！
日本では問題なく動いているのに、インドでは問題多発。。。

実際にインドに2週間赴いて調査をしてみると、通信環境が日本とは全然違うことが発覚。
そんな環境でもちゃんと動いているアプリは多々あります。

他アプリの挙動からも学んだ、インドの通信環境の攻略法についてお話しします。
""",
                startTime: 1535875500,
                seconds: 300,
                twitterLink: "https://twitter.com/tatsuhama50",
                twitterName: "tatsuhama50"),


        Proposal(id: 92,
                speaker: "hayatan",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/dd2e023c-a137-4426-89c6-bd0a18dbd06d.jpg",
                track: Track.A,
                title: "Rx世界線とリーディングシュタイナー",
                abstract: """
流行のMVVM+RxSwiftは果たしてこのプロダクトに妥当なのか。
もし、導入していれば・・・
もしあのときやめていれば・・・
Rxを導入した世界線と導入しなかった世界線を渡り歩く男たちの話。
""",
                startTime: 1535788500,
                seconds: 300,
                twitterLink: "https://twitter.com/hayatan_",
                twitterName: "hayatan_"),


        Proposal(id: 93,
                speaker: "家庭の医学",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/78b189be-f473-44ca-81b1-2b69e8f0c6aa.jpg",
                track: Track.B,
                title: "コンパイラから紐解くSwift method dispatch",
                abstract: """
Swiftには実行するメソッドを効率的に決定する機構があります。
しかし、静的型付け言語であるにも関わらず動的に決定せざるを得ないパターンや、finalやprivateなどの修飾子がパフォーマンスに影響するパターンなど、実際にはどのような動きをしているのでしょうか。
このトークではSwiftコンパイラの中からその疑問を紐解いていきます。
""",
                startTime: 1535692800,
                seconds: 1800,
                twitterLink: "https://twitter.com/kateinoigakukun",
                twitterName: "kateinoigakukun"),


        Proposal(id: 94,
                speaker: "Takeshi Ihara",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/62a3ba36-c98b-488a-b40a-3370d6af549a.jpg",
                track: Track.A,
                title: "小さくはじめる端末管理",
                abstract: """
残念ながらiOSアプリにはOSや解像度によって挙動が変わってしまうことがあります。検証のために様々な端末を所有している会社も少なくないです。

それらの管理はどうしていますか？解像度やOSを知るためにどうしても管理は必要になってきます。手動管理だと誤ってOSを上げた際に情報の乖離が起きます。

弊社ではMDMを使うほどの規模感ではないので、SlackBotを活用した端末管理方法を紹介します。
""",
                startTime: 1535876100,
                seconds: 300,
                twitterLink: "https://twitter.com/nonchalant0303",
                twitterName: "nonchalant0303"),


        Proposal(id: 95,
                speaker: "yutaabe200",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/a048d9e2-34f9-42d3-80f9-1a6c72b824ca.jpg",
                track: Track.D,
                title: "田舎のWebベンチャー企業にアプリ事業を持ち込んだらこーなった",
                abstract: """
創業2年の新潟のWeb会社に転職し、同時にアプリ事業を持ち込みました。社会人2年目のペーペーが転職と同時にアプリ文化を持ち込んだとき...いわゆる”不毛”と言われる環境下でのスタートでした。
その中でこっそり自社Webメディアを両OSアプリ化した話や、アプリ文化が無い会社組織との付き合い方、アプリに対する相場感やスキル難易度によるギャップなど、新潟のiOSエンジニアならではの苦悩を題材に地方アプリ市場の現状や未来についてお話しします。
""",
                startTime: 1535862600,
                seconds: 900,
                twitterLink: "https://twitter.com/yutaabe200",
                twitterName: "yutaabe200"),


        Proposal(id: 96,
                speaker: "ishkawa",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/0600848a-4bd1-486f-907e-48d86f5d4347.jpg",
                track: Track.A,
                title: "宣言的UICollectionView",
                abstract: """
UICollectionViewに複数の種類のセルがある場合、どのセルがいつ表示されるのか把握するのが難しくなります。この問題を解消する手段の1つには、コンテンツの宣言的な定義が考えられます。

このトークでは、はじめにコンテンツの宣言的な定義の実現方法を説明します。続いて、宣言的な定義を導入した時のコードの見通し、レイアウトの役割分担、差分更新、アニメーションなどの面におけるメリットとデメリットを解説します。
""",
                startTime: 1535695800,
                seconds: 1800,
                twitterLink: "https://twitter.com/_ishkawa",
                twitterName: "_ishkawa"),


        Proposal(id: 97,
                speaker: "ダンボー田中",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/5f9852dc-18b1-4269-b037-d09b5f1c3045.jpg",
                track: Track.A,
                title: "設計時空のリファクタリング〜複数アーキテクチャを抱えたアプリのリファクタリング事例〜",
                abstract: """
長く続くアプリ開発において、複数のアーキテクチャが積層のように負債となってしまうことは、割と多くの現場で起きているのではないでしょうか。
より良い開発をしていくためには負債の返済という、痛みを伴う対応を迫られるときがいつかきます。
このトークでは自分が直近で直面した負債の返済について話をします。
どう返済していったのか、チームとどうやって足並みをそろえたのか、様々な反省をお伝えします。
""",
                startTime: 1535628000,
                seconds: 900,
                twitterLink: "https://twitter.com/ktanaka117",
                twitterName: "ktanaka117"),


        Proposal(id: 98,
                speaker: "ohbarye",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/6cda0ece-614b-4f27-b374-88d58f6d880b.jpg",
                track: Track.B,
                title: "In-App Purchase再考　ーサーバサイドエンジニアの運用経験と他決済手段との比較を添えてー",
                abstract: """
Quipperが開発する学習サービス「スタディサプリ」ではIAP（アプリ内課金）による支払いが可能です。IAPは同サービスで高いシェアを持つ人気決済手段ですが、運用者の立場では他の決済手段と比べて不満がないわけではありません。このトークでは以下のトピックを通じてiOSアプリでの課金手段について再考します。

* サーバサイドエンジニアとしての決済運用経験（障害、サポート）
* 他の決済手段との比較（決済手数料、管理画面の使い勝手）
""",
                startTime: 1535766600,
                seconds: 900,
                twitterLink: "https://twitter.com/ohbarye",
                twitterName: "ohbarye"),


        Proposal(id: 99,
                speaker: "りくそうだ",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ae08bcf1-fd69-48cb-9303-5f083ddae761.jpg",
                track: Track.B,
                title: "OSSを育てながらiOSアプリで「パンくずリスト」を実現した",
                abstract: """
俗に「パンくずリスト」呼ばれる「階層構造での現在位置を上位階層も含めて示したリスト状のUI」をiOSアプリで実現しました。

OSSの選定を行ったところ、多少OSSの改善を行えばプロダクトの用件に適合しそうなことがわかり実装を始めました。
しかし、特定条件でのアニメーションが不自然だったり、特定条件で必ずクラッシュするバグが見つかるなど実際は結構なOSSの改善をしました。
実現までの道筋をストーリー仕立てでお話しします。
""",
                startTime: 1535791200,
                seconds: 300,
                twitterLink: "https://twitter.com/rikusouda",
                twitterName: "rikusouda"),


        Proposal(id: 100,
                speaker: "tarunon",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/3d77e1cd-d5da-469b-8f97-fb3b46bf943c.jpg",
                track: Track.A,
                title: "MicroViewControllerで無限にスケールするiOS開発",
                abstract: """
`MicroViewController`という仕組みを導入したことで我々はメンバーの誰もが経験したことのない開発速度とスケーラビリティを手に入れました。
「10人規模で画面の開発が可能」「全てのVCとVMは500行未満」「手軽に値レベルで実現可能なMock」「50のVCで構成される一画面」
`MicroViewController`を取り入れた画面設計について、我々のベストプラクティスを紹介します。
""",
                startTime: 1535682000,
                seconds: 1800,
                twitterLink: "https://twitter.com/tarunon",
                twitterName: "tarunon"),


        Proposal(id: 101,
                speaker: "kosuke.takahashi",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/89f00967-cd97-4681-a0e3-b7312eaed721.jpg",
                track: Track.B,
                title: "Firebase/RemoteConfigを用いたちょっと変わった運用",
                abstract: """
Wowma!アプリではFirebaseのRemoteConfigを採用しています。使用用途は公式に載っているようなA/Bテストとは違い、お知らせやアップデートの通知という目的で使用しています。
そこで、「RemoteConfigを採用した背景」といったビジネスや運用の側面と「RemoteConfigを実装していく上でつまづいたこと。考えたこと」といった実装の側面の話をしていきます。
""",
                startTime: 1535789100,
                seconds: 300,
                twitterLink: "https://twitter.com/KoH_1011",
                twitterName: "KoH_1011"),


        Proposal(id: 102,
                speaker: "417.72KI",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/683a5825-7a16-4ac0-b99f-bc49f6e3a7ac.jpg",
                track: Track.D,
                title: "プロトコルでStoryboardともっと仲良くなる",
                abstract: """
Storyboardの扱いでしばしば挙げられる問題点の1つとして、文字列を扱う事によるtypoや変更への弱さが挙げられます。
ここではProtocol Oriented Programmingを用いて、そのデメリットをできる限り解消していきます。
""",
                startTime: 1535703000,
                seconds: 900,
                twitterLink: "https://twitter.com/417_72ki",
                twitterName: "417_72ki"),


        Proposal(id: 103,
                speaker: "omochimetaru",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/92281bd9-0bf7-445c-b0d0-0edd6d707dfa.png",
                track: Track.A,
                title: "Swiftのジェネリクスはどうやって動いているのかコンパイラのソースから探る",
                abstract: """
Swiftにはジェネリクスという言語機能があり、
利用時の型が不確定なコードを書くことできます。
Swiftには厳密な型システムや、余計なメタ情報を持たない値型などがあるのに、
どのようにしてジェネリクスを動作させているのでしょうか。
このトークではそれを実現する言語機能である
witness tableについて、
コンパイラのソースコードを追いながら解説します。
""",
                startTime: 1535854800,
                seconds: 1800,
                twitterLink: "https://twitter.com/omochimetaru",
                twitterName: "omochimetaru"),


        Proposal(id: 104,
                speaker: "ukitaka",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/3ee8a36d-568d-498a-ac4c-0a12220ea4cf.jpg",
                track: Track.C,
                title: "Swiftの型システムに入門する  - lib/Semaの歩き方",
                abstract: """
Swiftの型システムを実装するSemaモジュールはswiftcの中でも1番巨大で複雑ですが、普段お世話になっているTypeCheckerの動きがわかるようになったらSwiftへの理解が一歩深まりそうですし、なにより型の話って楽しいですよね！！

このトークではSemaの実装をチョット読めるようになることを目標に、Swiftの型システムがもつ特徴を「型システム入門」や実際の実装を参考にしながら簡単に解説します。
""",
                startTime: 1535701800,
                seconds: 1800,
                twitterLink: "https://twitter.com/ukitaka_",
                twitterName: "ukitaka_"),


        Proposal(id: 105,
                speaker: "Kaoru Matarai",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/93b04c13-31e8-446c-92a4-a7276cc0fa11.jpg",
                track: Track.B,
                title: "ARKit2.0でAppleが伝えたいアプリ体験を考える",
                abstract: """
ARKit2.0では3Dの物体認識や空間の共有から保存など、大幅なアップデートがありました。
従来のARKit1.0やARKit1.5と機能を用いたアプリは計測系の機能がメインでした。
しかし、今回のアップデートで「Measure」アプリが追加されたことにより、開発者は新たな体験を
作る必要が出てきました。Appleがどのような意図を持って開発者にどのような世界観を作って欲しいのか、
このLTで話していければと思います。
""",
                startTime: 1535788800,
                seconds: 300,
                twitterLink: "https://twitter.com/mcz9mm",
                twitterName: "mcz9mm"),


        Proposal(id: 106,
                speaker: "kiwi",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/a78bc12f-5d69-43cf-b2d0-14ac2fdbfda1.jpg",
                track: Track.A,
                title: "iOSマイクロインタラクション入門",
                abstract: """
マイクロインタラクションとは、ユーザーが操作した際に表示される、ちょっとしたアニメーションやフィードバックなどのアクションのことです。
Facebookなどのアプリで積極的に採用されており、自分のアプリにも入れてみたい、という方に向けて、マイクロインタラクションの使いどころや実装例を紹介します。
""",
                startTime: 1535853000,
                seconds: 900,
                twitterLink: "https://twitter.com/koga_wiwi",
                twitterName: "koga_wiwi"),


        Proposal(id: 107,
                speaker: "shiz",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/157dc1bd-cdc7-44d9-9e30-79612dad3a5a.jpg",
                track: Track.A,
                title: "イチから始めるアクセシビリティ ~まずはできるところから~",
                abstract: """
スマホは多くの人にとって生活に欠かせないものとなってきており、様々な環境、境遇の方がアプリに触れる機会も増えています。
そんな時、アクセシビリティは一つの大きなテーマになってくると思います。
- そもそもアクセシビリティとは？
- iOSではどんな機能が提供されているのか？
- アプリに導入するには？
といった基本的な部分に触れ、アクセシビリティに興味を持つきっかけづくりをしたいと思います。
""",
                startTime: 1535789700,
                seconds: 300,
                twitterLink: "https://twitter.com/stzn3",
                twitterName: "stzn3"),


        Proposal(id: 108,
                speaker: "多和田　侑",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/339f21f1-ca23-4038-b4e6-88a2aba8e3c3.jpg",
                track: Track.B,
                title: "再利用可能なUI Componentsを利用したアプリ開発",
                abstract: """
iOSアプリ開発とUIは切っても切り離せない関係ですが、UIの実装には時間がかかります。ですが、Atomic Designの考え方を取り入れ、デザイナーと認識合わせをすれば再利用可能な UI Components を定義することができ、開発速度を上げることができます。
このトークでは、UI Componentsを定義する上でデザイナーと認識合わせしたこと、実装する上で工夫したことを紹介します。
""",
                startTime: 1535625000,
                seconds: 900,
                twitterLink: "https://twitter.com/yuta24",
                twitterName: "yuta24"),


        Proposal(id: 109,
                speaker: "laiso",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ea7cb22c-8f48-4caa-97ff-86361c9f468f.png",
                track: Track.D,
                title: "iOSエンジニアが知るべきProgressive Web Apps開発のエッセンス",
                abstract: """
PWA - Progressive Web Apps はウェブサイトのショートカットをホーム画面に追加するだけの仕組みではありません。
技術・市場の側面からPWAムーブメントの全容を理解し、適切な活用法を知るとともに。
最新ブラウザAPIを使ったプレゼンテーションパターンやJavaScriptとフロントエンドエコシステムをフル活用した「モダンなUI開発」のためのプログラミング環境が持つ可能性についてお話しします。
""",
                startTime: 1535698800,
                seconds: 1800,
                twitterLink: "https://twitter.com/laiso",
                twitterName: "laiso"),


        Proposal(id: 110,
                speaker: "松館 大輝",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/79742550-2cf3-4fc9-8493-c95dc9e727fd.jpg",
                track: Track.B,
                title: "肥大化しがちなアプリの起動経路を整理する",
                abstract: """
通常起動にプッシュ通知、Universal Linksはもちろんのこと、Core SpotlightやWidget、Home Screen Quick Actionには対応してますか？
今年はiOS12でSiri Shortcutが登場。またAppDelegateが肥大化します。
…なんてことがないようにきれいに整理しませんか？
確認に手間がかかる起動経路まわりを効率よく実装するための設計やテストについて具体例を用いて紹介します。
""",
                startTime: 1535695800,
                seconds: 900,
                twitterLink: "https://twitter.com/d_date",
                twitterName: "d_date"),


        Proposal(id: 111,
                speaker: "horita-yuya",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/72ae7ce5-54bc-4177-9f30-9dbc6b2be404.png",
                track: Track.A,
                title: "差分アルゴリズムの原理について",
                abstract: """
TableView, CollectionViewの部分更新の為に、RxDataSources, IGListKitなど、多くのライブラリが開発されて来ました。
それらの内部では、効率的な差分検出のために差分アルゴリズムが使われています。作る側はもちろん、使う側もその原理について理解しておくことは重要です。
今回、Myers, Heckelの2種類の差分アルゴリズムについて解説させて頂きます。
""",
                startTime: 1535701800,
                seconds: 1800,
                twitterLink: "https://twitter.com/Arimasen",
                twitterName: "Arimasen"),


        Proposal(id: 112,
                speaker: "matsuokah",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/a64674a7-f4fc-4cae-979e-0451f7e412f7.jpg",
                track: Track.C,
                title: "二癖くらいある画面収録からの生放送",
                abstract: """
iOS11から可能になった画面収録で生放送機能を実装し、サービスインするまでの実装

- 生放送のするまでの全体フロー
- RPBroadcastSampleHandlerおよび、画面収録のExtensionのライフサイクルについて
- 画面のサンプリングタイミングと生放送の特性について
- SampleBufferの差し替えによる、生放送中の動画の動的な編集
- 動画データの検証ポイント
""",
                startTime: 1535768400,
                seconds: 1800,
                twitterLink: "https://twitter.com/matsuokah_",
                twitterName: "matsuokah_"),


        Proposal(id: 113,
                speaker: "酒井篤",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/fd667335-1677-4d1d-aa6d-0a90ebb8bd3b.jpg",
                track: Track.D,
                title: "海外展開を目指すアプリでセキュアで速い画像と動画の閲覧を実現した話",
                abstract: """
「家族アルバム みてね」は、徐々に国外にユーザーを拡大しています。常に海外での快適な利用が実現されることを意識して開発していますが、その中でもメディアを高速に配信し・閲覧できることは、最重要課題でした。どのように課題を認識・改善したかの知見をお話ししたいと思います。

アジェンダ
1. 認識（NewRelicによる計測）
2. 設計（AWSも含むシステム全体）
3. アプリ実装について
4. 成果とさらなる課題
""",
                startTime: 1535692800,
                seconds: 900,
                twitterLink: "https://twitter.com/_atsushisakai",
                twitterName: "_atsushisakai"),


        Proposal(id: 114,
                speaker: "我妻幸長（Yukinaga Azuma）",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/35cbccf7-04b5-4982-943c-9780a62b0393.jpg",
                track: Track.B,
                title: "iOSと（深層）強化学習",
                abstract: """
強化学習は機械学習の一種で、試行錯誤を通じて「環境における価値を最大化するような行動」を「エージェント」が学習します。強化学習が例えばゲームでうまく機能した場合、次第にゲームの打ち方は開発者の手を離れ、エージェントは開発者自身よりもずっと強くなっていきます。発表では、強化学習の概要、及びSwiftで強化学習をどのように実装できるのか、そして、AlphaGoで注目を浴びた深層強化学習とは何か、について解説します。
""",
                startTime: 1535698800,
                seconds: 1800,
                twitterLink: "https://twitter.com/yuky_az",
                twitterName: "yuky_az"),


        Proposal(id: 115,
                speaker: "Shin",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/b6aa8783-9560-4ecd-87dd-e88647da5266.png",
                track: Track.B,
                title: "iOS WKWebViewの魔改造",
                abstract: """
Content(仮):
* 高速DOM操作 WKWebViewでダークモードを実現する
* WKWebView内の動画再生をAVPlayerに移し替える
* WKWebView内のジェスチャーをコントロールする
* iOS12での変更点 (もしあれば)
* その他 (viewportの強制変更,タップ位置の座標変換, Cookie操作, 広告ブロック, メモリ管理)
""",
                startTime: 1535697000,
                seconds: 900,
                twitterLink: "https://twitter.com/fokotate",
                twitterName: "fokotate"),


        Proposal(id: 116,
                speaker: "今城 善矩",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/f3368e9e-4e4b-450e-bf8f-a28a1e247768.jpg",
                track: Track.B,
                title: "Swiftの生みの親によるasync/await for Swiftを徹底解説し、新しい非同期処理の手法を理解する",
                abstract: """
Swiftの生みの親、クリス氏によって2017年8月にプロポーザルasync/await for Swiftの下書きが公開されました。その内容はコルーチンサポートで、我々はSwiftで非同期処理をより使いやすく読みやすいコードを書けるようになります。このトークはその内容を理解するために、様々な言語で使われるasync/awaitの比較分類、Swift3から使えるasync/awaitライブラリの利用例とその内部実装を解説します！
""",
                startTime: 1535704800,
                seconds: 1800,
                twitterLink: "https://twitter.com/yimajo",
                twitterName: "yimajo"),


        Proposal(id: 117,
                speaker: "稲見 泰宏",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/ce20eaf6-9783-47cc-b194-9f9bc7a162f2.jpg",
                track: Track.C,
                title: "圏論とSwiftへの応用",
                abstract: """
圏論（カテゴリー理論）は、「対象」と対象間の「射」（関係性、構造）の集まりからなる「圏」を抽象的に扱う数学理論です。関数型プログラミングで度々登場する「モノイド」「関手」「自然変換」「モナド」の由来であり、さらには「米田の補題」「随伴」「極限」「F代数」「カン拡張」など、より高度な概念が登場します。この発表では、圏論から得られる様々な帰結について、Swiftの文法と型で分かりやすく解説していきます。
""",
                startTime: 1535868600,
                seconds: 1800,
                twitterLink: "https://twitter.com/inamiy",
                twitterName: "inamiy"),


        Proposal(id: 118,
                speaker: "駒井 覚",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/175884b9-cda4-485d-a17e-29890f1dba57.jpg",
                track: Track.B,
                title: "UITableViewに動画広告を表示する",
                abstract: """
昨今需要が増しているインフィード動画広告を実装したときの勘所について。
UITableViewCellに動画広告を配置し、動画のステータス管理や、
エキスパンドしたときの挙動等について喋ります。
""",
                startTime: 1535792400,
                seconds: 300,
                twitterLink: "https://twitter.com/nihonpanda",
                twitterName: "nihonpanda"),


        Proposal(id: 119,
                speaker: "じんむ",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/58b98b83-9a43-461a-8ef0-9e2b6bd58451.jpg",
                track: Track.B,
                title: "虚無から48時間でiOSアプリをリリースする😴",
                abstract: """
ハッカソンが好きです。24時間で1つのモノを作ることができます。
作ったからにはより多くの人に触ってもらいたい。
そこで、ハッカソン24時間+リリース準備24時間で、
ノーアイデア、ノープランの虚無から、iOSアプリをリリースする過程やコツを簡単にお喋りします。
""",
                startTime: 1535789400,
                seconds: 300,
                twitterLink: "https://twitter.com/koooootake",
                twitterName: "koooootake"),


        Proposal(id: 120,
                speaker: "KBOY@筋肉エンジニア",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/951ea767-53c4-4e80-b771-2ead1080e954.jpg",
                track: Track.A,
                title: "ARKitのための3D算数",
                abstract: """
GraffityというARKitを使ったアプリを作っています。
ARKitやSceneKitは用意されたAPIを使えば色々なことが簡単にできてしまいますが、
高度なことをしようとすると、空間ベクトル、座標変換などの算数(数学)の知識が必要になることに気づくでしょう。
本トークでは、ARKitを使いこなすために自分が勉強した3Dプログラミングと基本的な算数(数学)について分かりやすく説明します。
""",
                startTime: 1535620800,
                seconds: 900,
                twitterLink: "https://twitter.com/kboy_silvergym",
                twitterName: "kboy_silvergym"),


        Proposal(id: 121,
                speaker: "SeiyaMogami",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/8328f5fd-6751-4b1d-91c7-c6b056594564.jpg",
                track: Track.C,
                title: "iOS × GraphQLの嬉しみとつらみ",
                abstract: """
GraphQLを採用したAPIサーバー（Ruby on Rails）、APIサーバー・クライアント間を橋渡しするBFF（Expressサーバー）、クライアントのiOSアプリを開発する中で、見えてきた嬉しみとつらみの話をします。
・GraphQLについてとその魅力
・なぜBFFを挟むのか
・クライアントiOSアプリとBFFのやりとり
この3つの観点で、業務を通じて得た嬉しみとつらみを語ります。インフラ面の話はしません。
""",
                startTime: 1535780400,
                seconds: 900,
                twitterLink: "https://twitter.com/_mogaming",
                twitterName: "_mogaming"),


        Proposal(id: 122,
                speaker: "watura",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/bb4a006e-1d94-4f53-8529-a89b000705b3.jpg",
                track: Track.A,
                title: "iPhone が数秒おきにクラッシュするんだけど！",
                abstract: """
2017年12月1日朝起きたら，Zaim のせいでiPhoneがクラッシュすると Twitter 上で騒がれていました．
前回のリリースから多少は時間がたっていたし，そもそもアプリが iPhone をクラッシュさせるなんてできるの？
本当にZaimのせいだったのか，そもそも何が起こっていたのか．何が原因だったのか．
わかったこと，推測できたこと，喋っても問題なさそうなこと喋ります．
""",
                startTime: 1535766600,
                seconds: 900,
                twitterLink: "https://twitter.com/watura",
                twitterName: "watura"),


        Proposal(id: 123,
                speaker: "Atsuya Sato",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/e3775381-b1a9-4a9f-b10b-82e86274c373.jpg",
                track: Track.A,
                title: "オープンソースMDMのmicromdmを用いて、個人でデバイス管理をやってみる",
                abstract: """
企業におけるデバイス管理手法の一つに、MDMを用いる方法があります。
しかし、有料のMDMソリューションサービスを個人で触るハードルは高く、MDMを試すことができてない人も多いのではないでしょうか。
このトークでは、オープンソースMDMのmicromdmを用いたMDMサービスの立ち上げ方やMDMCertを用いたMDM Push証明書の取得法、API経由でのMDMコマンドの発布について紹介していきます。
""",
                startTime: 1535623800,
                seconds: 900,
                twitterLink: "https://twitter.com/n_atmark",
                twitterName: "n_atmark"),


        Proposal(id: 124,
                speaker: "Shintaro Katafuchi",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/3a108f51-0a5c-44da-bd79-0f55c9ed047b.png",
                track: Track.D,
                title: "iOS×React Nativeのハイブリッド開発現場から伝えたい事",
                abstract: """
QuipperではSwiftとReact Nativeのモジュールを組み合わせてiOSの開発を進めています。
標準を外れた開発体制には数多くの困難が付きまといますがそれらに取り組んでいって得られた知見をお伝えできればと思います。

Agenda:
- 同期
- どこから導入を進めていったか
- 直面した課題
  - データの同期
  - Navigationの実装
- チーム体制
- ハイブリッド開発はアリか？
""",
                startTime: 1535704800,
                seconds: 900,
                twitterLink: "https://twitter.com/hotchemi",
                twitterName: "hotchemi"),


        Proposal(id: 125,
                speaker: "malt03",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/6bb009f9-1abc-489d-8b43-1937b33227e4.jpg",
                track: Track.D,
                title: "macOSでもっとアプリを作ろう",
                abstract: """
趣味でmacOSのネイティブアプリを作ったときの知見を共有します。
macOSのネイティブアプリを作る「意味」「楽しみ」「つらみ」「つらみ」あと「つらみ」の話です。
みんながもっと作ってくれれば、エコシステムやドキュメントが充実して、この世界はもっと幸せになるはずです。
是非聴きに来て、macOSでアプリを作って、できればライブラリも作って、一緒に世界を幸せにしましょう！
""",
                startTime: 1535689800,
                seconds: 1800,
                twitterLink: "https://twitter.com/malt03",
                twitterName: "malt03"),


        Proposal(id: 126,
                speaker: "Adam Henry",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/c7a79fee-50c6-40b2-901c-4d55b0188491.jpg",
                track: Track.A,
                title: "機械学習の初心者がCreateMLでレトロゲームのカート認識",
                abstract: """
最近友達と日本でレトロゲーム探しているんですがなかなか見つからないせいでレトロゲームトラッカーアプリ作ってみたいの話した結果で、
簡単に登録するのは大事でCoreMLのモデル作ってしまえばカートの種類わかるかも。。。やってみようぜ！
WWDC2018で発表されたCreateMLでどこまで使えるのか・初心者に優しいのか色々な意見出したいと思います。
研究はこれからですが、できれば発表したいと思います！
""",
                startTime: 1535792100,
                seconds: 300,
                twitterLink: "https://twitter.com/monolithic_adam",
                twitterName: "monolithic_adam"),


        Proposal(id: 127,
                speaker: "noppe",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/71406225-c58c-4e90-a33b-7b9eaa6d6dbb.jpg",
                track: Track.B,
                title: "ライブ配信アプリのアイテム再生をMetalで実装する事になった話",
                abstract: """
DeNAのライブ配信アプリPocochaで実装した画面全体に再生されるエフェクトの実装の話をします。
iOSでは再生出来ない透過動画の再生を行う実装や、それらの実装の中で利用した巨大なシーケンス画像群の再生に最適なアーキテクチャをAPNG/WEBPなどのフォーマットやUIImageView/OpenGLES/Metalなどのパフォーマンス比較から読み解きます。
""",
                startTime: 1535854800,
                seconds: 1800,
                twitterLink: "https://twitter.com/noppefoxwolf",
                twitterName: "noppefoxwolf"),


        Proposal(id: 128,
                speaker: "さのたけと",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/934cffa9-7f56-4a94-ae15-d0e7829f0341.jpg",
                track: Track.A,
                title: "Swift で数学研究のススメ",
                abstract: """
数学に「結び目理論」という分野がある。「与えられた結び目が解けるか」は最も基本的でありながら極めて難しい問題である。2000年 M.Khovanov によって Jones 多項式の圏論化として Khovanov homology が提唱され、上の問題は判定可能となった。
LT では僕が Swift で開発した Kh. homology 計算プログラムを紹介し、コンピュータ上での実験と観察によって行なっている数学の研究について紹介する。
""",
                startTime: 1535878800,
                seconds: 300,
                twitterLink: "https://twitter.com/taketo1024",
                twitterName: "taketo1024"),


        Proposal(id: 129,
                speaker: "motokiee",
                profileImageURL: "https://fortee.jp//files/iosdc-japan-2018/speaker/0c9fc4e6-6558-46ec-8086-524485b50440.jpg",
                track: Track.A,
                title: "OK Google、Swiftでスマートスピーカーは実装できる？",
                abstract: """
スマートスピーカーが大流行ですが、Swiftで実装できることに気が付いていますか？このトークではスマートスピーカーのアプリケーションを、iOSエンジニアの大好きなSwiftで実装できるように、ライブデモを交えながら解説を行います。
""",
                startTime: 1535874900,
                seconds: 300,
                twitterLink: "https://twitter.com/motokiee",
                twitterName: "motokiee")
    ]
}



