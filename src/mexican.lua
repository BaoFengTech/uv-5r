print ("Fetched mexican")
function build (body, filename, make, model)
	print ("Putting mexican to work...")
	local inf = assert (io.open ("html/head.html", "r"), "Failed to open input file")
	local head = inf:read ("*all")

	local inf = assert (io.open ("html/foot.html", "r"), "Failed to open input file")
	local foot = inf:read ("*all")

	local inf = assert (io.open ("html/donate.html", "r"), "Failed to open input file")
	local donate = inf:read ("*all")
	
	makemodel = make.." "..model
	head = string.gsub (head, "{modelnumber}", string.lower (model))
	
	head = string.gsub (head, "{donate}", donate)
	head = string.gsub (head, '{modelname}', makemodel)
	io.output ("../"..filename..".html")

	io.write (head)
	io.write (body)
	io.write (foot)
	print ("Mexican built your "..filename.." page")
end