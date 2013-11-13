=begin
test code to compare website strings for similarity
=end

=begin
user input function
=end
def prompt(*args)
	puts(*args)
	gets
end

=begin
cleans urls to prepare for comparison, removes ending /, beginning http://www
=end
def clean_url url
	if ( url.end_with? '/' )
		url.chomp!('/')
	end
	if ( url.start_with? 'http://')
		url.slice! 'http://'
	end
	if ( url.start_with? 'https://')
		url.slice! 'https://'
	end
	if ( url.start_with? 'www.' )
		url.slice! 'www.'
	end
	
	return url
end

=begin
compares urls; if they are not exactly the same, user is prompted on which to keep
=end
def compare_urls url1, url2
	if (url1 == url2)
		puts "they are the same"
	else
		while (true)
			puts "Which to keep? Type 'new' or 'old'"
			puts "new: #{url2}"
			puts "old: #{url1}"
			response = gets
			response.strip!
			if ( response == 'new' )
				puts "keeping #{url2}"
				return
			elsif ( response == 'old')
				puts "keeping #{url1}"
				return
			else
				next
			end
		end
	end
end

site_old = prompt "Old site?"
site_old.strip!
site_new = prompt "New site?"
site_new.strip!

clean_url site_old
clean_url site_new

compare_urls site_old, site_new