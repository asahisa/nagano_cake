class Item < ApplicationRecord

	##カート内商品
	has_many :cart_item
	##注文詳細
	has_many :order_detail

	##ジャンルid　任意
	# belongs_to :genre

  ##ActiveStorage
  ##商品画像id
	has_one_attached :image

	def get_image
		##imageファイル添付されて無い時 (否定形)
		unless image.attached?
			##ファイルパッチ = ルートディレクトリより参照(ディレクトリ名)
			file_path = Rails.root.join(”app/assets/images/no_image.jpg”)
			##デフォルト値として格納(file_pathを開く)、型名: 画像名、ファイルタイプ
			image.attach(io: File.open(file_path), filename: “default-image.jpg”, content_type: “image/jpeg”)
		end
		##最終的に格納されている画像を取得
		image
	end

end
