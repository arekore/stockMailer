class Stock < ApplicationRecord
    validates :name, presence:true, uniqueness: true
    validates :code, presence:true, uniqueness: true, numericality: { only_integer: true }
    validates :sendFlag, presence:true
end
