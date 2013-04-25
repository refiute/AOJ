require 'open-uri'
require 'rexml/document'

class AOJ

	def self.get_url(id,flag=0)
		return nil if id.empty?
		return "<a href=\"http:/judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=#{id}\">#{id}</a><br>" if flag == 1
		xml = open("http://judge.u-aizu.ac.jp/onlinejudge/webservice/problem?id=#{id}&status=false").read
		doc = REXML::Document.new(xml)
		return "<a href=\"http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=#{id}\">#{id} #{doc.elements['problem/name'].text.gsub("\n","")}</a><br>"
	end

	def self.solved_list(user)
		return nil if user.empty?
		slv = [];
		doc = REXML::Document.new(open("http://judge.u-aizu.ac.jp/onlinejudge/webservice/solved_record?user_id=#{user}").read)
		doc.elements.each("solved_record_list/solved/problem_id"){|x| slv<<x.text.gsub("\n","")}
		return slv
	end

	def self.diff(userA,userB,flag=0)
		if userA.empty? or userB.empty?
			return nil
		end
		aslv = self.solved_list(userA)
		bslv = self.solved_list(userB)
		return aslv-bslv if flag == 0
		return bslv-aslv if flag == 1
		return aslv&bslv
	end

end
