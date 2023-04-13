# じゃんけんを実行する関数
def rps(count)
  hand = 1  # 自分の出す手
  rival_hand = rand(1..4)  # 相手の出す手（1から4の整数値をランダムに生成）
  hand_pattern = ""
  rival_hand_pattern = ""

  puts "グー:1 or チョキ:2 or パー:3 or 逃げる:4"

  # 自分の出す手を選択
  while true
    hand = gets.to_i  # 手を取得
    if hand==1 || hand==2 || hand==3  # グー，チョキ，パーを選択
      if hand==1
        hand_pattern = "グー"
      elsif hand==2
        hand_pattern = "チョキ"
      else
        hand_pattern = "パー"
      end
      if count==0
        puts "ポン！"
      else
        puts "ショ！"
      end
      break   
    elsif hand==4  # 逃げるを選択
      puts "戦いから逃げた！"
      exit  # プログラム終了
    else  # グー，チョキ，パー，逃げる以外を選択
      puts "表示した中から選択してください"
    end
  end

  # 相手の出す手
  if rival_hand==1
    rival_hand_pattern = "グー"
  elsif rival_hand==2
    rival_hand_pattern = "チョキ"
  else
    rival_hand_pattern = "パー"
  end

  # じゃんけんの表示
  puts "--------------------------"
  puts "あなた:#{hand_pattern}を出しました"
  puts "相手:#{rival_hand_pattern}を出しました"
  puts "--------------------------"

  # じゃんけん勝敗の表示
  if hand==1  # 自分がグー
    if rival_hand==1  # 相手がグー
      result = "あいこ"
    elsif rival_hand==2  # 相手がチョキ
      result = "勝ち"
    else  # 相手がパー
      result = "負け"
    end
  elsif hand==2  # 自分がチョキ
    if rival_hand==1
      result = "負け"
    elsif rival_hand==2
      result = "あいこ"
    else
      result = "勝ち"
    end
  else  # 自分がパー
    if rival_hand==1
      result = "勝ち"
    elsif rival_hand==2
      result = "負け"
    else
      result = "あいこ"
    end
  end

  return result
end

# あっち向いてホイを実行する関数
def look_this_way(mode)
  direction = 1  # 自分の指指す（顔向く）方向
  rival_direction = rand(1..4)  # 相手の指差す（顔向く）方向
  direction_pattern = ""
  rival_direction_pattern = ""

  puts "あっち向いて〜"
  puts "上:1 or 下:2 or 左:3 or 右:4"

  # 自分の指差す（顔向く）方向を選択
  while true
    direction = gets.to_i  # 方向を取得
    if direction==1 || direction==2 || direction==3 || direction==4  # 上，下，左，右を選択
      if direction==1
        direction_pattern = "上"
      elsif direction==2
        direction_pattern = "下"
      elsif direction==3
        direction_pattern = "左"
      else
        direction_pattern = "右"
      end
      puts "ホイ！"
      break
    else  # 上，下，左，右以外を選択
      puts "表示した中から選択してください"
    end
  end

  # 相手が指差す（顔向く）方向
  if rival_direction==1
    rival_direction_pattern = "上"
  elsif rival_direction==2
    rival_direction_pattern = "下"
  elsif rival_direction==3
    rival_direction_pattern = "左"
  else
    rival_direction_pattern = "右"
  end

  # あっち向いてホイの表示
  puts "--------------------------"
  puts "あなた:#{direction_pattern}"
  puts "相手:#{rival_direction_pattern}"
  puts "--------------------------"

  # あっち向いてホイ勝敗の表示
  if direction==1 && rival_direction==1  # 自分と相手のどちらも上を選択
    if mode==0  # 自分が指差す側
      result = "勝負に勝ちました"
    else  # 相手が指差す側
      result = "勝負に負けました"
    end
  elsif direction==2 && rival_direction==2
    if mode==0
      result = "勝負に勝ちました"
    else
      result = "勝負に負けました"
    end
  elsif direction==3 && rival_direction==3
    if mode==0
      result = "勝負に勝ちました"
    else
      result = "勝負に負けました"
    end
  elsif direction==4 && rival_direction==4
    if mode==0
      result = "勝負に勝ちました"
    else
      result = "勝負に負けました"
    end
  else
    result = "もう一回"
  end

  return result
end



stalemate_count = 0  # あいこの回数
look_this_way_mode = 0  # 0:自分が指差し，1:相手が指差し

puts "じゃんけん..."
while true
  rps_result = rps(stalemate_count)  # じゃんけん関数の実行
  if rps_result=="勝ち"  # じゃんけん勝ちの場合
    look_this_way_mode = 0  # 自分が指差す側
    look_this_way_result = look_this_way(look_this_way_mode)  # あっち向いてホイ関数の実行
    if look_this_way_result=="勝負に勝ちました"
      puts look_this_way_result
      break
    else  # あっち向いてホイで勝たなかった場合
      stalemate_count = 0  # あいこの回数を初期化
      puts "じゃんけん..."
    end
  elsif rps_result=="負け"  # じゃんけん負けの場合
    look_this_way_mode = 1
    look_this_way_result = look_this_way(look_this_way_mode)
    if look_this_way_result=="勝負に負けました"
      puts look_this_way_result
      break
    else
      stalemate_count = 0
      puts "じゃんけん..."
    end
  else  # じゃんけんあいこの場合
    puts "あいこで..."
    stalemate_count += 1
  end
end