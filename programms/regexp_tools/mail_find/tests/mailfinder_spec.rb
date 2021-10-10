require "rspec"

require_relative "../lib/mailfinder.rb"

describe "MailFinder" do
	# Tests for class

	# For str arg
	it "should return ONE_STR_MAIL" do
		
		expect(
			MailFinder.find_str("There a mail: vojirot683@secbuf.com")
		).to eq(["vojirot683@secbuf.com"])

	end

	it "should return ONE_STR_MAIL_SPECIAL" do
		
		expect(
			MailFinder.find_str("There a mail frucousumeffe-5026@yopmail.com")
		).to eq(["frucousumeffe-5026@yopmail.com"])

	end

	it "should return MULTI_STR_MAIL" do
		
		expect(
			MailFinder.find_str("There a mails dixaugrinneddi-4001@yopmail.com. Maybe brouquoifoilageu-8759@yopmail.com - my mail")
		).to eq(["dixaugrinneddi-4001@yopmail.com", "brouquoifoilageu-8759@yopmail.com"])

	end

	# From files
	it "should return ONE_STR_MAIL_FILE" do
		
		expect(
			MailFinder.find_file "one_mail.txt"
		).to eq(["dixaugrinneddi-4001@yopmail.com"])

	end

	it "should return MULTI_STR_MAIL" do
		
		expect(
			MailFinder.find_file("multi_mail.txt")
		).to eq(["dixaugrinneddi-4001@yopmail.com", "brouquoifoilageu-8759@yopmail.com"])

	end

	it "should return FILE_ABSENCE_EXCEPTION" do
		
		expect(
			MailFinder.find_file("no_file.txt")
		).to eq("No such file - no_file.txt")

	end

	# To files
	it "should write MULTI_STR_MAIL_TO_FILE" do
		
		data = MailFinder.find_file("multi_mail.txt")
		MailFinder.write_file(data, "multi_mail.txt")

		expect(
			MailFinder.find_file("../output/multi_mail.txt")
		).to eq(["dixaugrinneddi-4001@yopmail.com", "brouquoifoilageu-8759@yopmail.com"])

	end

end