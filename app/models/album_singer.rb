class AlbumSinger < ApplicationRecord
  belongs_to :album
  belongs_to :singer
  accepts_nested_attributes_for :singer, reject_if: :all_blank
end
