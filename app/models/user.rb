class User < ApplicationRecord
    validates :mail, presence:true, uniqueness: true, uniqueness: { case_sensitive: false }, format: { with: /\w*@\w*/, message: "アドレスの形式に合っていません" }, length: {minimum:3, maximum:255}
    validates :sendFlag, presence:true
end
