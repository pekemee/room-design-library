class AddManyTypesToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :private, :boolean, default:false
    add_column :microposts, :living, :boolean, default:false
    add_column :microposts, :bed, :boolean, default:false
    add_column :microposts, :kitchen, :boolean, default:false
    add_column :microposts, :bath, :boolean, default:false
    add_column :microposts, :entrance, :boolean, default:false
    add_column :microposts, :balcony, :boolean, default:false
    add_column :microposts, :sea, :boolean, default:false
    add_column :microposts, :antique, :boolean, default:false
    add_column :microposts, :modern, :boolean, default:false
    add_column :microposts, :simple, :boolean, default:false
    add_column :microposts, :north, :boolean, default:false
    add_column :microposts, :japan, :boolean, default:false
    add_column :microposts, :girly, :boolean, default:false
  end
end
