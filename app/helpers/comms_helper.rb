module CommsHelper
  
  def show_comm_users(comm)
    # 中間テーブルから引数のcomm.idに一致するカラムを取得
    comm_users = CommUser.new
    comm_users = CommUser.where(comm_id: comm.id)
    
    # 上記で取得したカラムからuserを取得
    users = Array.new
    comm_users.each do |comm_user|
     users.push(User.find_by(id: comm_user.user_id))
    end
    
    # viewにusersを返却(コミュニティに含まれるuserが入った配列)
    return users
  end
end
