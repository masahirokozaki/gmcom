module UsersHelper
  def image_for(user)
    if user.image
      image_tag "/user_images/#{user.image}", class: "profile_img"
    else
      image_tag "ph.jpg", class: "profile_img"
    end
  end
  
  def show_comm(user)
    comms_user = CommUser.new
    comms_user = CommUser.where(user_id: user.id)
    return comms_user
  end
  
   def show_comms(user)
    # 中間テーブルから引数のuser.idに一致するカラムを取得
    comms_user = CommUser.new
    comms_user = CommUser.where(user_id: user.id)
    
    # 上記で取得したカラムからcommを取得
    comms = Array.new
    comms_user.each do |comm_user|
     comms.push(Comm.find_by(id: comm_user.comm_id))
    end
    
    # viewにcommsを返却(userが加入しているcomm)
    return comms
  end 
  
  
  
end
