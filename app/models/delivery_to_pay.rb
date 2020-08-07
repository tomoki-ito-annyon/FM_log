class Phase < ActiveHash::Base
  self.data = [
      {id: 1, to_pay: '送料込み(出品者負担)'}, {id: 2, status: '着払い(購入者負担)'}
  ]
end