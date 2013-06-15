require 'open-uri'

class Domain < ActiveRecord::Base

  #=== 現在ルータに設定されているIPを取得するメソッド。
  #ddo.jpのトップページに表示されるクライアントのIPをHTMLをパースすることにより
  #取得します。取得するIPは本メソッドを実効した時点でルータに設定されているグローバル
  #IPです。
  #返り値::本メソッドを実効した時点でルータに設定されているグローバルIP
  #
  def get_current_ip
    @html = open("http://ddo.jp").read
    current_ip = parse
  end

  private
  def parse
    if @html =~ /<input type=text name=ip value="(.*)" size=30>/ then
      return $1
    end
  end
end
